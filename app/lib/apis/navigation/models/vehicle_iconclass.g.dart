// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_iconclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$__VehicleIconclass _$$__VehicleIconclassFromJson(Map<String, dynamic> json) =>
    _$__VehicleIconclass(
      $enumDecode(_$TransportationModeEnumMap, json['v']),
    );

Map<String, dynamic> _$$__VehicleIconclassToJson(
        _$__VehicleIconclass instance) =>
    <String, dynamic>{
      'v': _$TransportationModeEnumMap[instance.v],
    };

const _$TransportationModeEnumMap = {
  TransportationMode.bus: 'bus',
  TransportationMode.post: 'post',
  TransportationMode.nightBus: 'night_bus',
  TransportationMode.tram: 'tram',
  TransportationMode.walk: 'walk',
  TransportationMode.strain: 'strain',
  TransportationMode.train: 'train',
  TransportationMode.expressTrain: 'express_train',
  TransportationMode.funicular: 'funicular',
  TransportationMode.business: 'business',
  TransportationMode.address: 'adr',
  TransportationMode.private: 'private',
  TransportationMode.gondola: 'gondola',
  TransportationMode.cablecar: 'cablecar',
  TransportationMode.chairlift: 'chairlift',
  TransportationMode.ship: 'ship',
  TransportationMode.str: 'str',
  TransportationMode.metro: 'metro',
  TransportationMode.rer: 'rer',
  TransportationMode.nightStrain: 'night_strain',
  TransportationMode.unknown: 'unknown',
};
