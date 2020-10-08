import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_error.freezed.dart';
part 'geo_error.g.dart';

@freezed
abstract class GeoError with _$GeoError {
  factory GeoError({
    String status,
    String detail,
    int code,
  }) = _GeoError;

  factory GeoError.fromJson(Map<String, dynamic> json) => _$GeoErrorFromJson(json);
}
