import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/predict/models/models.dart';
import 'package:swift_travel/utils/strings/strings.dart';

const _k = 5;

const _daysFactor = 1 / (2 * 7);
const _minutesFactor = 1 / Duration.minutesPerDay;

final _cache = <PredictionArguments, RoutePrediction>{};

Future<RoutePrediction> predictRoute(
  List<LocalRoute> routes,
  PredictionArguments arguments,
) async {
  final full = FullArguments(routes, arguments);
  final computed = await compute(_predictRouteSimple, full.toJson());
  return RoutePrediction.fromJson(computed);
}

Map<String, dynamic> _predictRouteSimple(Map<String, dynamic> input) {
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
    return RoutePrediction(null, 0, arguments);
  }

  final cachedPrediction = _cache[arguments];
  if (cachedPrediction != null) {
    return cachedPrediction;
  }

  final time = arguments.dateTime?.minutesOfDay;
  final weekday = arguments.dateTime?.weekday;

  final distances = <Pair<LocalRoute, num>>[];

  for (final route in routes) {
    var sqrdDist = .0;

    if (time != null && weekday != null) {
      sqrdDist += math.pow((route.timestamp!.weekday - weekday) * _daysFactor, 2);
      sqrdDist += math.pow((route.timestamp!.minutesOfDay - time) * _minutesFactor, 2);
    }

    if (arguments is SourceDateArguments) {
      sqrdDist += math.pow(arguments.source.scaledDistanceTo(route.fromAsString), 2);
    }

    if (arguments is LocationArgument) {
      final pos = route.maybeMap(v2: (v2) => v2.to.position, orElse: () => null);
      if (pos != null) {
        final dist = arguments.latLon.scaledDistanceTo(pos);
        print('Adding dist of $dist');
        sqrdDist += math.pow(dist, 2);
      }
    }

    distances.add(Pair(route, sqrdDist));
  }

  final top = distances.take(_k).toList(growable: false)
    ..sort((a, b) => a.second.compareTo(b.second));

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
  _cache[arguments] = prediction;
  return prediction;
}

extension on DateTime {
  int get minutesOfDay => hour * 60 + minute;
}

@immutable
class Pair<R, S> {
  const Pair(this.first, this.second);

  final R first;
  final S second;

  @override
  String toString() => 'Pair<$R, $S>($first, $second)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Pair<R, S> && other.first == first && other.second == second;
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}
