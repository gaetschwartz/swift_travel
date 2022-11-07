import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

part 'completion.freezed.dart';

/// The response to [NavigationCompletionDelegateApi.complete]
abstract class NavigationCompletion {
  /// Name of the completion
  String get label;

  /// Id of the completion
  String? get id;

  /// Type of the completion
  PlaceType? get type;

  /// If this completion is a favorite, its name.
  String? get favoriteName;

  /// Returns the icon for this completion.
  // ignore: avoid-unused-parameters
  Widget get icon;

  /// Origin of the data, read [DataOrigin].
  DataOrigin get origin;

  /// Coordinates of the completion
  /// (if available)
  Coordinates? get coordinates;

  /// Distance to the query if available
  double? get dist;
}

/// The origin of the completion.
enum DataOrigin {
  /// Comes from the data being in favorites.
  favorites,

  /// Comes from search the history.
  history,

  /// Comes from the data being in online/up-to-date.
  data,

  /// Comes from the current location.
  currentLocation,

  /// Comes from the data being predicted using an ML model.
  prediction,

  /// The data is a sample empty data to indicaate it's loading.
  loading,

  /// Data is a contact
  contacts
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required double lat,
    required double lon,
  }) = _Coordinates;

  const Coordinates._();

  double distanceTo(Coordinates other) {
    const p = pi / 180; // Math.PI / 180
    final a = 0.5 -
        cos((other.lat - lat) * p) / 2 +
        cos(lat * p) *
            cos(other.lat * p) *
            (1 - cos((other.lon - lon) * p)) /
            2;
    return 12742 * asin(sqrt(a)); // 2 * R; R = 6371 km
  }
}
