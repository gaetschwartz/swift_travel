// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchStationboardConnection _$$_SchStationboardConnectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SchStationboardConnection',
      json,
      ($checkedConvert) {
        final val = _$_SchStationboardConnection(
          time: $checkedConvert('time', (v) => DateTime.parse(v as String)),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$VehicleTypeEnumMap, v)),
          color: $checkedConvert('color', (v) => v as String),
          sbbTerminal: $checkedConvert(
              'terminal', (v) => SchStop.fromJson(v as Map<String, dynamic>)),
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
                          SchSubsequentStop.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$$_SchStationboardConnectionToJson(
        _$_SchStationboardConnection instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'type': _$VehicleTypeEnumMap[instance.type]!,
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

const _$VehicleTypeEnumMap = {
  VehicleType.bus: 'bus',
  VehicleType.post: 'post',
  VehicleType.nightBus: 'night_bus',
  VehicleType.tram: 'tram',
  VehicleType.walk: 'walk',
  VehicleType.strain: 'strain',
  VehicleType.train: 'train',
  VehicleType.expressTrain: 'express_train',
  VehicleType.funicular: 'funicular',
  VehicleType.business: 'business',
  VehicleType.address: 'adr',
  VehicleType.gondola: 'gondola',
  VehicleType.cablecar: 'cablecar',
  VehicleType.chairlift: 'chairlift',
  VehicleType.ship: 'ship',
  VehicleType.str: 'str',
  VehicleType.metro: 'metro',
  VehicleType.rer: 'rer',
  VehicleType.nightStrain: 'night_strain',
  VehicleType.unknown: 'unknown',
};
