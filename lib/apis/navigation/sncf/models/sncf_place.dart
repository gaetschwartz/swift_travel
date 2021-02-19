import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/sncf/models/sncf_administrative_region.dart';

part 'sncf_place.freezed.dart';
part 'sncf_place.g.dart';

@freezed
class SncfPlace with _$SncfPlace, Completion {
  @JsonSerializable(explicitToJson: true)
  const factory SncfPlace({
    String? embeddedType,
    int? quality,
    SncfAdministrativeRegion? administrativeRegion,
    required String name,
    String? id,
    String? favoriteName,
  }) = _SncfPlace;
  const SncfPlace._();

  factory SncfPlace.fromJson(Map<String, dynamic> json) => _$SncfPlaceFromJson(json);

  @override
  double? get dist => null;

  @override
  String get label => name;

  @override
  DataOrigin get origin => DataOrigin.data;

  @override
  Vehicle? get type => null;
}
