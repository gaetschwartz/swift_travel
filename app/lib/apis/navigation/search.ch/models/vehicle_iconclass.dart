import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_iconclass.freezed.dart';
part 'vehicle_iconclass.g.dart';

@freezed
class VehicleIconclass with _$VehicleIconclass {
  const factory VehicleIconclass(Vehicle v) = _VehicleIconclass;

  factory VehicleIconclass.fromJson(Map<String, dynamic> json) => _$VehicleIconclassFromJson(json);
}

extension VehicleX on Vehicle {
  static Vehicle parse(String s, {Vehicle unknownValue = Vehicle.unknown}) =>
      _$enumDecode(_$VehicleEnumMap, s, unknownValue: unknownValue);
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
  adr,
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
