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
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$TransportationModeEnumMap, v)),
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
          depDelay: $checkedConvert('dep_delay',
              (v) => const DelayConverter().fromJson(v as String?)),
          arrDelay: $checkedConvert('arr_delay',
              (v) => const DelayConverter().fromJson(v as String?)),
          track: $checkedConvert('track', (v) => v as String?),
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
      'type': _$TransportationModeEnumMap[instance.type],
      'color': instance.color,
      'terminal': instance.sbbTerminal.toJson(),
      'line': instance.line,
      'operator': instance.operator,
      'number': instance.number,
      '*G': instance.g,
      '*L': instance.l,
      'subsequent_stops':
          instance.sbbSubsequentStops.map((e) => e.toJson()).toList(),
      'dep_delay': const DelayConverter().toJson(instance.depDelay),
      'arr_delay': const DelayConverter().toJson(instance.arrDelay),
      'track': instance.track,
    };

const _$TransportationModeEnumMap = {
  TransportationMode.bus: 'bus',
  TransportationMode.post: 'post',
  TransportationMode.nightBus: 'night_bus',
  TransportationMode.tram: 'tram',
  TransportationMode.walk: 'walk',
  TransportationMode.strain: 'strain',
  TransportationMode.train: 'train',
  TransportationMode.expressTrain: 'express_train',
  TransportationMode.funicular: 'funicular',
  TransportationMode.business: 'business',
  TransportationMode.address: 'adr',
  TransportationMode.private: 'private',
  TransportationMode.gondola: 'gondola',
  TransportationMode.cablecar: 'cablecar',
  TransportationMode.chairlift: 'chairlift',
  TransportationMode.ship: 'ship',
  TransportationMode.str: 'str',
  TransportationMode.metro: 'metro',
  TransportationMode.rer: 'rer',
  TransportationMode.nightStrain: 'night_strain',
  TransportationMode.unknown: 'unknown',
};
