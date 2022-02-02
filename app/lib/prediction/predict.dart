import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/ml_models.dart';
import 'package:swift_travel/prediction/models/models.dart';

typedef JSON = Map<String, Object?>;

// ignore: todo, flutter_style_todos
// TODO: In the future, we should create a separate [Isolate] instead of spawning one each time.

/// Prediction

Future<RoutePrediction> predictRoute(
  List<LocalRoute> routes,
  PredictionArguments arguments, {
  bool useIsolate = true,
}) async {
  if (useIsolate) {
    return predictRouteSync(routes, arguments);
  } else {
    final computed = await compute(_predictRouteJSON, FullArguments(routes, arguments).toJson());
    return RoutePrediction.fromJson(computed);
  }
}

JSON _predictRouteJSON(JSON input) {
  final full = FullArguments.fromJson(input);
  final routePrediction = const KnnRouteModel().predict(full);
  return routePrediction.toJson();
}
