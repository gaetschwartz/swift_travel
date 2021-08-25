import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

/// The response to [BaseNavigationApi.complete]
abstract class NavigationCompletion {
  /// Name of the completion
  String get label;

  /// Distance in meters from the query (if available)
  double? get dist;

  /// Id of the completion
  String? get id;

  /// Type of the completion
  TransportationMode? get type;

  /// If this completion is a favorite, its name.
  String? get favoriteName;

  /// Returns the icon for this completion.
  // ignore: avoid-unused-parameters
  Widget getIcon({double? size});

  /// Origin of the data, read [DataOrigin].
  DataOrigin get origin;
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
