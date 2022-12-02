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

enum PlaceType {
  address,
  business,
  station,
  unknown;

  static const _privatePlaces = <PlaceType>[
    PlaceType.address,
    PlaceType.business,
  ];

  bool get isAddress => _privatePlaces.contains(this);
}
