import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';

part 'favorite_stop.freezed.dart';
part 'favorite_stop.g.dart';

@freezed
abstract class FavoriteStop with _$FavoriteStop {
  factory FavoriteStop(String stop, {String name, CffCompletion completion}) = _FavoriteStop;

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
