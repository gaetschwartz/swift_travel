import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/strings/strings.dart';

// ignore: one_member_abstracts
abstract class MLModel<Input, Output> {
  Output predict(Input input);
}

typedef RouteMLModel = MLModel<FullArguments, RoutePrediction>;

class KnnRouteModel implements RouteMLModel {
  const KnnRouteModel();

  @override
  RoutePrediction predict(FullArguments input) =>
      predictRouteSync(input.routes, input.arguments);
}

const _k = 3;

final _newCache = <int, RoutePrediction>{};
RoutePrediction? _getCachedIfPresent(PredictionArguments args) =>
    _newCache[args.hashCode];
RoutePrediction? _setCached(
        PredictionArguments args, RoutePrediction prediction) =>
    _newCache[args.hashCode] = prediction;

/// Cache

RoutePrediction predictRouteSync(
    List<LocalRoute> routes, PredictionArguments arguments) {
  final log = Logger('predictRouteSync');
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

  final distances = <(LocalRoute, ValueVector, double)>[];

  final newRoutes = arguments
      .maybeMap(
        empty: (value) => const UnchangedRouteTransformer(),
        orElse: () => const DoubleFlippedRouteTransformer(),
      )
      .apply(routes);

  final argVect = PrettyVector(
    day: arguments.dateTime?.day,
    minutes: arguments.dateTime?.minutesOfDay,
    name: arguments.mapOrNull(withSource: (value) => value.source),
    position: arguments.mapOrNull(withLocation: (value) => value.latLon),
  ).toVector();

  for (final route in newRoutes) {
    final time = route.timestamp;
    final weekday = time?.weekday;
    final minutes = time?.minutesOfDay;

    final source = route.fromAsString;
    final pos = route.map(v2: (v2) => v2.from.position, v1: (v1) => null);

    final routeVect = PrettyVector(
      day: weekday,
      minutes: minutes,
      name: source,
      position: pos,
    ).toVector();

    distances.add((route, routeVect, routeVect.distanceTo(argVect)));
  }

  distances.sort((a, b) => a.$3.compareTo(b.$3));

  final top = distances.take(_k * newRoutes.length ~/ routes.length);

  if (kDebugMode) _report(top, argVect);

  final prediction = _computeWinner(top, arguments);
  _setCached(arguments, prediction);
  // log.log('Predicting $prediction');

  log.log('Prediction took ${watch.elapsedMilliseconds} ms');

  return prediction;
}

RoutePrediction _computeWinner(
  Iterable<(LocalRoute, ValueVector, double)> top,
  PredictionArguments arguments,
) {
  final map = <LocalRoute, int>{};

  var max = 0;
  var majRoute = top.first.$1;
  var sum = .0;

  for (final r in top) {
    final route = r.$1.copyClean();
    map[route] = (map[route] ?? 0) + 1;
    if (map[route]! > max) {
      max = map[route]!;
      majRoute = route;
    }

    if (r.$1.fromAsString == majRoute.fromAsString &&
        r.$1.toAsString == majRoute.toAsString) {
      sum += r.$3;
    }
  }

  // log.log('Winner is $majRoute with $max votes');

  sum /= _k;

  return RoutePrediction(majRoute, 1 - sum, arguments);
}

void _report(
  Iterable<(LocalRoute, ValueVector, double)> top,
  ValueVector arg,
) {
  Logger.root.log('arg: $arg');
  var i = 0;
  for (final p in top) {
    i++;
    Logger.root.log('[$i] ${p.$1.fromAsString} -> ${p.$1.toAsString}\n${p.$3}');
  }
}

extension on DateTime {
  int get minutesOfDay => hour * 60 + minute;
}

class PrettyVector {
  final int? day;
  final int? minutes;
  final String? name;
  final LatLon? position;

  PrettyVector(
      {required this.day, required this.minutes, this.name, this.position});

  static const daysFactor = 1 / 7;
  static const minutesFactor = 1 / Duration.minutesPerDay;

  ValueVector toVector() => ValueVector(
        [
          DoubleValue((day ?? 0) * daysFactor, 'day', factor: daysFactor),
          DoubleValue((minutes ?? 0) * minutesFactor, 'minutes',
              factor: minutesFactor),
          StringValue(name, 'name'),
          PositionValue(position, 'position'),
        ],
      );
}

abstract class Value<T> {
  final T value;
  final String description;

  Value(this.value, this.description);

  @override
  String toString() => '$value ($description)';

  double distanceTo(Value<T> other);
}

class StringValue extends Value<String?> {
  StringValue(super.value, super.description);

  @override
  double distanceTo(covariant StringValue other) {
    if (value == null || other.value == null) {
      return 0;
    }
    return value!.scaledDistanceTo(other.value!);
  }
}

class DoubleValue extends Value<double> {
  DoubleValue(super.value, super.description, {this.factor = 1});
  final double factor;

  @override
  double distanceTo(covariant DoubleValue other) => value - other.value;
}

class PositionValue extends Value<LatLon?> {
  PositionValue(super.value, super.description);
  static const switzerlandWidth = 350000;

  @override
  double distanceTo(covariant PositionValue other) {
    if (value == null || other.value == null) {
      return 0;
    }
    return value!.distanceTo(other.value!) / switzerlandWidth;
  }
}

class ValueVector {
  final List<Value<dynamic>> values;

  ValueVector(this.values);

  ValueVector.from(Iterable<Value<dynamic>> values) : values = values.toList();

  @override
  String toString() => "(${values.join(', ')})";

  double distanceTo(ValueVector other) {
    return values
        .zip<Value<dynamic>, num>(
            other.values, (a, b) => math.pow(a.distanceTo(b), 2))
        .sum
        .toDouble();
  }
}

extension ListXy<T> on List<T> {
  Iterable<S> zip<R, S>(Iterable<R> other, S Function(T, R) f) sync* {
    var i = 0;
    for (final a in this) {
      yield f(a, other.elementAt(i));
      i++;
    }
  }
}

extension ListPairX<T, U> on List<(T, U)> {
  Map<T, U> toMap() => {
        for (final p in this) p.$1: p.$2,
      };
}

extension ListTripleX<T, U, V> on List<(T, U, V)> {
  Map<T, (U, V)> toMap() => {
        for (final p in this) p.$1: (p.$2, p.$3),
      };

  Map<U, (T, V)> toMap2() => {
        for (final p in this) p.$2: (p.$1, p.$3),
      };

  Map<V, (T, U)> toMap3() => {
        for (final p in this) p.$3: (p.$1, p.$2),
      };
}
