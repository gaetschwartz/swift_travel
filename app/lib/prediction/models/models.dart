import 'package:collection/collection.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class RoutePrediction with _$RoutePrediction {
  @JsonSerializable(explicitToJson: true)
  const factory RoutePrediction(
    @LocalRouteConverter() LocalRoute? prediction,
    double confidence,
    PredictionArguments arguments,
  ) = _RoutePrediction;

  factory RoutePrediction.empty(PredictionArguments arguments) =>
      RoutePrediction(null, 0, arguments);

  factory RoutePrediction.fromJson(Map<String, dynamic> json) =>
      _$RoutePredictionFromJson(json);
}

@freezed
class FullArguments with _$FullArguments {
  @JsonSerializable(explicitToJson: true)
  const factory FullArguments(
    List<LocalRoute> routes,
    PredictionArguments arguments,
  ) = _FullArguments;

  factory FullArguments.fromJson(Map<String, dynamic> json) =>
      _$FullArgumentsFromJson(json);
}

@freezed
class PredictionArguments with _$PredictionArguments {
  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments.empty({required DateTime? dateTime}) =
      EmptyArgument;

  const PredictionArguments._();

  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments.withSource(String source,
      {required DateTime? dateTime}) = SourceDateArguments;

  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments.withLocation(LatLon latLon,
      {required DateTime? dateTime}) = LocationArgument;

  factory PredictionArguments.from(DateTime dateTime,
      {String? source, LatLon? pos}) {
    if (pos != null) {
      return PredictionArguments.withLocation(pos, dateTime: dateTime);
    }
    if (source != null) {
      return PredictionArguments.withSource(source, dateTime: dateTime);
    }
    return PredictionArguments.empty(dateTime: dateTime);
  }

  factory PredictionArguments.fromJson(Map<String, dynamic> json) =>
      _$PredictionArgumentsFromJson(json);

  PredictionArguments round([int minutes = 5]) {
    final dt = dateTime;
    if (dt == null) {
      return this;
    }

    return copyWith(
      dateTime: DateTime(
        dt.year,
        dt.month,
        dt.day,
        dt.hour,
        dt.minute - dt.minute % minutes,
      ),
    );
  }
}

// ignore: one_member_abstracts
abstract class IterableTransformer<T> {
  Iterable<T> apply(Iterable<T> iterable);
}

@immutable
class DoubleFlippedRouteTransformer implements IterableTransformer<LocalRoute> {
  const DoubleFlippedRouteTransformer();

  @override
  Iterable<LocalRoute> apply(Iterable<LocalRoute> routes) sync* {
    for (final e in routes) {
      yield e;
      yield e.flipped;
    }
  }
}

@immutable
class UnchangedRouteTransformer implements IterableTransformer<LocalRoute> {
  const UnchangedRouteTransformer();

  @override
  Iterable<LocalRoute> apply(Iterable<LocalRoute> routes) => routes;
}

@freezed
class Pair<R, S> with _$Pair<R, S> {
  const factory Pair(R first, S second) = _Pair;
  const Pair._();

  Pair<S, R> get flipped => Pair<S, R>(second, first);
}

@freezed
class Triple<R, S, T> with _$Triple<R, S, T> {
  const factory Triple(R first, S second, T third) = _Triple;
}

class Completion implements NavigationCompletion {
  @override
  final String? id;
  @override
  final String label;
  final String? displayName;
  @override
  final PlaceType type;
  final DataOrigin origin;
  @override
  final double? dist;
  @override
  final Widget Function(BuildContext)? iconBuilder;
  @override
  final GeoCoordinates? coordinates;

  const Completion({
    required this.id,
    required this.label,
    required this.displayName,
    required this.type,
    required this.origin,
    required this.dist,
    required this.iconBuilder,
    required this.coordinates,
  });

  factory Completion.from(
    NavigationCompletion completion, {
    required DataOrigin origin,
    String? favoriteName,
  }) =>
      Completion(
        id: completion.id,
        label: completion.label,
        type: completion.type,
        origin: origin,
        dist: completion.dist,
        iconBuilder: completion.iconBuilder,
        displayName: favoriteName,
        coordinates: completion.coordinates,
      );

  factory Completion.fromApi(NavigationCompletion completion) =>
      Completion.from(completion, origin: DataOrigin.api);

  factory Completion.fromFavoriteStop(FavoriteStop stop) => Completion(
        id: stop.id,
        label: stop.stop,
        type: PlaceType.station,
        origin: DataOrigin.favorites,
        dist: null,
        iconBuilder: null,
        displayName: stop.name,
        coordinates: null,
      );

  static const currentLocation = Completion(
    id: null,
    label: '%current_location%',
    type: PlaceType.address,
    origin: DataOrigin.currentLocation,
    dist: null,
    iconBuilder: null,
    displayName: null,
    coordinates: null,
  );

  // factory Completion.fromContact(Contact contact) {
  //   final a = contact.postalAddresses.firstOrNull;
  //   final address = [
  //     a?.street,
  //     a?.postcode,
  //     a?.city,
  //     a?.country,
  //   ].whereNotNull().join(', ');
  //   return Completion(
  //     id: null,
  //     type: PlaceType.address,
  //     origin: DataOrigin.contacts,
  //     dist: null,
  //     iconBuilder: null,
  //     displayName:
  //         contact.displayName ?? '${contact.givenName} ${contact.familyName}',
  //     label: address,
  //     coordinates: null,
  //   );
  // }
}

class ContactCompletion extends Completion {
  final Contact contact;

  ContactCompletion(this.contact)
      : super(
          id: null,
          label: contact.postalAddresses.firstOrNull?.toString() ?? 'null',
          type: PlaceType.address,
          origin: DataOrigin.contacts,
          dist: null,
          iconBuilder: null,
          displayName: contact.displayName ??
              '${contact.givenName} ${contact.familyName}',
          coordinates: null,
        );
}
