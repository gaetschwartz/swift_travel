// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffCompletion _$_$_CffCompletionFromJson(Map<String, dynamic> json) {
  return _$_CffCompletion(
    label: json['label'] as String,
    dist: (json['dist'] as num)?.toDouble(),
    iconclass: json['iconclass'] as String,
    html: json['html'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$_$_CffCompletionToJson(_$_CffCompletion instance) =>
    <String, dynamic>{
      'label': instance.label,
      'dist': instance.dist,
      'iconclass': instance.iconclass,
      'html': instance.html,
      'id': instance.id,
    };
