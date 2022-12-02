// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/trias.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
class SbbCompletion with _$SbbCompletion implements NavigationCompletion {
  @JsonSerializable(includeIfNull: false)
  factory SbbCompletion({
    required String label,
    double? dist,
    @JsonKey(name: 'iconclass') String? iconClass,
    String? html,
    String? id,
  }) = _SbbCompletion;
  SbbCompletion._();

  factory SbbCompletion.fromJson(Map<String, dynamic> json) =>
      _$SbbCompletionFromJson(json);

  static PlaceType? parsePlaceType(String? iconclass) {
    if (iconclass == null) {
      return null;
    }
    final substring = iconclass.substring(iconclass.lastIndexOf('-') + 1);
    return $enumDecode(_$PlaceTypeEnumMap, substring);
  }

  @override
  late final PlaceType type = parsePlaceType(iconClass) ?? PlaceType.unknown;

  // blah blah blah @ 46.8537495783, 7.65740776062

  final regex = RegExp(r'@ (\d+\.\d+), (\d+\.\d+)');
  @override
  GeoCoordinates? get coordinates {
    final match = regex.firstMatch(html ?? '');
    if (match == null) {
      return null;
    }
    return TriasGeoPosition(
      latitude: double.parse(match.group(1)!),
      longitude: double.parse(match.group(2)!),
    );
  }

  @override
  final Widget Function(BuildContext context)? iconBuilder = null;
}

@freezed
class _PlaceTypeIconclass with _$_PlaceTypeIconclass {
  const factory _PlaceTypeIconclass(PlaceType v) = __PlaceTypeIconclass;

  factory _PlaceTypeIconclass.fromJson(Map<String, dynamic> json) =>
      _$_PlaceTypeIconclassFromJson(json);
}
