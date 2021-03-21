// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbRouteConnection _$_$_SbbRouteConnectionFromJson(
    Map<String, dynamic> json) {
  return $checkedNew(r'_$_SbbRouteConnection', json, () {
    final val = _$_SbbRouteConnection(
      from: $checkedConvert(json, 'from', (v) => v as String),
      to: $checkedConvert(json, 'to', (v) => v as String),
      depDelay: $checkedConvert(json, 'dep_delay', (v) => delayFromJson(v)),
      departure: $checkedConvert(json, 'departure',
          (v) => v == null ? null : DateTime.parse(v as String)),
      arrival: $checkedConvert(json, 'arrival',
          (v) => v == null ? null : DateTime.parse(v as String)),
      duration:
          $checkedConvert(json, 'duration', (v) => (v as num?)?.toDouble()),
      sbbLegs: $checkedConvert(
          json,
          'legs',
          (v) => (v as List<dynamic>)
              .map((e) => SbbLeg.fromJson(e as Map<String, dynamic>))
              .toList()),
      disruptions: $checkedConvert(
              json,
              'disruptions',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(
                        k, Disruption.fromJson(e as Map<String, dynamic>)),
                  )) ??
          {},
    );
    return val;
  }, fieldKeyMap: const {'depDelay': 'dep_delay', 'sbbLegs': 'legs'});
}

Map<String, dynamic> _$_$_SbbRouteConnectionToJson(
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
