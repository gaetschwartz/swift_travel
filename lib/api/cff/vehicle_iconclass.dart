import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/types_enum.dart';

part 'vehicle_iconclass.freezed.dart';
part 'vehicle_iconclass.g.dart';

@freezed
abstract class VehicleIconclass with _$VehicleIconclass {
  factory VehicleIconclass(Vehicle v) = _VehicleIconclass;

  factory VehicleIconclass.fromJson(Map<String, dynamic> json) => _$VehicleIconclassFromJson(json);
}
