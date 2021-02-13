// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exit _$_$_ExitFromJson(Map<String, dynamic> json) {
  return _$_Exit(
    arrDelay: delayFromJson(json['arr_delay']),
    name: json['name'] as String,
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    stopid: json['stopid'] as String?,
    waittime: json['waittime'] as int? ?? 0,
    isaddress: json['isaddress'] as bool? ?? false,
    sbbName: json['sbbName'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_ExitToJson(_$_Exit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arr_delay', delayToJson(instance.arrDelay));
  val['name'] = instance.name;
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('stopid', instance.stopid);
  val['waittime'] = instance.waittime;
  val['isaddress'] = instance.isaddress;
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  return val;
}
