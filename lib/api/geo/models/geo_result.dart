import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_attr.dart';

part 'geo_result.freezed.dart';
part 'geo_result.g.dart';

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
