import 'dart:math';

import 'package:flutter/foundation.dart';
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

/// Cache

RoutePrediction predictRouteSync(List<LocalRoute> routes, PredictionArguments arguments) {
  if (kDebugMode) {
    print('Making a prediction from arguments $arguments');
  }

  if (routes.isEmpty) {
    print('Empty history, returning empty prediction');
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
      int weekdayDiff(int a, int b) {
        final diff = (a - b).abs();
        return diff > 3 ? 7 - diff : diff;
      }

      int minutesDist(int a, int b) {
        final diff = (a - b).abs();
        return diff > Duration.minutesPerDay / 2 ? Duration.minutesPerDay - diff : diff;
      }

      dist.add(
        WeighedAddend(weekdayDiff(timestamp.weekday, time.weekday) * _daysFactor, 1, "weekdays"),
      );
      dist.add(
        WeighedAddend(minutesDist(timestamp.minutesOfDay, time.minutesOfDay) * _minutesFactor, 1,
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
        // print('Adding dist of $dist for ${route.fromAsString}');
        const fourtyKilometers = 40000;
        dist.add(WeighedAddend(min(1, scaledDist / fourtyKilometers), 4, "position distance"));
      } else {
        continue;
      }
    }

    //  if (kDebugMode) print(dist.overview);

    distances.add(Pair(route, dist.computed));
  }

  distances.sort((a, b) => a.second.value.compareTo(b.second.value));
  final k = _k * newRoutes.length ~/ routes.length;
  final top = distances.take(k);

  if (kDebugMode) {
    int i = 0;
    for (final p in top) {
      i++;
      print('[$i] ${p.first.fromAsString} -> ${p.first.toAsString}\n${p.second.overview}');
    }
  }
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

  // print('Winner is $majRoute with $max votes');

  sum /= _k;

  final prediction = RoutePrediction(majRoute, 1 - sum, arguments);
  _setCached(arguments, prediction);
  // print('Predicting $prediction');
  return prediction;
}

extension on DateTime {
  int get minutesOfDay => hour * 60 + minute;
}
