// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStationboardConnection _$$_SbbStationboardConnectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SbbStationboardConnection',
      json,
      ($checkedConvert) {
        final val = _$_SbbStationboardConnection(
          time: $checkedConvert('time', (v) => DateTime.parse(v as String)),
          type:
              $checkedConvert('type', (v) => _$enumDecode(_$VehicleEnumMap, v)),
          color: $checkedConvert('color', (v) => v as String),
          sbbTerminal: $checkedConvert(
              'terminal', (v) => SbbStop.fromJson(v as Map<String, dynamic>)),
          line: $checkedConvert('line', (v) => v as String?),
          operator: $checkedConvert('operator', (v) => v as String?),
          number: $checkedConvert('number', (v) => v as String? ?? ''),
          g: $checkedConvert('*G', (v) => v as String?),
          l: $checkedConvert('*L', (v) => v as String?),
          sbbSubsequentStops: $checkedConvert(
              'subsequent_stops',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          SbbSubsequentStop.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  []),
          depDelay: $checkedConvert(
              'dep_delay', (v) => v == null ? 0 : delayFromJson(v)),
          arrDelay: $checkedConvert(
              'arr_delay', (v) => v == null ? 0 : delayFromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'sbbTerminal': 'terminal',
        'g': '*G',
        'l': '*L',
        'sbbSubsequentStops': 'subsequent_stops',
        'depDelay': 'dep_delay',
        'arrDelay': 'arr_delay'
      },
    );

Map<String, dynamic> _$$_SbbStationboardConnectionToJson(
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
