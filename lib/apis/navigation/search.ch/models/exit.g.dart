// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exit _$_$_ExitFromJson(Map<String, dynamic> json) {
  return _$_Exit(
    arrDelay: delayFromJson(json['arr_delay']),
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
    name: json['name'] as String,
    sbbName: json['sbbName'] as String?,
    stopid: json['stopid'] as String?,
    track: json['track'] as String?,
    waittime: json['waittime'] as int? ?? 0,
    isaddress: json['isaddress'] as bool? ?? false,
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
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  val['name'] = instance.name;
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('track', instance.track);
  val['waittime'] = instance.waittime;
  val['isaddress'] = instance.isaddress;
  return val;
}
