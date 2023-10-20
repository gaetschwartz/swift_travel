// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sncf_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SncfCompletionImpl _$$SncfCompletionImplFromJson(Map<String, dynamic> json) =>
    _$SncfCompletionImpl(
      places: (json['places'] as List<dynamic>?)
              ?.map((e) => SncfPlace.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SncfPlace>[],
    );

Map<String, dynamic> _$$SncfCompletionImplToJson(
        _$SncfCompletionImpl instance) =>
    <String, dynamic>{
      'places': instance.places.map((e) => e.toJson()).toList(),
    };
