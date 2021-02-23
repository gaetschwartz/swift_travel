import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_models.freezed.dart';
part 'geo_models.g.dart';

@freezed
class GeoResponse with _$GeoResponse {
  @JsonSerializable(explicitToJson: true)
  const factory GeoResponse(List<GeoResult> results) = _GeoResponse;
  factory GeoResponse.empty() => const _GeoResponse([]);

  factory GeoResponse.fromJson(Map<String, dynamic> json) => _$GeoResponseFromJson(json);
}

@freezed
class GeoAttr with _$GeoAttr {
  const factory GeoAttr({
    String? origin,
    String? geomQuadindex,
    int? zoomlevel,
    String? featureId,
    double? lon,
    String? detail,
    int? rank,
    String? geomStBox2d,
    double? lat,
    @JsonKey(name: 'num') int? number,
    double? y,
    double? x,
    String? label,
  }) = _GeoAttr;

  factory GeoAttr.fromJson(Map<String, dynamic> json) => _$GeoAttrFromJson(json);
}

@freezed
class GeoResult with _$GeoResult {
  @JsonSerializable(explicitToJson: true)
  const factory GeoResult({
    int? id,
    int? weight,
    GeoAttr? attrs,
  }) = _GeoResult;

  factory GeoResult.fromJson(Map<String, dynamic> json) => _$GeoResultFromJson(json);
}

@freezed
class GeoError with _$GeoError {
  const factory GeoError({
    String? status,
    String? detail,
    int? code,
  }) = _GeoError;

  factory GeoError.fromJson(Map<String, dynamic> json) => _$GeoErrorFromJson(json);
}
