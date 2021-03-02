// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbLeg _$_$_SbbLegFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_SbbLeg', json, () {
    final val = _$_SbbLeg(
      name: $checkedConvert(json, 'name', (v) => v as String),
      sbbExit: $checkedConvert(
          json,
          'exit',
          (v) =>
              v == null ? null : SbbExit.fromJson(v as Map<String, dynamic>)),
      depDelay: $checkedConvert(json, 'dep_delay', (v) => delayFromJson(v)),
      type: $checkedConvert(
          json, 'type', (v) => _$enumDecodeNullable(_$VehicleEnumMap, v)),
      track: $checkedConvert(json, 'track', (v) => v as String?),
      terminal: $checkedConvert(json, 'terminal', (v) => v as String?),
      fgcolor: $checkedConvert(json, 'fgcolor', (v) => v as String?),
      number: $checkedConvert(json, 'number', (v) => v as String?),
      bgcolor: $checkedConvert(json, 'bgcolor', (v) => v as String?),
      tripid: $checkedConvert(json, 'tripid', (v) => v as String?),
      stopid: $checkedConvert(json, 'stopid', (v) => v as String?),
      runningTime:
          $checkedConvert(json, 'runningtime', (v) => (v as num?)?.toDouble()),
      line: $checkedConvert(json, 'line', (v) => v as String?),
      sbbStops: $checkedConvert(
              json,
              'stops',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SbbStop.fromJson(e as Map<String, dynamic>))
                  .toList()) ??
          [],
      sbbName: $checkedConvert(json, 'sbbName', (v) => v as String?),
      departure: $checkedConvert(json, 'departure',
          (v) => v == null ? null : DateTime.parse(v as String)),
      arrival: $checkedConvert(json, 'arrival',
          (v) => v == null ? null : DateTime.parse(v as String)),
      normalTime: $checkedConvert(json, 'normalTime', (v) => v as int?),
      waitTime: $checkedConvert(json, 'waittime', (v) => v as int?) ?? 0,
      isaddress: $checkedConvert(json, 'isaddress', (v) => v as bool?) ?? false,
      lat: $checkedConvert(json, 'lat', (v) => (v as num?)?.toDouble()),
      lon: $checkedConvert(json, 'lon', (v) => (v as num?)?.toDouble()),
      x: $checkedConvert(json, 'x', (v) => v as int?),
      y: $checkedConvert(json, 'y', (v) => v as int?),
      attributes: $checkedConvert(
              json,
              'attributes',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  )) ??
          {},
    );
    return val;
  }, fieldKeyMap: const {
    'sbbExit': 'exit',
    'depDelay': 'dep_delay',
    'runningTime': 'runningtime',
    'sbbStops': 'stops',
    'waitTime': 'waittime'
  });
}

Map<String, dynamic> _$_$_SbbLegToJson(_$_SbbLeg instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exit', instance.sbbExit?.toJson());
  writeNotNull('dep_delay', delayToJson(instance.depDelay));
  writeNotNull('type', _$VehicleEnumMap[instance.type]);
  writeNotNull('track', instance.track);
  writeNotNull('terminal', instance.terminal);
  writeNotNull('fgcolor', instance.fgcolor);
  writeNotNull('number', instance.number);
  writeNotNull('bgcolor', instance.bgcolor);
  writeNotNull('tripid', instance.tripid);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('runningtime', instance.runningTime);
  writeNotNull('line', instance.line);
  val['stops'] = instance.sbbStops.map((e) => e.toJson()).toList();
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('departure', instance.departure?.toIso8601String());
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('normalTime', instance.normalTime);
  val['waittime'] = instance.waitTime;
  val['isaddress'] = instance.isaddress;
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('x', instance.x);
  writeNotNull('y', instance.y);
  val['attributes'] = instance.attributes;
  return val;
}

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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
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
  Vehicle.rer: 'rer',
  Vehicle.unknown: 'unknown',
};
