// ignore_for_file: unused_element
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/trias.dart';
import 'package:swift_travel/widgets/vehicle_icon.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
class SchCompletion with _$SchCompletion implements NavigationCompletion {
  @JsonSerializable(includeIfNull: false)
  factory SchCompletion({
    required String label,
    double? dist,
    @JsonKey(name: 'iconclass') String? iconClass,
    String? html,
    String? id,
  }) = _SchCompletion;
  SchCompletion._();

  factory SchCompletion.fromJson(Map<String, dynamic> json) =>
      _$SchCompletionFromJson(json);

  static LocationType parseLocationType(String? iconclass) {
    if (iconclass == null) {
      return LocationType.unknown;
    }
    final substring = iconclass.substring(iconclass.lastIndexOf('-') + 1);
    final decoded = $enumDecode(
      _$LocationTypeEnumMap,
      substring,
      unknownValue: LocationType.unknown,
    );
    if (kDebugMode) {
      if (decoded == LocationType.unknown) {
        debugPrint('Unknown location type: $substring');
      }
    }
    return decoded;
  }

  @override
  late final LocationType type = () {
    final icon = parseLocationType(iconClass);
    if (icon == LocationType.unknown) {
      return vehicle == VehicleType.unknown
          ? LocationType.unknown
          : LocationType.station;
    } else {
      return icon;
    }
  }();

  late final VehicleType vehicle = () {
    if (iconClass == null) {
      return VehicleType.unknown;
    }
    final substring = iconClass!.substring(iconClass!.lastIndexOf('-') + 1);
    final decoded = $enumDecode(
      _$VehicleTypeEnumMap,
      substring,
      unknownValue: VehicleType.unknown,
    );
    if (kDebugMode) {
      if (decoded == VehicleType.unknown) {
        debugPrint('Unknown vehicle type: $substring');
      }
    }
    return decoded;
  }();

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
  Widget Function(BuildContext context)? get iconBuilder =>
      (_) => VehicleIcon(vehicle);
}

@freezed
class _PlaceTypeIconclass with _$_PlaceTypeIconclass {
  const factory _PlaceTypeIconclass(LocationType v) = __PlaceTypeIconclass;

  factory _PlaceTypeIconclass.fromJson(Map<String, dynamic> json) =>
      _$_PlaceTypeIconclassFromJson(json);
}

@freezed
class _VehicleTypeIconclass with _$_VehicleTypeIconclass {
  const factory _VehicleTypeIconclass(VehicleType v) = __VehicleTypeIconclass;

  factory _VehicleTypeIconclass.fromJson(Map<String, dynamic> json) =>
      _$_VehicleTypeIconclassFromJson(json);
}
