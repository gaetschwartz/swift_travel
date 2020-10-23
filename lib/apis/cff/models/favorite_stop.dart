// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';

part 'favorite_stop.freezed.dart';
part 'favorite_stop.g.dart';

@freezed
abstract class FavoriteStop implements _$FavoriteStop {
  factory FavoriteStop(String stop, {String name}) = _FavoriteStop;
  const FavoriteStop._();

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
  CffCompletion toCompletion() =>
      CffCompletion(label: stop, favoriteName: name, iconclass: "favorite");
}
