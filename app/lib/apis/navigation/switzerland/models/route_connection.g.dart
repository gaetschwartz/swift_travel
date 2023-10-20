// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchRouteConnectionImpl _$$SchRouteConnectionImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SchRouteConnectionImpl',
      json,
      ($checkedConvert) {
        final val = _$SchRouteConnectionImpl(
          from: $checkedConvert('from', (v) => v as String),
          to: $checkedConvert('to', (v) => v as String),
          depDelay: $checkedConvert('dep_delay',
              (v) => const DelayConverter().fromJson(v as String?)),
          departure: $checkedConvert('departure',
              (v) => v == null ? null : DateTime.parse(v as String)),
          arrival: $checkedConvert(
              'arrival', (v) => v == null ? null : DateTime.parse(v as String)),
          durationInSeconds:
              $checkedConvert('duration', (v) => (v as num?)?.toDouble()),
          sbbLegs: $checkedConvert(
              'legs',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => SchLeg.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const <SchLeg>[]),
          disruptions: $checkedConvert(
              'disruptions',
              (v) =>
                  (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(
                        k, Disruption.fromJson(e as Map<String, dynamic>)),
                  ) ??
                  const <String, Disruption>{}),
        );
        return val;
      },
      fieldKeyMap: const {
        'depDelay': 'dep_delay',
        'durationInSeconds': 'duration',
        'sbbLegs': 'legs'
      },
    );

Map<String, dynamic> _$$SchRouteConnectionImplToJson(
    _$SchRouteConnectionImpl instance) {
  final val = <String, dynamic>{
    'from': instance.from,
    'to': instance.to,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dep_delay', const DelayConverter().toJson(instance.depDelay));
  writeNotNull('departure', instance.departure?.toIso8601String());
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('duration', instance.durationInSeconds);
  val['legs'] = instance.sbbLegs.map((e) => e.toJson()).toList();
  val['disruptions'] =
      instance.disruptions.map((k, e) => MapEntry(k, e.toJson()));
  return val;
}
