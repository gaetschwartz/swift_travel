import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class RoutePrediction with _$RoutePrediction {
  @JsonSerializable(explicitToJson: true)
  const factory RoutePrediction(
    @LocalRouteConverter() LocalRoute? prediction,
    double confidence,
    PredictionArguments arguments,
  ) = _RoutePrediction;

  factory RoutePrediction.fromJson(Map<String, dynamic> json) => _$RoutePredictionFromJson(json);
}

@freezed
class FullArguments with _$FullArguments {
  @JsonSerializable(explicitToJson: true)
  const factory FullArguments(
    List<LocalRoute> routes,
    PredictionArguments arguments,
  ) = _FullArguments;

  factory FullArguments.fromJson(Map<String, dynamic> json) => _$FullArgumentsFromJson(json);
}

@freezed
class PredictionArguments with _$PredictionArguments {
  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments(DateTime? dateTime) = DateTimeArgument;

  const PredictionArguments._();

  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments.withSource(DateTime? dateTime, String source) =
      SourceDateArguments;

  @JsonSerializable(explicitToJson: true)
  const factory PredictionArguments.withLocation(LatLon latLon, {DateTime? dateTime}) =
      LocationArgument;

  factory PredictionArguments.from(DateTime dateTime, {String? source, LatLon? pos}) {
    if (pos != null) {
      return PredictionArguments.withLocation(pos, dateTime: dateTime);
    }
    if (source != null) {
      return PredictionArguments.withSource(dateTime, source);
    }
    return PredictionArguments(dateTime);
  }

  factory PredictionArguments.fromJson(Map<String, dynamic> json) =>
      _$PredictionArgumentsFromJson(json);

  PredictionArguments round([int minutes = 5]) {
    final dt = dateTime;
    if (dt == null) {
      return this;
    }

    return copyWith(
      dateTime: DateTime(
        dt.year,
        dt.month,
        dt.day,
        dt.hour,
        dt.minute - dt.minute % minutes,
      ),
    );
  }
}
