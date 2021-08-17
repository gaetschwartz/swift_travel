import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/ml_models.dart';
import 'package:swift_travel/prediction/models/models.dart';

typedef JSON = Map<String, Object?>;

// ignore: todo
// TODO: In the future, we should create a separate [Isolate] instead of spawning one each time.

/// Prediction

Future<RoutePrediction> predictRoute(
  List<LocalRoute> routes,
  PredictionArguments arguments, {
  RouteMLModel model = const KnnRouteModel(),
}) async {
  final full = FullArguments(routes, arguments);
  final json = full.toJson();
  final computed = await compute(_predictRouteJSON, json);
  return RoutePrediction.fromJson(computed);
}

JSON _predictRouteJSON(JSON input) {
  final full = FullArguments.fromJson(input);
  final routePrediction = const KnnRouteModel().predict(full);
  return routePrediction.toJson();
}
