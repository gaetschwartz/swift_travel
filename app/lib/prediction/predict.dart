import 'dart:async';
import 'dart:isolate';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/utils/strings/strings.dart';

typedef JSON = Map<String, Object?>;

// ignore: todo
/// TODO: In the future, we should create a separate [Isolate] instead of spawning one each time.

const _k = 5;

const _daysFactor = 1 / 7;
const _minutesFactor = 1 / Duration.minutesPerDay;

/// Cache

final _newCache = <int, RoutePrediction>{};
RoutePrediction? _getCachedIfPresent(PredictionArguments args) => _newCache[args.hashCode];
RoutePrediction? _setCached(PredictionArguments args, RoutePrediction prediction) =>
    _newCache[args.hashCode] = prediction;

/// Prediction

Future<RoutePrediction> predictRoute(
  List<LocalRoute> routes,
  PredictionArguments arguments,
) async {
  final full = FullArguments(routes, arguments);
  final json = full.toJson();
  final computed = await compute(_predictRouteJSON, json);
  return RoutePrediction.fromJson(computed);
}

JSON _predictRouteJSON(JSON input) {
  final full = FullArguments.fromJson(input);
  final routePrediction = predictRouteSync(full.routes, full.arguments);
  return routePrediction.toJson();
}

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

  final distances = <Pair<LocalRoute, num>>[];

  final routesTransformer = RoutesTransformer.fromArguments(arguments);
  final newRoutes = routesTransformer.transform(routes).toList(growable: false);
  for (final route in newRoutes) {
    var sqrdDist = .0;

    final timestamp = route.timestamp;
    final time = arguments.dateTime;
    if (time != null && timestamp != null) {
      sqrdDist += math.pow((timestamp.weekday - time.weekday) * _daysFactor, 2);
      sqrdDist += math.pow((timestamp.minutesOfDay - time.minutesOfDay) * _minutesFactor, 2);
    }

    if (arguments is SourceDateArguments) {
      sqrdDist += math.pow(arguments.source.scaledDistanceTo(route.fromAsString), 2);
    }

    if (arguments is LocationArgument) {
      final pos = route.maybeMap(v2: (v2) => v2.from.position, orElse: () => null);
      if (pos != null) {
        final dist = arguments.latLon.scaledDistanceTo(pos);
        // print('Adding dist of $dist for ${route.fromAsString}');
        sqrdDist += dist;
      } else {
        continue;
      }
    }

    distances.add(Pair(route, sqrdDist));
  }

  distances.sort((a, b) => a.second.compareTo(b.second));
  final top = distances.take((_k * newRoutes.length / routes.length).round());

  if (kDebugMode) {
    print(top.map((e) => '${e.first.fromAsString} -> ${e.first.toAsString}').join('\n'));
  }
  final map = <LocalRoute, int>{};

  var max = 0;
  var majRoute = top.first.first;
  var sum = .0;

  for (final r in top) {
    final route = r.first.copyClean();
    map[route] ??= 0;
    map[route] = map[route]! + 1;
    if (map[route]! > max) {
      max = map[route]!;
      majRoute = route;
    }

    if (r.first.fromAsString == majRoute.fromAsString &&
        r.first.toAsString == majRoute.toAsString) {
      sum += r.second;
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
