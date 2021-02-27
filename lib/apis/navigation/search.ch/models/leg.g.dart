// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbLeg _$_$_SbbLegFromJson(Map<String, dynamic> json) {
  return _$_SbbLeg(
    name: json['name'] as String,
    sbbExit: json['exit'] == null
        ? null
        : SbbExit.fromJson(json['exit'] as Map<String, dynamic>),
    depDelay: delayFromJson(json['dep_delay']),
    type: _$enumDecodeNullable(_$VehicleEnumMap, json['type']),
    track: json['track'] as String?,
    terminal: json['terminal'] as String?,
    fgcolor: json['fgcolor'] as String?,
    number: json['number'] as String?,
    bgcolor: json['bgcolor'] as String?,
    tripid: json['tripid'] as String?,
    stopid: json['stopid'] as String?,
    runningTime: (json['runningtime'] as num?)?.toDouble(),
    line: json['line'] as String?,
    sbbStops: (json['sbbStops'] as List<dynamic>?)
            ?.map((e) => SbbStop.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    sbbName: json['sbbName'] as String?,
    departure: json['departure'] == null
        ? null
        : DateTime.parse(json['departure'] as String),
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    normalTime: json['normalTime'] as int?,
    waitTime: json['waittime'] as int? ?? 0,
    isaddress: json['isaddress'] as bool? ?? false,
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
    x: json['x'] as int?,
    y: json['y'] as int?,
    attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as String),
        ) ??
        {},
  );
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
  val['sbbStops'] = instance.sbbStops.map((e) => e.toJson()).toList();
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
