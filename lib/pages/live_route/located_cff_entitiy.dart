import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/cff/leg.dart';
import 'package:models/cff/stop.dart';

part 'located_cff_entitiy.freezed.dart';

@freezed
abstract class LocatedCffEntitiy with _$LocatedCffEntitiy {
  factory LocatedCffEntitiy.leg(Leg leg) = LegEntity;
  factory LocatedCffEntitiy.stop(Stop stop) = StopEntity;
}
