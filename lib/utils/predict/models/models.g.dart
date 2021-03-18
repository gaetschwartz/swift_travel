// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutePrediction _$_$_RoutePredictionFromJson(Map<String, dynamic> json) {
  return _$_RoutePrediction(
    json['prediction'] == null
        ? null
        : LocalRoute.fromJson(json['prediction'] as Map<String, dynamic>),
    (json['confidence'] as num).toDouble(),
    PredictionArguments.fromJson(json['arguments'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_RoutePredictionToJson(_$_RoutePrediction instance) =>
    <String, dynamic>{
      'prediction': instance.prediction?.toJson(),
      'confidence': instance.confidence,
      'arguments': instance.arguments.toJson(),
    };

_$_FullArguments _$_$_FullArgumentsFromJson(Map<String, dynamic> json) {
  return _$_FullArguments(
    (json['routes'] as List<dynamic>)
        .map((e) => LocalRoute.fromJson(e as Map<String, dynamic>))
        .toList(),
    PredictionArguments.fromJson(json['arguments'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FullArgumentsToJson(_$_FullArguments instance) =>
    <String, dynamic>{
      'routes': instance.routes.map((e) => e.toJson()).toList(),
      'arguments': instance.arguments.toJson(),
    };

_$DateTimeArgument _$_$DateTimeArgumentFromJson(Map<String, dynamic> json) {
  return _$DateTimeArgument(
    json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$_$DateTimeArgumentToJson(_$DateTimeArgument instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
    };

_$SourceDateArguments _$_$SourceDateArgumentsFromJson(
    Map<String, dynamic> json) {
  return _$SourceDateArguments(
    json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    json['source'] as String,
  );
}

Map<String, dynamic> _$_$SourceDateArgumentsToJson(
        _$SourceDateArguments instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'source': instance.source,
    };

_$LocationArgument _$_$LocationArgumentFromJson(Map<String, dynamic> json) {
  return _$LocationArgument(
    LatLon.fromJson(json['latLon'] as Map<String, dynamic>),
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$_$LocationArgumentToJson(_$LocationArgument instance) =>
    <String, dynamic>{
      'latLon': instance.latLon.toJson(),
      'dateTime': instance.dateTime?.toIso8601String(),
    };
