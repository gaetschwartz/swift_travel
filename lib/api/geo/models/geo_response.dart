import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_result.dart';

part 'geo_response.freezed.dart';
part 'geo_response.g.dart';

@freezed
abstract class GeoResponse with _$GeoResponse {
  @JsonSerializable(explicitToJson: true)
  factory GeoResponse(List<GeoResult> results) = _GeoResponse;

  factory GeoResponse.fromJson(Map<String, dynamic> json) => _$GeoResponseFromJson(json);
}
