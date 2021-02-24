// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStationboardConnection _$_$_SbbStationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return _$_SbbStationboardConnection(
    time: DateTime.parse(json['time'] as String),
    type: _$enumDecode(_$VehicleEnumMap, json['type']),
    color: json['color'] as String,
    sbbTerminal: SbbStop.fromJson(json['terminal'] as Map<String, dynamic>),
    line: json['line'] as String?,
    operator: json['operator'] as String?,
    number: json['number'] as String? ?? '',
    g: json['*G'] as String?,
    l: json['*L'] as String?,
    sbbSubsequentStops: (json['subsequent_stops'] as List<dynamic>?)
            ?.map((e) => SbbSubsequentStop.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    depDelay: delayFromJson(json['dep_delay']),
    arrDelay: delayFromJson(json['arr_delay']),
  );
}

Map<String, dynamic> _$_$_SbbStationboardConnectionToJson(
        _$_SbbStationboardConnection instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'type': _$VehicleEnumMap[instance.type],
      'color': instance.color,
      'terminal': instance.sbbTerminal.toJson(),
      'line': instance.line,
      'operator': instance.operator,
      'number': instance.number,
      '*G': instance.g,
      '*L': instance.l,
      'subsequent_stops':
          instance.sbbSubsequentStops.map((e) => e.toJson()).toList(),
      'dep_delay': delayToJson(instance.depDelay),
      'arr_delay': delayToJson(instance.arrDelay),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
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
  Vehicle.ship: 'ship',
  Vehicle.str: 'str',
  Vehicle.metro: 'metro',
};
