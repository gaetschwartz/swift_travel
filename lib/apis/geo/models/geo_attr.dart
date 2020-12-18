import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_attr.freezed.dart';
part 'geo_attr.g.dart';

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
