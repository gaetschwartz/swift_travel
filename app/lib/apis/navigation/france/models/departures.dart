import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/france/models/context.dart';
import 'package:swift_travel/apis/navigation/models/mock_stop.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/utils/strings/format.dart';

part 'departures.freezed.dart';
part 'departures.g.dart';

@freezed
class SncfStationboard with _$SncfStationboard, StationBoard {
  @JsonSerializable(explicitToJson: true)
  const factory SncfStationboard({
    required SncfContext context,
    required List<SncfDeparture> departures,
    SncfError? error,
    @Default(MockStop())
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
        Stop stop,
  }) = _SncfStationboard;
  const SncfStationboard._();

  factory SncfStationboard.fromJson(Map<String, dynamic> json) =>
      _$SncfStationboardFromJson(json);

  @override
  List<StationboardConnection> get connections => departures;

  @override
  List<Object> get errors => [if (error != null) error!];

  @override
  String get stopName => throw UnimplementedError();

  @override
  bool get hasError => error != null;
}

@freezed
class SncfError with _$SncfError {
  const factory SncfError(
    String id,
    String message,
  ) = _SncfError;

  factory SncfError.fromJson(Map<String, dynamic> json) =>
      _$SncfErrorFromJson(json);
}

@freezed
class SncfDeparture with _$SncfDeparture implements StationboardConnection {
  @JsonSerializable(explicitToJson: true)
  const factory SncfDeparture({
    @JsonKey(name: 'display_informations')
        required SncfDispInfo displayInformations,
    @JsonKey(name: 'stop_date_time')
        required SncfStopDateTime stopDateTime,
    @JsonKey(name: 'stop_point')
        required SncfStopPoint stopPoint,
  }) = _SncfDeparture;

  const SncfDeparture._();

  factory SncfDeparture.fromJson(Map<String, dynamic> json) =>
      _$SncfDepartureFromJson(json);

  @override
  int get arrDelay => stopDateTime.arrivalDateTime
      .difference(stopDateTime.baseArrivalDateTime)
      .inMinutes;

  @override
  int get depDelay => stopDateTime.departureDateTime
      .difference(stopDateTime.baseDepartureDateTime)
      .inMinutes;

  @override
  String? get g => displayInformations.commercialMode[0];

  @override
  String? get l => displayInformations.code;

  @override
  String? get line => displayInformations.label;

  @override
  String get number => displayInformations.code;

  @override
  String? get operator => displayInformations.network;

  @override
  List<DelayedStop> get subsequentStops => [];

  @override
  Stop get terminal => SchStop(sbbName: displayInformations.direction);

  @override
  DateTime get time => stopDateTime.arrivalDateTime;

  // @override
  // VehicleType get type =>
  //     VehicleTypeX.parse(stopPoint.commercialModes.first.id.split(':').last);
  @override
  // TODO: implement type
  VehicleType get type => VehicleType.unknown;

  @override
  Color? get bgcolor {
    final c = tryParseColorInt(displayInformations.color);
    return c == null ? null : Color(c);
  }

  @override
  Color? get fgcolor {
    final c = tryParseColorInt(displayInformations.textColor);
    return c == null ? null : Color(c);
  }

  @override
  String? get track => null;
}

///
///"commercial_modes": [
// |||||{
// ||||||"id": "commercial_mode:Metro",
// ||||||"name": "Métro"
// |||||}
// ||||],

@freezed
class SncfStopPoint with _$SncfStopPoint {
  @JsonSerializable(explicitToJson: true)
  const factory SncfStopPoint(
    @JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes,
  ) = _SncfStopPoint;
  factory SncfStopPoint.fromJson(Map<String, dynamic> json) =>
      _$SncfStopPointFromJson(json);
}

@freezed
class SncfMode with _$SncfMode {
  const factory SncfMode(
    String id,
    String name,
  ) = _SncfMode;

  factory SncfMode.fromJson(Map<String, dynamic> json) =>
      _$SncfModeFromJson(json);
}

@freezed
class SncfStopDateTime with _$SncfStopDateTime {
  const factory SncfStopDateTime({
    @JsonKey(name: 'additional_informations')
        required List<Object> additionalInformations,
    @JsonKey(name: 'arrival_date_time')
        required DateTime arrivalDateTime,
    @JsonKey(name: 'base_arrival_date_time')
        required DateTime baseArrivalDateTime,
    @JsonKey(name: 'base_departure_date_time')
        required DateTime baseDepartureDateTime,
    @JsonKey(name: 'departure_date_time')
        required DateTime departureDateTime,
    @JsonKey(name: 'data_freshness')
        required String dataFreshness,
    required List<Object> links,
  }) = _SncfStopDateTime;

  factory SncfStopDateTime.fromJson(Map<String, dynamic> json) =>
      _$SncfStopDateTimeFromJson(json);
}

@freezed
class SncfDispInfo with _$SncfDispInfo {
  const factory SncfDispInfo({
    required String code,
    required String color,
    @JsonKey(name: 'commercial_mode') required String commercialMode,
    required String description,
    required String direction,
    required List<Object> equipments,
    required String headsign,
    required String label,
    required List<Object> links,
    required String name,
    required String network,
    @JsonKey(name: 'physical_mode') required String physicalMode,
    @JsonKey(name: 'text_color') required String textColor,
    @JsonKey(name: 'trip_short_name') required String tripShortName,
  }) = _SncfDispInfo;

  factory SncfDispInfo.fromJson(Map<String, dynamic> json) =>
      _$SncfDispInfoFromJson(json);
}
