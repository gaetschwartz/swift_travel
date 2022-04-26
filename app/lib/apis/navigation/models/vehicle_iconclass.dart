import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_iconclass.freezed.dart';
part 'vehicle_iconclass.g.dart';

@freezed
class _VehicleIconclass with _$_VehicleIconclass {
  const factory _VehicleIconclass(PlaceType v) = __VehicleIconclass;

  // ignore: unused_element
  factory _VehicleIconclass.fromJson(Map<String, dynamic> json) =>
      _$_VehicleIconclassFromJson(json);
}

extension TransportationModeX on PlaceType {
  static PlaceType parse(
    String s, {
    PlaceType unknownValue = PlaceType.unknown,
  }) =>
      $enumDecode(_$PlaceTypeEnumMap, s, unknownValue: unknownValue);

  static const List<PlaceType> _privatePlaces = [
    PlaceType.address,
    PlaceType.business,
    PlaceType.private
  ];

  bool get isAddress => _privatePlaces.contains(this);
  static bool isAnAddress(PlaceType? s) => s != null && s.isAddress;
}

enum PlaceType {
  bus,
  post,
  @JsonValue('night_bus')
  nightBus,
  tram,
  walk,
  strain,
  train,
  @JsonValue('express_train')
  expressTrain,
  funicular,
  business,
  @JsonValue('adr')
  address,
  private,
  gondola,
  cablecar,
  chairlift,
  ship,
  str,
  metro,
  rer,
  @JsonValue("night_strain")
  nightStrain,
  unknown,
}
