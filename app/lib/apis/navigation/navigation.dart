import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/apis/navigation/sncf/sncf.dart';

import 'models/stationboard.dart';

part 'navigation.freezed.dart';

typedef Create<T> = T Function(Reader reader);

@immutable

/// A factory that alllows to obtain an instance of a Navigation API including its details.
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

  static final factories = <NavigationApiFactory>[searchChApi, sncfFactory];

  static final defaultFactory = searchChApi;

  static NavigationApiFactory<BaseNavigationApi> fromId(NavigationApiId id) => factories.firstWhere(
        (f) => f.id.value == id.value,
        orElse: () => defaultFactory,
      );
}

@freezed

/// Class containing a single String value representing an ID of a Navigation API.
class NavigationApiId with _$NavigationApiId {
  const factory NavigationApiId(String value) = _NavigationApiId;
}

/// Base class for any Navigation API.
abstract class BaseNavigationApi {
  Locale locale = const Locale('en');

  /// Returns an autocompletion based on the provided query [string].
  Future<List<Completion>> complete(
    String string, {
    bool showCoordinates,
    bool showIds,
    bool noFavorites,
    bool filterNull,
  });

  /// Returns a list of stations close to the provided [lat] and [lon].
  Future<List<Completion>> findStation(
    double lat,
    double lon, {
    int accuracy,
    bool showCoordinates,
    bool showIds,
  });

  /// Returns a timetable for a provided station (aka stop).
  Future<StationBoard> stationboard(
    Stop stop, {
    DateTime when,
    bool arrival,
    int limit,
    bool showTracks,
    bool showSubsequentStops,
    bool showDelays,
    bool showTrackchanges,
    List<TransportationTypes> transportationTypes,
  });

  /// Returns a route from [departure] to [arrival].
  Future<NavRoute> route(
    String departure,
    String arrival, {
    required DateTime date,
    required TimeOfDay time,
    TimeType typeTime,
    bool showDelays,
    int previous,
  });

  void dispose();

  /// This method is used internally and should be used in [route] once the url to query has been built.
  Future<NavRoute> rawRoute(Uri query);
}
