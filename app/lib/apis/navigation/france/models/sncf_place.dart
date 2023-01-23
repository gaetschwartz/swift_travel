import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';

part 'sncf_place.freezed.dart';
part 'sncf_place.g.dart';

@freezed
class SncfPlace with _$SncfPlace implements NavigationCompletion {
  @JsonSerializable(explicitToJson: true)
  const factory SncfPlace({
    required String name,
    String? id,
    String? favoriteName,
  }) = _SncfPlace;
  const SncfPlace._();

  factory SncfPlace.fromJson(Map<String, dynamic> json) =>
      _$SncfPlaceFromJson(json);

  @override
  LocationType get type => LocationType.unknown;

  @override
  String get label => name;

  @override
  GeoCoordinates? get coordinates => null;

  @override
  double? get dist => null;

  @override
  Widget Function(BuildContext context)? get iconBuilder => null;

  @override
  VehicleType get vehicle => VehicleType.unknown;
}
