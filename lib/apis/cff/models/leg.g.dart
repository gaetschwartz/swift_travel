// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Leg _$_$_LegFromJson(Map<String, dynamic> json) {
  return _$_Leg(
    type: _$enumDecodeNullable(_$VehicleEnumMap, json['type']),
    track: json['track'] as String,
    terminal: json['terminal'] as String,
    fgcolor: json['fgcolor'] as String,
    number: json['number'] as String,
    bgcolor: json['bgcolor'] as String,
    tripid: json['tripid'] as String,
    exit: json['exit'] == null
        ? null
        : Exit.fromJson(json['exit'] as Map<String, dynamic>),
    runningtime: (json['runningtime'] as num)?.toDouble(),
    stopid: json['stopid'] as String,
    line: json['line'] as String,
    stops: (json['stops'] as List)
            ?.map((e) =>
                e == null ? null : Stop.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    sbbName: json['sbbName'] as String,
    name: json['name'] as String,
    departure: json['departure'] == null
        ? null
        : DateTime.parse(json['departure'] as String),
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    normalTime: json['normalTime'] as int,
    waittime: json['waittime'] as int,
    isaddress: json['isaddress'] as bool,
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
          (k, e) => MapEntry(k, e as String),
        ) ??
        {},
    depDelay: json['dep_delay'] as String,
  );
}

Map<String, dynamic> _$_$_LegToJson(_$_Leg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$VehicleEnumMap[instance.type]);
  writeNotNull('track', instance.track);
  writeNotNull('terminal', instance.terminal);
  writeNotNull('fgcolor', instance.fgcolor);
  writeNotNull('number', instance.number);
  writeNotNull('bgcolor', instance.bgcolor);
  writeNotNull('tripid', instance.tripid);
  writeNotNull('exit', instance.exit?.toJson());
  writeNotNull('runningtime', instance.runningtime);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('line', instance.line);
  writeNotNull('stops', instance.stops?.map((e) => e?.toJson())?.toList());
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('name', instance.name);
  writeNotNull('departure', instance.departure?.toIso8601String());
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('normalTime', instance.normalTime);
  writeNotNull('waittime', instance.waittime);
  writeNotNull('isaddress', instance.isaddress);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('dep_delay', instance.depDelay);
  return val;
}

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
};
