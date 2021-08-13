// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbRouteConnection _$$_SbbRouteConnectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SbbRouteConnection',
      json,
      ($checkedConvert) {
        final val = _$_SbbRouteConnection(
          from: $checkedConvert('from', (v) => v as String),
          to: $checkedConvert('to', (v) => v as String),
          depDelay: $checkedConvert('dep_delay', (v) => delayFromJson(v)),
          departure: $checkedConvert('departure',
              (v) => v == null ? null : DateTime.parse(v as String)),
          arrival: $checkedConvert(
              'arrival', (v) => v == null ? null : DateTime.parse(v as String)),
          duration: $checkedConvert('duration', (v) => (v as num?)?.toDouble()),
          sbbLegs: $checkedConvert(
              'legs',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => SbbLeg.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const <SbbLeg>[]),
          disruptions: $checkedConvert(
              'disruptions',
              (v) =>
                  (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(
                        k, Disruption.fromJson(e as Map<String, dynamic>)),
                  ) ??
                  {}),
        );
        return val;
      },
      fieldKeyMap: const {'depDelay': 'dep_delay', 'sbbLegs': 'legs'},
    );

Map<String, dynamic> _$$_SbbRouteConnectionToJson(
    _$_SbbRouteConnection instance) {
  final val = <String, dynamic>{
    'from': instance.from,
    'to': instance.to,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dep_delay', delayToJson(instance.depDelay));
  writeNotNull('departure', instance.departure?.toIso8601String());
  writeNotNull('arrival', instance.arrival?.toIso8601String());
  writeNotNull('duration', instance.duration);
  val['legs'] = instance.sbbLegs.map((e) => e.toJson()).toList();
  val['disruptions'] =
      instance.disruptions.map((k, e) => MapEntry(k, e.toJson()));
  return val;
}
