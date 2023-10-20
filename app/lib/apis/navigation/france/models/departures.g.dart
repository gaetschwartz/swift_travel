// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SncfStationboardImpl _$$SncfStationboardImplFromJson(
        Map<String, dynamic> json) =>
    _$SncfStationboardImpl(
      context: SncfContext.fromJson(json['context'] as Map<String, dynamic>),
      departures: (json['departures'] as List<dynamic>)
          .map((e) => SncfDeparture.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] == null
          ? null
          : SncfError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SncfStationboardImplToJson(
        _$SncfStationboardImpl instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'departures': instance.departures.map((e) => e.toJson()).toList(),
      'error': instance.error?.toJson(),
    };

_$SncfErrorImpl _$$SncfErrorImplFromJson(Map<String, dynamic> json) =>
    _$SncfErrorImpl(
      json['id'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$$SncfErrorImplToJson(_$SncfErrorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };

_$SncfDepartureImpl _$$SncfDepartureImplFromJson(Map<String, dynamic> json) =>
    _$SncfDepartureImpl(
      displayInformations: SncfDispInfo.fromJson(
          json['display_informations'] as Map<String, dynamic>),
      stopDateTime: SncfStopDateTime.fromJson(
          json['stop_date_time'] as Map<String, dynamic>),
      stopPoint:
          SncfStopPoint.fromJson(json['stop_point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SncfDepartureImplToJson(_$SncfDepartureImpl instance) =>
    <String, dynamic>{
      'display_informations': instance.displayInformations.toJson(),
      'stop_date_time': instance.stopDateTime.toJson(),
      'stop_point': instance.stopPoint.toJson(),
    };

_$SncfStopPointImpl _$$SncfStopPointImplFromJson(Map<String, dynamic> json) =>
    _$SncfStopPointImpl(
      (json['commercial_modes'] as List<dynamic>)
          .map((e) => SncfMode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SncfStopPointImplToJson(_$SncfStopPointImpl instance) =>
    <String, dynamic>{
      'commercial_modes':
          instance.commercialModes.map((e) => e.toJson()).toList(),
    };

_$SncfModeImpl _$$SncfModeImplFromJson(Map<String, dynamic> json) =>
    _$SncfModeImpl(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$$SncfModeImplToJson(_$SncfModeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$SncfStopDateTimeImpl _$$SncfStopDateTimeImplFromJson(
        Map<String, dynamic> json) =>
    _$SncfStopDateTimeImpl(
      additionalInformations: (json['additional_informations'] as List<dynamic>)
          .map((e) => e as Object)
          .toList(),
      arrivalDateTime: DateTime.parse(json['arrival_date_time'] as String),
      baseArrivalDateTime:
          DateTime.parse(json['base_arrival_date_time'] as String),
      baseDepartureDateTime:
          DateTime.parse(json['base_departure_date_time'] as String),
      departureDateTime: DateTime.parse(json['departure_date_time'] as String),
      dataFreshness: json['data_freshness'] as String,
      links: (json['links'] as List<dynamic>).map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$$SncfStopDateTimeImplToJson(
        _$SncfStopDateTimeImpl instance) =>
    <String, dynamic>{
      'additional_informations': instance.additionalInformations,
      'arrival_date_time': instance.arrivalDateTime.toIso8601String(),
      'base_arrival_date_time': instance.baseArrivalDateTime.toIso8601String(),
      'base_departure_date_time':
          instance.baseDepartureDateTime.toIso8601String(),
      'departure_date_time': instance.departureDateTime.toIso8601String(),
      'data_freshness': instance.dataFreshness,
      'links': instance.links,
    };

_$SncfDispInfoImpl _$$SncfDispInfoImplFromJson(Map<String, dynamic> json) =>
    _$SncfDispInfoImpl(
      code: json['code'] as String,
      color: json['color'] as String,
      commercialMode: json['commercial_mode'] as String,
      description: json['description'] as String,
      direction: json['direction'] as String,
      equipments: (json['equipments'] as List<dynamic>)
          .map((e) => e as Object)
          .toList(),
      headsign: json['headsign'] as String,
      label: json['label'] as String,
      links: (json['links'] as List<dynamic>).map((e) => e as Object).toList(),
      name: json['name'] as String,
      network: json['network'] as String,
      physicalMode: json['physical_mode'] as String,
      textColor: json['text_color'] as String,
      tripShortName: json['trip_short_name'] as String,
    );

Map<String, dynamic> _$$SncfDispInfoImplToJson(_$SncfDispInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'color': instance.color,
      'commercial_mode': instance.commercialMode,
      'description': instance.description,
      'direction': instance.direction,
      'equipments': instance.equipments,
      'headsign': instance.headsign,
      'label': instance.label,
      'links': instance.links,
      'name': instance.name,
      'network': instance.network,
      'physical_mode': instance.physicalMode,
      'text_color': instance.textColor,
      'trip_short_name': instance.tripShortName,
    };
