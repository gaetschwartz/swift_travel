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

/// Factor for weekdays, it's a max of 4 days of difference
const _daysFactor = 1 / 4;
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
        final scaledDist = arguments.latLon.scaledDistanceTo(pos);
        // print('Adding dist of $dist for ${route.fromAsString}');
        dist.add(WeighedAddend(scaledDist, 1, "position distance"));
      }
    }

    if (kDebugMode) print(dist.overview);

    distances.add(Pair(route, dist.value));
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

class Sum {
  final List<Addend> addends = [];
  final bool squareRoot;

  Sum({this.squareRoot = false});

  void add(Addend addend) => addends.add(addend);

  /// Returns the sum, computionnally expensive so only used once all addends are added.
  double get value => addends.fold(
      0,
      squareRoot
          ? (previousValue, element) => previousValue + math.sqrt(element.value)
          : (previousValue, element) => previousValue + (element.value));

  String get overview {
    final s = value;
    final b = StringBuffer("Overview of sum:");
    for (var i = 0; i < addends.length; i++) {
      final a = addends[i];
      b.writeln("  ${a.name}: \t ${a.repr} (${(100 * a.value / s).toStringAsFixed(2)}%)");
    }
    return b.toString();
  }
}

class ComputedSum extends Sum {
  ComputedSum(this.sum, {bool squareRoot = false}) : super(squareRoot: squareRoot);

  final Sum sum;

  @override
  List<Addend> get addends => sum.addends;

  @override
  late final double value = sum.value;

  @override
  void add(Addend addend) {
    throw UnsupportedError("Can't add on a Computed sum");
  }
}

abstract class Addend {
  const Addend(this.name);

  double get value;
  final String name;

  String get repr;
}

class WeighedAddend extends Addend {
  const WeighedAddend(this._value, this.weight, String name) : super(name);

  final double _value;
  final double weight;

  @override
  double get value => _value * weight;

  @override
  String toString() {
    return "WeighedAddend($_value, $weight, $name)";
  }

  @override
  String get repr => "$_value*$weight=$value";
}

extension on DateTime {
  int get minutesOfDay => hour * 60 + minute;
}
