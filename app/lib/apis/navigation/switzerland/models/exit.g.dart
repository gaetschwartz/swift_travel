// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExitImpl _$$ExitImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$ExitImpl',
      json,
      ($checkedConvert) {
        final val = _$ExitImpl(
          name: $checkedConvert('name', (v) => v as String),
          arrDelay: $checkedConvert('arr_delay',
              (v) => const DelayConverter().fromJson(v as String?)),
          arrival: $checkedConvert(
              'arrival', (v) => v == null ? null : DateTime.parse(v as String)),
          lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
          lon: $checkedConvert('lon', (v) => (v as num?)?.toDouble()),
          sbbName: $checkedConvert('sbbName', (v) => v as String?),
          stopid: $checkedConvert('stopid', (v) => v as String?),
          track: $checkedConvert('track', (v) => v as String?),
          waittime: $checkedConvert('waittime', (v) => v as int? ?? 0),
          isaddress: $checkedConvert('isaddress', (v) => v as bool? ?? false),
          x: $checkedConvert('x', (v) => const IntConverter().fromJson(v)),
          y: $checkedConvert('y', (v) => const IntConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {'arrDelay': 'arr_delay'},
    );

Map<String, dynamic> _$$ExitImplToJson(_$ExitImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arr_delay', const DelayConverter().toJson(instance.arrDelay));
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  writeNotNull('sbbName', instance.sbbName);
  writeNotNull('stopid', instance.stopid);
  writeNotNull('track', instance.track);
  val['waittime'] = instance.waittime;
  val['isaddress'] = instance.isaddress;
  writeNotNull('x', const IntConverter().toJson(instance.x));
  writeNotNull('y', const IntConverter().toJson(instance.y));
  return val;
}
