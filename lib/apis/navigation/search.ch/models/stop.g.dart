// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stop _$_$_StopFromJson(Map<String, dynamic> json) {
  return _$_Stop(
    json['name'] as String,
    id: json['id'] as String?,
    stopid: json['stopid'] as String?,
    departure: _fromJson(json['departure'] as String?),
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_StopToJson(_$_Stop instance) {
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
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  return val;
}
