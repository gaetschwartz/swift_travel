import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_iconclass.freezed.dart';
part 'vehicle_iconclass.g.dart';

@freezed
class _VehicleIconclass with _$_VehicleIconclass {
  const factory _VehicleIconclass(TransportationMode v) = __VehicleIconclass;

  factory _VehicleIconclass.fromJson(Map<String, dynamic> json) =>
      _$_VehicleIconclassFromJson(json);
}

extension TransportationModeX on TransportationMode {
  static TransportationMode parse(
    String s, {
    TransportationMode unknownValue = TransportationMode.unknown,
  }) =>
      $enumDecode(_$TransportationModeEnumMap, s, unknownValue: unknownValue);

  static const List<TransportationMode> _privatePlaces = [
    TransportationMode.address,
    TransportationMode.business,
    TransportationMode.private
  ];

  bool get isAddress => _privatePlaces.contains(this);
  static bool isAnAddress(TransportationMode? s) => s != null && s.isAddress;
}

enum TransportationMode {
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
