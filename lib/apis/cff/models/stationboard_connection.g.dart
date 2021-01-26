// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StationboardConnection _$_$_StationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return _$_StationboardConnection(
    json['time'] == null ? null : DateTime.parse(json['time'] as String),
    _$enumDecodeNullable(_$VehicleEnumMap, json['type']),
    json['color'] as String,
    json['terminal'] == null
        ? null
        : Stop.fromJson(json['terminal'] as Map<String, dynamic>),
    line: json['line'] as String,
    operator: json['operator'] as String,
    number: json['number'] as String ?? '',
    g: json['*G'] as String,
    l: json['*L'] as String,
    subsequentStops: (json['subsequent_stops'] as List)
            ?.map((e) => e == null
                ? null
                : SubsequentStop.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    depDelay: delayFromJson(json['dep_delay']),
    arrDelay: delayFromJson(json['arr_delay']),
  );
}

Map<String, dynamic> _$_$_StationboardConnectionToJson(
        _$_StationboardConnection instance) =>
    <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'type': _$VehicleEnumMap[instance.type],
      'color': instance.color,
      'terminal': instance.terminal?.toJson(),
      'line': instance.line,
      'operator': instance.operator,
      'number': instance.number,
      '*G': instance.g,
      '*L': instance.l,
      'subsequent_stops':
          instance.subsequentStops?.map((e) => e?.toJson())?.toList(),
      'dep_delay': delayToJson(instance.depDelay),
      'arr_delay': delayToJson(instance.arrDelay),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$VehicleEnumMap = {
  Vehicle.bus: 'bus',
  Vehicle.post: 'post',
  Vehicle.nightBus: 'night_bus',
  Vehicle.tram: 'tram',
  Vehicle.walk: 'walk',
  Vehicle.strain: 'strain',
  Vehicle.train: 'train',
  Vehicle.expressTrain: 'express_train',
  Vehicle.funicular: 'funicular',
  Vehicle.business: 'business',
  Vehicle.adr: 'adr',
  Vehicle.private: 'private',
  Vehicle.gondola: 'gondola',
  Vehicle.cablecar: 'cablecar',
  Vehicle.chairlift: 'chairlift',
  Vehicle.favorite: 'favorite',
  Vehicle.ship: 'ship',
};
