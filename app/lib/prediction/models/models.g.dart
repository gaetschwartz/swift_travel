// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutePrediction _$$_RoutePredictionFromJson(Map<String, dynamic> json) =>
    _$_RoutePrediction(
      json['prediction'] == null
          ? null
          : LocalRoute.fromJson(json['prediction'] as Map<String, dynamic>),
      (json['confidence'] as num).toDouble(),
      PredictionArguments.fromJson(json['arguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoutePredictionToJson(_$_RoutePrediction instance) =>
    <String, dynamic>{
      'prediction': instance.prediction?.toJson(),
      'confidence': instance.confidence,
      'arguments': instance.arguments.toJson(),
    };

_$_FullArguments _$$_FullArgumentsFromJson(Map<String, dynamic> json) =>
    _$_FullArguments(
      (json['routes'] as List<dynamic>)
          .map((e) => LocalRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      PredictionArguments.fromJson(json['arguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FullArgumentsToJson(_$_FullArguments instance) =>
    <String, dynamic>{
      'routes': instance.routes.map((e) => e.toJson()).toList(),
      'arguments': instance.arguments.toJson(),
    };

_$EmptyArgument _$$EmptyArgumentFromJson(Map<String, dynamic> json) =>
    _$EmptyArgument(
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyArgumentToJson(_$EmptyArgument instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$SourceDateArguments _$$SourceDateArgumentsFromJson(
        Map<String, dynamic> json) =>
    _$SourceDateArguments(
      json['source'] as String,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SourceDateArgumentsToJson(
        _$SourceDateArguments instance) =>
    <String, dynamic>{
      'source': instance.source,
      'dateTime': instance.dateTime?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$LocationArgument _$$LocationArgumentFromJson(Map<String, dynamic> json) =>
    _$LocationArgument(
      LatLon.fromJson(json['latLon'] as Map<String, dynamic>),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocationArgumentToJson(_$LocationArgument instance) =>
    <String, dynamic>{
      'latLon': instance.latLon.toJson(),
      'dateTime': instance.dateTime?.toIso8601String(),
      'runtimeType': instance.$type,
    };
