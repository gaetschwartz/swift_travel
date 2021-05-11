import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';

part 'sncf_place.freezed.dart';
part 'sncf_place.g.dart';

@freezed
class SncfPlace with _$SncfPlace, Completion {
  @JsonSerializable(explicitToJson: true)
  const factory SncfPlace({
    required String name,
    String? id,
    String? favoriteName,
  }) = _SncfPlace;
  const SncfPlace._();

  factory SncfPlace.fromJson(Map<String, dynamic> json) => _$SncfPlaceFromJson(json);

  @override
  double? get dist => null;

  @override
  DataOrigin get origin => DataOrigin.data;

  @override
  Vehicle? get type => null;

  @override
  String get label => name;

  @override
  Widget getIcon({double? size}) => SbbIcon(type, size: size);
}
