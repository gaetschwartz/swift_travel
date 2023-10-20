// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchStopImpl _$$SchStopImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SchStopImpl',
      json,
      ($checkedConvert) {
        final val = _$SchStopImpl(
          sbbName: $checkedConvert('name', (v) => v as String?),
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
      fieldKeyMap: const {'sbbName': 'name'},
    );

Map<String, dynamic> _$$SchStopImplToJson(_$SchStopImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.sbbName);
  writeNotNull('id', instance.id);
  writeNotNull('departure', _toJson(instance.departure));
  writeNotNull('arrival', _toJson(instance.arrival));
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('x', const IntConverter().toJson(instance.x));
  writeNotNull('y', const IntConverter().toJson(instance.y));
  return val;
}
