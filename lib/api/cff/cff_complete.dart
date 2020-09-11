import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/cff_completion.dart';

part 'cff_complete.freezed.dart';

@freezed
abstract class CffComplete with _$CffComplete {
  factory CffComplete(String resultFor, List<CffCompletion> completion) = _CffComplete;
}
