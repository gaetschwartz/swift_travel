// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_iconclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$__VehicleIconclass _$$__VehicleIconclassFromJson(Map<String, dynamic> json) =>
    _$__VehicleIconclass(
      $enumDecode(_$PlaceTypeEnumMap, json['v']),
    );

Map<String, dynamic> _$$__VehicleIconclassToJson(
        _$__VehicleIconclass instance) =>
    <String, dynamic>{
      'v': _$PlaceTypeEnumMap[instance.v]!,
    };

const _$PlaceTypeEnumMap = {
  PlaceType.bus: 'bus',
  PlaceType.post: 'post',
  PlaceType.nightBus: 'night_bus',
  PlaceType.tram: 'tram',
  PlaceType.walk: 'walk',
  PlaceType.strain: 'strain',
  PlaceType.train: 'train',
  PlaceType.expressTrain: 'express_train',
  PlaceType.funicular: 'funicular',
  PlaceType.business: 'business',
  PlaceType.address: 'adr',
  PlaceType.private: 'private',
  PlaceType.gondola: 'gondola',
  PlaceType.cablecar: 'cablecar',
  PlaceType.chairlift: 'chairlift',
  PlaceType.ship: 'ship',
  PlaceType.str: 'str',
  PlaceType.metro: 'metro',
  PlaceType.rer: 'rer',
  PlaceType.nightStrain: 'night_strain',
  PlaceType.unknown: 'unknown',
};
