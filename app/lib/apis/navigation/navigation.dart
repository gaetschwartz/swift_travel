import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/apis/navigation/sncf/sncf.dart';

import 'models/stationboard.dart';

part 'navigation.freezed.dart';

@immutable
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
  final T Function(Reader config) create;
  final NavigationApiId id;

  String get shortDesc => '$countryEmoji $shortName';
}

final factories = <String, NavigationApiFactory>{
  'sbb': searchChApi,
  'sncf': sncfFactory,
};

@freezed
class NavigationApiId with _$NavigationApiId {
  const factory NavigationApiId(String id) = _NavigationApiId;
}

abstract class BaseNavigationApi {
  Locale locale = const Locale('en');

  static NavigationApiFactory getFactory(NavigationApiId id) => factories[id.id] ?? searchChApi;

  Future<List<Completion>> complete(
    String string, {
    bool showCoordinates,
    bool showIds,
    bool noFavorites,
    bool filterNull,
  });

  Future<List<Completion>> findStation(
    double lat,
    double lon, {
    int accuracy,
    bool showCoordinates,
    bool showIds,
  });

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

  Future<NavRoute> rawRoute(Uri query);
}
