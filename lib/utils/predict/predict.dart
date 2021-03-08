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

final _cache = <int, RoutePrediction>{};

Future<RoutePrediction> predictRoute(
  List<LocalRoute> routes,
  PredictionArguments arguments,
) async {
  final full = FullArguments(routes, arguments);
  final computed = await compute(predictRouteSimple, full.toJson());
  return RoutePrediction.fromJson(computed);
}

Map<String, dynamic> predictRouteSimple(Map<String, dynamic> input) {
  final full = FullArguments.fromJson(input);
  final routePrediction = predictRouteSync(full.routes, full.arguments);
  return routePrediction.toJson();
}

RoutePrediction predictRouteSync(List<LocalRoute> routes, PredictionArguments arguments) {
  if (routes.isEmpty) {
    return RoutePrediction(null, 0, arguments);
  }

  final time = arguments.dateTime.minutesOfDay;
  final roundedTime = time - time % 5;

  final cachedPrediction = _cache[roundedTime];
  if (cachedPrediction != null) {
    return cachedPrediction;
  }

  final weekday = arguments.dateTime.weekday;
  final distances = <Pair<LocalRoute, double>>[];

  for (final route in routes) {
    var sqrdDist = math.pow((weekday - route.timestamp!.weekday) * _daysFactor, 2) +
        math.pow((route.timestamp!.minutesOfDay - time) * _minutesFactor, 2);

    if (arguments is SourceDateArguments) {
      sqrdDist += math.pow(arguments.source.scaledDistanceTo(route.from), 2);
    }

    distances.add(Pair(route, sqrdDist.toDouble()));
  }

  distances.sort((a, b) => a.second.compareTo(b.second));

  final map = <LocalRoute, int>{};

  final top = distances.take(_k);

  var max = 0;
  var majRoute = top.first.first;
  for (final r in top) {
    final route = LocalRoute(r.first.from, r.first.to);
    map[route] ??= 0;
    map[route] = map[route]! + 1;
    if (map[route]! > max) {
      max = map[route]!;
      majRoute = route;
    }
  }

  // print('Winner is $majRoute with $max votes');

  var sum = .0;
  for (final r in top) {
    if (r.first.from == majRoute.from && r.first.to == majRoute.to) {
      sum += r.second;
    }
  }
  sum /= _k;

  final prediction = RoutePrediction(majRoute, 1 - sum, arguments);
  _cache[roundedTime] = prediction;
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
