// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sncf_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SncfCompletion _$$_SncfCompletionFromJson(Map<String, dynamic> json) =>
    _$_SncfCompletion(
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => SncfPlace.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SncfPlace>[],
    );

Map<String, dynamic> _$$_SncfCompletionToJson(_$_SncfCompletion instance) =>
    <String, dynamic>{
      'places': instance.places.map((e) => e.toJson()).toList(),
    };
