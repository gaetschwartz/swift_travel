// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchCompletion _$$_SchCompletionFromJson(Map<String, dynamic> json) =>
    _$_SchCompletion(
      label: json['label'] as String,
      dist: (json['dist'] as num?)?.toDouble(),
      iconClass: json['iconclass'] as String?,
      html: json['html'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_SchCompletionToJson(_$_SchCompletion instance) {
  final val = <String, dynamic>{
    'label': instance.label,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dist', instance.dist);
  writeNotNull('iconclass', instance.iconClass);
  writeNotNull('html', instance.html);
  writeNotNull('id', instance.id);
  return val;
}

_$__PlaceTypeIconclass _$$__PlaceTypeIconclassFromJson(
        Map<String, dynamic> json) =>
    _$__PlaceTypeIconclass(
      $enumDecode(_$LocationTypeEnumMap, json['v']),
    );

Map<String, dynamic> _$$__PlaceTypeIconclassToJson(
        _$__PlaceTypeIconclass instance) =>
    <String, dynamic>{
      'v': _$LocationTypeEnumMap[instance.v]!,
    };

const _$LocationTypeEnumMap = {
  LocationType.address: 'address',
  LocationType.business: 'business',
  LocationType.station: 'station',
  LocationType.unknown: 'unknown',
};

_$__VehicleTypeIconclass _$$__VehicleTypeIconclassFromJson(
        Map<String, dynamic> json) =>
    _$__VehicleTypeIconclass(
      $enumDecode(_$VehicleTypeEnumMap, json['v']),
    );

Map<String, dynamic> _$$__VehicleTypeIconclassToJson(
        _$__VehicleTypeIconclass instance) =>
    <String, dynamic>{
      'v': _$VehicleTypeEnumMap[instance.v]!,
    };

const _$VehicleTypeEnumMap = {
  VehicleType.bus: 'bus',
  VehicleType.post: 'post',
  VehicleType.nightBus: 'night_bus',
  VehicleType.tram: 'tram',
  VehicleType.walk: 'walk',
  VehicleType.strain: 'strain',
  VehicleType.train: 'train',
  VehicleType.expressTrain: 'express_train',
  VehicleType.funicular: 'funicular',
  VehicleType.business: 'business',
  VehicleType.gondola: 'adr',
  VehicleType.cablecar: 'cablecar',
  VehicleType.chairlift: 'chairlift',
  VehicleType.ship: 'ship',
  VehicleType.str: 'str',
  VehicleType.metro: 'metro',
  VehicleType.rer: 'rer',
  VehicleType.nightStrain: 'night_strain',
  VehicleType.unknown: 'unknown',
};
