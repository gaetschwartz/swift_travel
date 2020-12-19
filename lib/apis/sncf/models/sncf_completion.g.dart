// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sncf_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SncfCompletion _$_$_SncfCompletionFromJson(Map<String, dynamic> json) {
  return _$_SncfCompletion(
    places: (json['places'] as List)
            ?.map((e) => e == null
                ? null
                : SncfPlace.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SncfCompletionToJson(_$_SncfCompletion instance) =>
    <String, dynamic>{
      'places': instance.places?.map((e) => e?.toJson())?.toList(),
    };
