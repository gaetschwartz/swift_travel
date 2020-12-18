// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exit _$_$_ExitFromJson(Map<String, dynamic> json) {
  return _$_Exit(
    arrival: json['arrival'] == null ? null : DateTime.parse(json['arrival'] as String),
    name: json['name'] as String,
    stopid: json['stopid'] as String,
    waittime: json['waittime'] as int,
    isaddress: json['isaddress'] as bool,
    sbbName: json['sbbName'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    arrDelay: delayFromJson(json['arr_delay']),
  );
}

Map<String, dynamic> _$_$_ExitToJson(_$_Exit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('waittime', instance.waittime);
  writeNotNull('isaddress', instance.isaddress);
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('arr_delay', delayFromJson(instance.arrDelay));
  return val;
}
