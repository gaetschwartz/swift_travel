// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStop _$_$_SbbStopFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_SbbStop', json, () {
    final val = _$_SbbStop(
      $checkedConvert(json, 'name', (v) => v as String),
      id: $checkedConvert(json, 'id', (v) => v as String?),
      stopid: $checkedConvert(json, 'stopid', (v) => v as String?),
      departure:
          $checkedConvert(json, 'departure', (v) => _fromJson(v as String?)),
      arrival: $checkedConvert(json, 'arrival', (v) => _fromJson(v as String?)),
      lat: $checkedConvert(json, 'lat', (v) => (v as num?)?.toDouble()),
      lon: $checkedConvert(json, 'lon', (v) => (v as num?)?.toDouble()),
      x: $checkedConvert(json, 'x', (v) => const IntConverter().fromJson(v)),
      y: $checkedConvert(json, 'y', (v) => const IntConverter().fromJson(v)),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_SbbStopToJson(_$_SbbStop instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('departure', _toJson(instance.departure));
  writeNotNull('arrival', _toJson(instance.arrival));
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('x', const IntConverter().toJson(instance.x));
  writeNotNull('y', const IntConverter().toJson(instance.y));
  return val;
}
