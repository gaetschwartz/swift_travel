// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStop _$$_SbbStopFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_SbbStop',
      json,
      ($checkedConvert) {
        final val = _$_SbbStop(
          name: $checkedConvert('name', (v) => v as String),
          id: $checkedConvert('id', (v) => v as String?),
          departure:
              $checkedConvert('departure', (v) => _fromJson(v as String?)),
          arrival: $checkedConvert('arrival', (v) => _fromJson(v as String?)),
          lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
          lon: $checkedConvert('lon', (v) => (v as num?)?.toDouble()),
          x: $checkedConvert('x', (v) => const IntConverter().fromJson(v)),
          y: $checkedConvert('y', (v) => const IntConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SbbStopToJson(_$_SbbStop instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('departure', _toJson(instance.departure));
  writeNotNull('arrival', _toJson(instance.arrival));
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('x', const IntConverter().toJson(instance.x));
  writeNotNull('y', const IntConverter().toJson(instance.y));
  return val;
}
