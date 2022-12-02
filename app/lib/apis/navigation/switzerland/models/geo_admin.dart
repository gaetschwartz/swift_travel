import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';

part 'geo_admin.freezed.dart';
part 'geo_admin.g.dart';

@freezed
class SearchCompletion with _$SearchCompletion {
  @JsonSerializable(checked: true)
  const factory SearchCompletion({
    required final String? label,
    final String? html,
    final String? iconclass,
    final String? corrected,
  }) = _SearchCompletion;

  factory SearchCompletion.fromJson(final Map<String, dynamic> json) =>
      _$SearchCompletionFromJson(json);
}

@freezed
class GeoAdminResult with _$GeoAdminResult implements NavigationCompletion {
  const factory GeoAdminResult({
    @JsonKey(name: 'id') required final int intId,
    @Default(0) final int weight,
    required final GeoAdminAttributes attrs,
  }) = _GeoAdminResult;
  const GeoAdminResult._();

  factory GeoAdminResult.fromJson(final Map<String, dynamic> json) =>
      _$GeoAdminResultFromJson(json);

  @override
  String get id => intId.toString();

  @override
  String get label => attrs.cleanLabel;

  @override
  PlaceType get type => PlaceType.address;

  @override
  GeoCoordinates? get coordinates => null;

  @override
  double? get dist => null;

  @override
  Widget Function(BuildContext context)? get iconBuilder => null;
}

@freezed
class GeoAdminAttributes with _$GeoAdminAttributes {
  const factory GeoAdminAttributes({
    required final String origin,
    @JsonKey(name: 'featureId') required final String? featureId,
    required final String detail,
    required final int rank,
    @JsonKey(name: 'num') final int? number,
    required final double y,
    required final double x,
    required final int zoomlevel,
    @JsonKey(name: 'label') required final String htmlLabel,
  }) = _GeoAdminAttributes;

  const GeoAdminAttributes._();

  // Remove all html tags from the label
  String get cleanLabel => htmlLabel.replaceAll(RegExp('<[^>]*>'), '');

  factory GeoAdminAttributes.fromJson(final Map<String, dynamic> json) =>
      _$GeoAdminAttributesFromJson(json);
}
