import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'france/france.dart';
import 'models/completion.dart';
import 'models/route.dart';
import 'models/stationboard.dart';
import 'switzerland/switzerland.dart';

part 'navigation.freezed.dart';

typedef Create<T> = T Function(Ref ref);

@immutable

/// A factory that alllows to obtain an instance of a Navigation API
/// including its details.
class NavigationApiFactory<T extends BaseNavigationApi> {
  const NavigationApiFactory(
    this.create, {
    required this.name,
    required this.shortName,
    required this.countryEmoji,
    required this.countryName,
    required this.id,
  });

  final String name;
  final String shortName;
  final String countryEmoji;
  final String countryName;
  final Create<T> create;
  final NavigationApiId id;

  String get shortDesc => '$countryEmoji $shortName';

  static const factories = <NavigationApiFactory>[searchChApi, sncfFactory];

  static NavigationApiFactory get defaultFactory => searchChApi;

  static NavigationApiFactory<BaseNavigationApi> fromId(NavigationApiId id) =>
      factories.firstWhere(
        (f) => f.id.value == id.value,
        orElse: () => defaultFactory,
      );
}

@freezed

/// Class containing a single String value representing
/// an ID of a Navigation API.
class NavigationApiId with _$NavigationApiId {
  const factory NavigationApiId(String value) = _NavigationApiId;
}

/// Base class for any Navigation API.
abstract class BaseNavigationApi implements NavigationCompletionDelegateApi {
  Locale get locale;
  set locale(Locale locale);

  /// Returns a list of stations close to the provided [lat] and [lon].
  Future<List<NavigationCompletion>> find(double lat, double lon);

  /// Returns a timetable for a provided station (aka stop).
  Future<StationBoard> stationboard(
    Stop stop, {
    DateTime? when,
    SearchChMode mode = SearchChMode.departure,
    List<TransportationTypes> transportationTypes = const [],
  });

  /// Returns a route from [departure] to [arrival].
  Future<NavRoute> route(
    String departure,
    String arrival, {
    required DateTime date,
    required TimeOfDay time,
    SearchChMode timeType = SearchChMode.arrival,
  });

  @override
  void dispose();

  /// This method is used internally and should be used in [route]
  /// once the url to query has been built.
  Future<NavRoute> rawRoute(Uri query);
}

class NavigationApiException implements Exception {
  final String message;

  NavigationApiException(this.message);

  @override
  String toString() => 'NavigationApiException: $message';
}

abstract class NavigationCompletionDelegateApi {
  /// Returns an autocompletion based on the provided query [query].
  Future<List<NavigationCompletion>> complete(String query,
      {bool showCoordinates, bool showIds});

  @mustCallSuper
  void dispose() {}
}
