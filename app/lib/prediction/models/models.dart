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

  factory RoutePrediction.empty(PredictionArguments arguments) =>
      RoutePrediction(null, 0, arguments);

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

abstract class IterableTransformer<T> {
  Iterable<T> transform(Iterable<T> iterable);
}

abstract class RoutesTransformer extends IterableTransformer<LocalRoute> {
  factory RoutesTransformer.fromArguments(PredictionArguments args) =>
      args.maybeMap((value) => UnchangedTransformer(), orElse: () => DoubleFlippedRoutes());
}

class DoubleFlippedRoutes implements RoutesTransformer {
  @override
  Iterable<LocalRoute> transform(Iterable<LocalRoute> routes) sync* {
    for (final e in routes) {
      yield e;
      yield e.flipped;
    }
  }
}

class UnchangedTransformer implements RoutesTransformer {
  @override
  Iterable<LocalRoute> transform(Iterable<LocalRoute> routes) => routes;
}

@freezed
class Pair<R, S> with _$Pair<R, S> {
  const factory Pair(R first, S second) = _Pair;
  const Pair._();

  Pair<S, R> get flipped => Pair<S, R>(second, first);
}

void main() {
  const p1 = Pair<int, int>(1, 2);
  const p2 = Pair<int, int>(2, 1);
  print('${p1.hashCode == p2.hashCode ? 'equal' : 'different'} hashcode');
  print(p1 == p2 ? 'equal' : 'different');
}
