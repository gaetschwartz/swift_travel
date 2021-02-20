import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/models/state_models.dart';
import 'package:swift_travel/utils/strings/strings.dart';

const _k = 5;

const _daysFactor = 1 / (2 * 7);
const _minutesFactor = 1 / Duration.minutesPerDay;

Prediction<LocalRoute?> predictRoute(
  List<LocalRoute> routes,
  PredictionArguments arguments,
) {
  if (routes.isEmpty) {
    return Prediction(null, 0, arguments);
  }

  final distances = <Pair<LocalRoute, double>>[];

  final time = arguments.dateTime.minutesOfDay;
  final weekday = arguments.dateTime.weekday;

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

  return Prediction(majRoute, 1 - sum, arguments);
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
}

@immutable
class Prediction<T> {
  const Prediction(this.prediction, this.confidence, this.arguments);

  final T prediction;
  final double confidence;
  final PredictionArguments arguments;

  @override
  String toString() {
    return 'Prediction<$T>($prediction, $confidence, $arguments)';
  }
}

@immutable
class PredictionArguments {
  const PredictionArguments(this.dateTime);

  factory PredictionArguments.of(DateTime dateTime, String? source) {
    if (source != null) {
      return SourceDateArguments(dateTime, source);
    } else {
      return PredictionArguments(dateTime);
    }
  }

  final DateTime dateTime;

  @override
  String toString() => 'PredictionArguments(dateTime: $dateTime)';
}

class SourceDateArguments extends PredictionArguments {
  const SourceDateArguments(DateTime dateTime, this.source) : super(dateTime);

  final String source;

  @override
  String toString() => 'SourceDateArguments(dateTime: $dateTime, source: $source)';
}
