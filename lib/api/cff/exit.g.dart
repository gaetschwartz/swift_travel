// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exit _$_$_ExitFromJson(Map<String, dynamic> json) {
  return _$_Exit(
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    name: json['name'] as String,
    stopid: json['stopid'] as String,
    waittime: json['waittime'] as int,
    isaddress: json['isaddress'] as bool,
    sbbName: json['sbbName'] as String,
  );
}

Map<String, dynamic> _$_$_ExitToJson(_$_Exit instance) => <String, dynamic>{
      'arrival': instance.arrival?.toIso8601String(),
      'name': instance.name,
      'stopid': instance.stopid,
      'waittime': instance.waittime,
      'isaddress': instance.isaddress,
      'sbbName': instance.sbbName,
    };
