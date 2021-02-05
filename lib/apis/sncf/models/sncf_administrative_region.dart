import 'package:freezed_annotation/freezed_annotation.dart';

import 'coord.dart';

part 'sncf_administrative_region.freezed.dart';
part 'sncf_administrative_region.g.dart';

@freezed
abstract class SncfAdministrativeRegion with _$SncfAdministrativeRegion {
  @JsonSerializable(explicitToJson: true)
  factory SncfAdministrativeRegion({
    String insee,
    String name,
    int level,
    Coord coord,
    String label,
    String id,
    String zipCode,
  }) = _SncfAdministrativeRegion;

  factory SncfAdministrativeRegion.fromJson(Map<String, dynamic> json) =>
      _$SncfAdministrativeRegionFromJson(json);
}
