import 'package:freezed_annotation/freezed_annotation.dart';

enum VehicleType {
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
  gondola,
  cablecar,
  chairlift,
  ship,
  str,
  metro,
  rer,
  @JsonValue('night_strain')
  nightStrain,
  unknown,
}

enum LocationType {
  address,
  business,
  station,
  unknown;

  bool get isPrivate =>
      this == LocationType.address || this == LocationType.business;
}
