// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_iconclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$__VehicleIconclass _$$__VehicleIconclassFromJson(Map<String, dynamic> json) =>
    _$__VehicleIconclass(
      _$enumDecode(_$TransportationModeEnumMap, json['v']),
    );

Map<String, dynamic> _$$__VehicleIconclassToJson(
        _$__VehicleIconclass instance) =>
    <String, dynamic>{
      'v': _$TransportationModeEnumMap[instance.v],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

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
  TransportationMode.unknown: 'unknown',
};
