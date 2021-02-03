import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_iconclass.freezed.dart';
part 'vehicle_iconclass.g.dart';

@freezed
abstract class VehicleIconclass with _$VehicleIconclass {
  factory VehicleIconclass(@nullable Vehicle v) = _VehicleIconclass;

  factory VehicleIconclass.fromJson(Map<String, dynamic> json) => _$VehicleIconclassFromJson(json);
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
  favorite,
  ship
}
