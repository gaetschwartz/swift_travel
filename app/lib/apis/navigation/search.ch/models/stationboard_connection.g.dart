// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStationboardConnection _$_$_SbbStationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return $checkedNew(r'_$_SbbStationboardConnection', json, () {
    final val = _$_SbbStationboardConnection(
      time: $checkedConvert(json, 'time', (v) => DateTime.parse(v as String)),
      type: $checkedConvert(
          json, 'type', (v) => _$enumDecode(_$VehicleEnumMap, v)),
      color: $checkedConvert(json, 'color', (v) => v as String),
      sbbTerminal: $checkedConvert(
          json, 'terminal', (v) => SbbStop.fromJson(v as Map<String, dynamic>)),
      line: $checkedConvert(json, 'line', (v) => v as String?),
      operator: $checkedConvert(json, 'operator', (v) => v as String?),
      number: $checkedConvert(json, 'number', (v) => v as String?) ?? '',
      g: $checkedConvert(json, '*G', (v) => v as String?),
      l: $checkedConvert(json, '*L', (v) => v as String?),
      sbbSubsequentStops: $checkedConvert(
              json,
              'subsequent_stops',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      SbbSubsequentStop.fromJson(e as Map<String, dynamic>))
                  .toList()) ??
          [],
      depDelay: $checkedConvert(json, 'dep_delay', (v) => delayFromJson(v)),
      arrDelay: $checkedConvert(json, 'arr_delay', (v) => delayFromJson(v)),
    );
    return val;
  }, fieldKeyMap: const {
    'sbbTerminal': 'terminal',
    'g': '*G',
    'l': '*L',
    'sbbSubsequentStops': 'subsequent_stops',
    'depDelay': 'dep_delay',
    'arrDelay': 'arr_delay'
  });
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
  Vehicle.address: 'adr',
  Vehicle.private: 'private',
  Vehicle.gondola: 'gondola',
  Vehicle.cablecar: 'cablecar',
  Vehicle.chairlift: 'chairlift',
  Vehicle.ship: 'ship',
  Vehicle.str: 'str',
  Vehicle.metro: 'metro',
  Vehicle.rer: 'rer',
  Vehicle.unknown: 'unknown',
};
