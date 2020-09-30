// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteStop _$_$_FavoriteStopFromJson(Map<String, dynamic> json) {
  return _$_FavoriteStop(
    json['stop'] as String,
    name: json['name'] as String,
    completion: json['completion'] == null
        ? null
        : CffCompletion.fromJson(json['completion'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FavoriteStopToJson(_$_FavoriteStop instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'name': instance.name,
      'completion': instance.completion,
    };
