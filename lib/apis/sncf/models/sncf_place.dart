import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/sncf/models/sncf_administrative_region.dart';

part 'sncf_place.freezed.dart';
part 'sncf_place.g.dart';

@freezed
abstract class SncfPlace with _$SncfPlace {
  @JsonSerializable(explicitToJson: true)
  factory SncfPlace({
    String embeddedType,
    int quality,
    SncfAdministrativeRegion administrativeRegion,
    String name,
    String id,
  }) = _SncfPlace;

  factory SncfPlace.fromJson(Map<String, dynamic> json) => _$SncfPlaceFromJson(json);
}
