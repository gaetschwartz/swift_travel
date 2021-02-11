import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/models/local_route.dart';

const _k = 5;
const _useKThreshold = 10;
const _minutesPerDay = 24 * 60;

Prediction<LocalRoute?> predictRoute(List<LocalRoute> routes, DateTime dateTime) {
  if (routes.isEmpty) return const Prediction(null, double.negativeInfinity, null);

  final s = <String, int>{};
  final pr = <LocalRoute?>[];

  final time = _timeOfDay(dateTime);
  final dayOfWeek = dateTime.weekday;

  var i = 0;
  for (final r in routes) {
    if (!s.containsKey(r.from)) s[r.from] = ++i;
    if (!s.containsKey(r.to)) s[r.to] = ++i;
    pr.add(r.copyWith(fromI: s[r.from], toI: s[r.to]));
  }

  final List<Pair<LocalRoute?, double>> distances = <Pair<LocalRoute, double>>[];

  for (final r in pr) {
    final dof = r!.timestamp!.weekday;
    final d = math.sqrt(math.pow((dayOfWeek - dof) / 7, 2) +
        math.pow((_timeOfDay(r.timestamp!) - time) / _minutesPerDay, 2));
    distances.add(Pair(r, d));
  }

  distances.sort((a, b) => a.second.compareTo(b.second));

  if (routes.length < _useKThreshold) {
    return Prediction(distances.first.first, 1 - distances.first.second, Arguments(dateTime));
  } else {
    final map = <LocalRoute, int>{};

    final top = distances.take(_k);

    int? max = 0;
    LocalRoute? majRoute;
    for (final r in top) {
      final route = LocalRoute(r.first!.from, r.first!.to);
      map[route] ??= 0;
      map[route] = map[route]! + 1;
      if (map[route]! > max!) {
        max = map[route];
        majRoute = route;
      }
    }
    print('Winner is $majRoute with $max votes');
    var sum = .0;
    for (final r in top) {
      if (r.first!.from == majRoute!.from && r.first!.to == majRoute.to) {
        sum += r.second;
      }
    }

    sum /= _k;

    return Prediction(majRoute, 1 - sum, Arguments(dateTime));
  }
}

int _timeOfDay(DateTime dateTime) {
  final timeOfDay = TimeOfDay.fromDateTime(dateTime);
  return timeOfDay.hour * 60 + timeOfDay.minute;
}

@immutable
class Pair<R, S> {
  final R first;
  final S second;

  const Pair(this.first, this.second);

  @override
  String toString() => 'Pair<$R, $S>($first, $second)';
}

@immutable
class Prediction<T> {
  final T prediction;
  final double confidence;

  final Arguments? arguments;

  const Prediction(this.prediction, this.confidence, this.arguments);

  @override
  String toString() {
    return 'Prediction<$T>($prediction, $confidence, $arguments)';
  }
}

@immutable
class Arguments {
  final DateTime dateTime;

  const Arguments(this.dateTime);

  @override
  String toString() => 'Args($dateTime)';
}
