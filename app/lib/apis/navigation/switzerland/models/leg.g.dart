// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbLeg _$$_SbbLegFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_SbbLeg',
      json,
      ($checkedConvert) {
        final val = _$_SbbLeg(
          name: $checkedConvert('name', (v) => v as String),
          sbbExit: $checkedConvert(
              'exit',
              (v) => v == null
                  ? null
                  : SbbExit.fromJson(v as Map<String, dynamic>)),
          depDelay: $checkedConvert('dep_delay',
              (v) => const DelayConverter().fromJson(v as String?)),
          type: $checkedConvert(
              'type', (v) => $enumDecodeNullable(_$VehicleTypeEnumMap, v)),
          track: $checkedConvert('track', (v) => v as String?),
          terminal: $checkedConvert('terminal', (v) => v as String?),
          bgcolor: $checkedConvert('bgcolor', (v) => v as String?),
          fgcolor: $checkedConvert('fgcolor', (v) => v as String?),
          number: $checkedConvert('number', (v) => v as String?),
          tripid: $checkedConvert('tripid', (v) => v as String?),
          stopid: $checkedConvert('stopid', (v) => v as String?),
          runningTime:
              $checkedConvert('runningtime', (v) => (v as num?)?.toDouble()),
          line: $checkedConvert('line', (v) => v as String?),
          sbbStops: $checkedConvert(
              'stops',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => SbbStop.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  []),
          sbbName: $checkedConvert('sbbName', (v) => v as String?),
          departure: $checkedConvert('departure',
              (v) => v == null ? null : DateTime.parse(v as String)),
          arrival: $checkedConvert(
              'arrival', (v) => v == null ? null : DateTime.parse(v as String)),
          normalTime:
              $checkedConvert('normal_time', (v) => (v as num?)?.toDouble()),
          waitTime:
              $checkedConvert('waittime', (v) => (v as num?)?.toDouble() ?? 0),
          isAddress: $checkedConvert('isaddress', (v) => v as bool? ?? false),
          lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
          lon: $checkedConvert('lon', (v) => (v as num?)?.toDouble()),
          x: $checkedConvert('x', (v) => const IntConverter().fromJson(v)),
          y: $checkedConvert('y', (v) => const IntConverter().fromJson(v)),
          attributes: $checkedConvert(
              'attributes',
              (v) =>
                  (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  ) ??
                  const <String, String>{}),
        );
        return val;
      },
      fieldKeyMap: const {
        'sbbExit': 'exit',
        'depDelay': 'dep_delay',
        'runningTime': 'runningtime',
        'sbbStops': 'stops',
        'normalTime': 'normal_time',
        'waitTime': 'waittime',
        'isAddress': 'isaddress'
      },
    );

Map<String, dynamic> _$$_SbbLegToJson(_$_SbbLeg instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exit', instance.sbbExit?.toJson());
  writeNotNull('dep_delay', const DelayConverter().toJson(instance.depDelay));
  writeNotNull('type', _$VehicleTypeEnumMap[instance.type]);
  writeNotNull('track', instance.track);
  writeNotNull('terminal', instance.terminal);
  writeNotNull('bgcolor', instance.bgcolor);
  writeNotNull('fgcolor', instance.fgcolor);
  writeNotNull('number', instance.number);
  writeNotNull('tripid', instance.tripid);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('runningtime', instance.runningTime);
  writeNotNull('line', instance.line);
  val['stops'] = instance.sbbStops.map((e) => e.toJson()).toList();
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('departure', instance.departure?.toIso8601String());
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('normal_time', instance.normalTime);
  val['waittime'] = instance.waitTime;
  val['isaddress'] = instance.isAddress;
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('x', const IntConverter().toJson(instance.x));
  writeNotNull('y', const IntConverter().toJson(instance.y));
  val['attributes'] = instance.attributes;
  return val;
}

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
  VehicleType.gondola: 'adr',
  VehicleType.cablecar: 'cablecar',
  VehicleType.chairlift: 'chairlift',
  VehicleType.ship: 'ship',
  VehicleType.str: 'str',
  VehicleType.metro: 'metro',
  VehicleType.rer: 'rer',
  VehicleType.nightStrain: 'night_strain',
  VehicleType.unknown: 'unknown',
};
