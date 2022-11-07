import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';

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
  DataOrigin get origin => DataOrigin.data;

  @override
  PlaceType? get type => null;

  @override
  String get label => name;

  @override
  Widget get icon => SbbIcon(type);

  @override
  Coordinates? get coordinates => null;

  @override
  // TODO: implement dist
  double? get dist => null;
}
