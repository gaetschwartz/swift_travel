// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Leg _$_$_LegFromJson(Map<String, dynamic> json) {
  return _$_Leg(
    type: json['type'] as String,
    track: json['track'] as String,
    terminal: json['terminal'] as String,
    fgcolor: json['fgcolor'] as String,
    number: json['number'] as String,
    bgcolor: json['bgcolor'] as String,
    tripid: json['tripid'] as String,
    exit: json['exit'] == null
        ? null
        : Exit.fromJson(json['exit'] as Map<String, dynamic>),
    runningtime: json['runningtime'] as int,
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
  );
}

Map<String, dynamic> _$_$_LegToJson(_$_Leg instance) => <String, dynamic>{
      'type': instance.type,
      'track': instance.track,
      'terminal': instance.terminal,
      'fgcolor': instance.fgcolor,
      'number': instance.number,
      'bgcolor': instance.bgcolor,
      'tripid': instance.tripid,
      'exit': instance.exit?.toJson(),
      'runningtime': instance.runningtime,
      'stopid': instance.stopid,
      'line': instance.line,
      'stops': instance.stops?.map((e) => e?.toJson())?.toList(),
      'sbbName': instance.sbbName,
      'name': instance.name,
      'departure': instance.departure?.toIso8601String(),
      'arrival': instance.arrival?.toIso8601String(),
      'normalTime': instance.normalTime,
      'waittime': instance.waittime,
      'isaddress': instance.isaddress,
    };
