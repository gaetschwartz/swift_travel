import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_iconclass.freezed.dart';
part 'vehicle_iconclass.g.dart';

@freezed
class _VehicleIconclass with _$_VehicleIconclass {
  @Deprecated('Do not use this class directly, use VehicleX.parse instead.')
  const factory _VehicleIconclass(Vehicle v) = __VehicleIconclass;

  @Deprecated('Do not use this class directly, use VehicleX.parse instead.')
  factory _VehicleIconclass.fromJson(Map<String, dynamic> json) =>
      _$_VehicleIconclassFromJson(json);
}

extension VehicleX on Vehicle {
  static Vehicle parse(String s, {Vehicle unknownValue = Vehicle.unknown}) =>
      _$enumDecode(_$VehicleEnumMap, s, unknownValue: unknownValue);

  static const List<Vehicle> _privatePlaces = [Vehicle.address, Vehicle.business, Vehicle.private];

  bool get isAddress => _privatePlaces.contains(this);
  static bool isAnAddress(Vehicle? s) => s != null && s.isAddress;
}

enum Vehicle {
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
  unknown,
}
