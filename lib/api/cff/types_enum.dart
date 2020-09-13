import 'package:freezed_annotation/freezed_annotation.dart';

enum Vehicle {
  bus,
  post,
  @JsonValue("night_bus")
  nightBus,
  tram,
  walk,
  strain,
  train,
  @JsonValue("express_train")
  expressTrain,
  funicular,
  business,
  adr,
  private,
  gondola,
}
