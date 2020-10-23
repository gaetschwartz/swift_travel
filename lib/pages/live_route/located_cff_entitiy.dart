import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/stop.dart';

part 'located_cff_entitiy.freezed.dart';

@freezed
abstract class LocatedCffEntitiy with _$LocatedCffEntitiy {
  factory LocatedCffEntitiy.leg(Leg leg) = LegEntity;
  factory LocatedCffEntitiy.stop(Stop stop) = StopEntity;
}
