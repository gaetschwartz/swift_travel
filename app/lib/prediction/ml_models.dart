import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/utils/math.dart';
import 'package:swift_travel/utils/strings/strings.dart';

abstract class MLModel<Input, Output> {
  Output predict(Input input);
}

typedef RouteMLModel = MLModel<FullArguments, RoutePrediction>;

class KnnRouteModel implements RouteMLModel {
  const KnnRouteModel();

  @override
  RoutePrediction predict(FullArguments input) => predictRouteSync(input.routes, input.arguments);
}

const _k = 5;

/// Factor for weekdays, it's a max of 4 days of difference
const _daysFactor = 1 / 4;
const _minutesFactor = 1 / Duration.minutesPerDay;

final _newCache = <int, RoutePrediction>{};
RoutePrediction? _getCachedIfPresent(PredictionArguments args) => _newCache[args.hashCode];
RoutePrediction? _setCached(PredictionArguments args, RoutePrediction prediction) =>
    _newCache[args.hashCode] = prediction;

int _minutesDist(int a, int b) {
  final diff = (a - b).abs();
  return diff > Duration.minutesPerDay / 2 ? Duration.minutesPerDay - diff : diff;
}

int _weekdayDiff(int a, int b) {
  final diff = (a - b).abs();
  return diff > 3 ? 7 - diff : diff;
}

/// Cache

RoutePrediction predictRouteSync(List<LocalRoute> routes, PredictionArguments arguments) {
  if (kDebugMode) log.log('Making a prediction from arguments $arguments');
  final watch = Stopwatch()..start();

  if (routes.isEmpty) {
    log.log('Empty history, returning empty prediction');
    return RoutePrediction.empty(arguments);
  }

  final cachedPrediction = _getCachedIfPresent(arguments);
  if (cachedPrediction != null) {
    return cachedPrediction;
  }

  final distances = <Pair<LocalRoute, ComputedSum>>[];

  final newRoutes = arguments
      .maybeMap(
        empty: (value) => const UnchangedRouteTransformer(),
        orElse: () => const DoubleFlippedRouteTransformer(),
      )
      .apply(routes);
  for (final route in newRoutes) {
    final dist = Sum();

    final timestamp = route.timestamp;
    final time = arguments.dateTime;
    if (time != null && timestamp != null) {
      dist.add(
        WeighedAddend(_weekdayDiff(timestamp.weekday, time.weekday) * _daysFactor, 1, "weekdays"),
      );
      dist.add(
        WeighedAddend(_minutesDist(timestamp.minutesOfDay, time.minutesOfDay) * _minutesFactor, 1,
            "minutes of day"),
      );
    }

    if (arguments is SourceDateArguments) {
      dist.add(WeighedAddend(
          arguments.source.scaledDistanceTo(route.fromAsString), 1, "string distance"));
    }

    if (arguments is LocationArgument) {
      final pos = route.map(v2: (v2) => v2.from.position, v1: (v1) => null);
      if (pos != null) {
        final scaledDist = arguments.latLon.distanceTo(pos);
        // log.log('Adding dist of $dist for ${route.fromAsString}');
        const fourtyKilometers = 40000;
        dist.add(WeighedAddend(math.min(1, scaledDist / fourtyKilometers), 4, "position distance"));
      } else {
        continue;
      }
    }

    distances.add(Pair(route, dist.computed));
  }

  distances.sort((a, b) => a.second.value.compareTo(b.second.value));

  final top = distances.take(_k * newRoutes.length ~/ routes.length);

  if (kDebugMode) _report(top);

  final prediction = _computeWinner(top, arguments);
  _setCached(arguments, prediction);
  // log.log('Predicting $prediction');

  log.log("Prediction took ${watch.elapsedMilliseconds} ms");

  return prediction;
}

RoutePrediction _computeWinner(
  Iterable<Pair<LocalRoute, ComputedSum>> top,
  PredictionArguments arguments,
) {
  final map = <LocalRoute, int>{};

  var max = 0;
  var majRoute = top.first.first;
  var sum = .0;

  for (final r in top) {
    final route = r.first.copyClean();
    map[route] = (map[route] ?? 0) + 1;
    if (map[route]! > max) {
      max = map[route]!;
      majRoute = route;
    }

    if (r.first.fromAsString == majRoute.fromAsString &&
        r.first.toAsString == majRoute.toAsString) {
      sum += r.second.value;
    }
  }

  // log.log('Winner is $majRoute with $max votes');

  sum /= _k;

  return RoutePrediction(majRoute, 1 - sum, arguments);
}

void _report(Iterable<Pair<LocalRoute, ComputedSum>> top) {
  int i = 0;
  for (final p in top) {
    i++;
    log.log('[$i] ${p.first.fromAsString} -> ${p.first.toAsString}\n${p.second.overview}');
  }
}

extension on DateTime {
  int get minutesOfDay => hour * 60 + minute;
}
