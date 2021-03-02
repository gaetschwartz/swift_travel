// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exit _$_$_ExitFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Exit', json, () {
    final val = _$_Exit(
      arrDelay: $checkedConvert(json, 'arr_delay', (v) => delayFromJson(v)),
      arrival: $checkedConvert(json, 'arrival',
          (v) => v == null ? null : DateTime.parse(v as String)),
      lat: $checkedConvert(json, 'lat', (v) => (v as num?)?.toDouble()),
      lon: $checkedConvert(json, 'lon', (v) => (v as num?)?.toDouble()),
      name: $checkedConvert(json, 'name', (v) => v as String),
      sbbName: $checkedConvert(json, 'sbbName', (v) => v as String?),
      stopid: $checkedConvert(json, 'stopid', (v) => v as String?),
      track: $checkedConvert(json, 'track', (v) => v as String?),
      waittime: $checkedConvert(json, 'waittime', (v) => v as int?) ?? 0,
      isaddress: $checkedConvert(json, 'isaddress', (v) => v as bool?) ?? false,
      x: $checkedConvert(json, 'x', (v) => const IntConverter().fromJson(v)),
      y: $checkedConvert(json, 'y', (v) => const IntConverter().fromJson(v)),
    );
    return val;
  }, fieldKeyMap: const {'arrDelay': 'arr_delay'});
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
  writeNotNull('x', const IntConverter().toJson(instance.x));
  writeNotNull('y', const IntConverter().toJson(instance.y));
  return val;
}
