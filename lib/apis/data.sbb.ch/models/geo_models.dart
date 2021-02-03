import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_models.freezed.dart';

@freezed
abstract class GeoResponse with _$GeoResponse {
  @JsonSerializable(explicitToJson: true)
  factory GeoResponse(List<GeoResult> results) = _GeoResponse;
  factory GeoResponse.empty() => _GeoResponse([]);

  factory GeoResponse.fromJson(Map<String, dynamic> json) => _$GeoResponseFromJson(json);
}

@freezed
abstract class GeoAttr with _$GeoAttr {
  factory GeoAttr({
    String origin,
    String geomQuadindex,
    int zoomlevel,
    String featureId,
    double lon,
    String detail,
    int rank,
    String geomStBox2d,
    double lat,
    @JsonKey(name: 'num') int number,
    double y,
    double x,
    String label,
  }) = _GeoAttr;

  factory GeoAttr.fromJson(Map<String, dynamic> json) => _$GeoAttrFromJson(json);
}

@freezed
abstract class GeoResult with _$GeoResult {
  @JsonSerializable(explicitToJson: true)
  factory GeoResult({
    int id,
    int weight,
    GeoAttr attrs,
  }) = _GeoResult;

  factory GeoResult.fromJson(Map<String, dynamic> json) => _$GeoResultFromJson(json);
}

@freezed
abstract class GeoError with _$GeoError {
  factory GeoError({
    String status,
    String detail,
    int code,
  }) = _GeoError;

  factory GeoError.fromJson(Map<String, dynamic> json) => _$GeoErrorFromJson(json);
}
