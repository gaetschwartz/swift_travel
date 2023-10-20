// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoutePredictionImpl _$$RoutePredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$RoutePredictionImpl(
      _$JsonConverterFromJson<Map<String, dynamic>, LocalRoute>(
          json['prediction'], const LocalRouteConverter().fromJson),
      (json['confidence'] as num).toDouble(),
      PredictionArguments.fromJson(json['arguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoutePredictionImplToJson(
        _$RoutePredictionImpl instance) =>
    <String, dynamic>{
      'prediction': _$JsonConverterToJson<Map<String, dynamic>, LocalRoute>(
          instance.prediction, const LocalRouteConverter().toJson),
      'confidence': instance.confidence,
      'arguments': instance.arguments.toJson(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$FullArgumentsImpl _$$FullArgumentsImplFromJson(Map<String, dynamic> json) =>
    _$FullArgumentsImpl(
      (json['routes'] as List<dynamic>)
          .map((e) => LocalRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      PredictionArguments.fromJson(json['arguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FullArgumentsImplToJson(_$FullArgumentsImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes.map((e) => e.toJson()).toList(),
      'arguments': instance.arguments.toJson(),
    };

_$EmptyArgumentImpl _$$EmptyArgumentImplFromJson(Map<String, dynamic> json) =>
    _$EmptyArgumentImpl(
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyArgumentImplToJson(_$EmptyArgumentImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$SourceDateArgumentsImpl _$$SourceDateArgumentsImplFromJson(
        Map<String, dynamic> json) =>
    _$SourceDateArgumentsImpl(
      json['source'] as String,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SourceDateArgumentsImplToJson(
        _$SourceDateArgumentsImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'dateTime': instance.dateTime?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$LocationArgumentImpl _$$LocationArgumentImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationArgumentImpl(
      LatLon.fromJson(json['latLon'] as Map<String, dynamic>),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocationArgumentImplToJson(
        _$LocationArgumentImpl instance) =>
    <String, dynamic>{
      'latLon': instance.latLon.toJson(),
      'dateTime': instance.dateTime?.toIso8601String(),
      'runtimeType': instance.$type,
    };
