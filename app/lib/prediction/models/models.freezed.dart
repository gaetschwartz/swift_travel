// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutePrediction _$RoutePredictionFromJson(Map<String, dynamic> json) {
  return _RoutePrediction.fromJson(json);
}

/// @nodoc
class _$RoutePredictionTearOff {
  const _$RoutePredictionTearOff();

  _RoutePrediction call(@LocalRouteConverter() LocalRoute? prediction,
      double confidence, PredictionArguments arguments) {
    return _RoutePrediction(
      prediction,
      confidence,
      arguments,
    );
  }

  RoutePrediction fromJson(Map<String, Object> json) {
    return RoutePrediction.fromJson(json);
  }
}

/// @nodoc
const $RoutePrediction = _$RoutePredictionTearOff();

/// @nodoc
mixin _$RoutePrediction {
  @LocalRouteConverter()
  LocalRoute? get prediction => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  PredictionArguments get arguments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutePredictionCopyWith<RoutePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutePredictionCopyWith<$Res> {
  factory $RoutePredictionCopyWith(
          RoutePrediction value, $Res Function(RoutePrediction) then) =
      _$RoutePredictionCopyWithImpl<$Res>;
  $Res call(
      {@LocalRouteConverter() LocalRoute? prediction,
      double confidence,
      PredictionArguments arguments});

  $LocalRouteCopyWith<$Res>? get prediction;
  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class _$RoutePredictionCopyWithImpl<$Res>
    implements $RoutePredictionCopyWith<$Res> {
  _$RoutePredictionCopyWithImpl(this._value, this._then);

  final RoutePrediction _value;
  // ignore: unused_field
  final $Res Function(RoutePrediction) _then;

  @override
  $Res call({
    Object? prediction = freezed,
    Object? confidence = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_value.copyWith(
      prediction: prediction == freezed
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as LocalRoute?,
      confidence: confidence == freezed
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ));
  }

  @override
  $LocalRouteCopyWith<$Res>? get prediction {
    if (_value.prediction == null) {
      return null;
    }

    return $LocalRouteCopyWith<$Res>(_value.prediction!, (value) {
      return _then(_value.copyWith(prediction: value));
    });
  }

  @override
  $PredictionArgumentsCopyWith<$Res> get arguments {
    return $PredictionArgumentsCopyWith<$Res>(_value.arguments, (value) {
      return _then(_value.copyWith(arguments: value));
    });
  }
}

/// @nodoc
abstract class _$RoutePredictionCopyWith<$Res>
    implements $RoutePredictionCopyWith<$Res> {
  factory _$RoutePredictionCopyWith(
          _RoutePrediction value, $Res Function(_RoutePrediction) then) =
      __$RoutePredictionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@LocalRouteConverter() LocalRoute? prediction,
      double confidence,
      PredictionArguments arguments});

  @override
  $LocalRouteCopyWith<$Res>? get prediction;
  @override
  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class __$RoutePredictionCopyWithImpl<$Res>
    extends _$RoutePredictionCopyWithImpl<$Res>
    implements _$RoutePredictionCopyWith<$Res> {
  __$RoutePredictionCopyWithImpl(
      _RoutePrediction _value, $Res Function(_RoutePrediction) _then)
      : super(_value, (v) => _then(v as _RoutePrediction));

  @override
  _RoutePrediction get _value => super._value as _RoutePrediction;

  @override
  $Res call({
    Object? prediction = freezed,
    Object? confidence = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_RoutePrediction(
      prediction == freezed
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as LocalRoute?,
      confidence == freezed
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RoutePrediction implements _RoutePrediction {
  const _$_RoutePrediction(
      @LocalRouteConverter() this.prediction, this.confidence, this.arguments);

  factory _$_RoutePrediction.fromJson(Map<String, dynamic> json) =>
      _$_$_RoutePredictionFromJson(json);

  @override
  @LocalRouteConverter()
  final LocalRoute? prediction;
  @override
  final double confidence;
  @override
  final PredictionArguments arguments;

  @override
  String toString() {
    return 'RoutePrediction(prediction: $prediction, confidence: $confidence, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoutePrediction &&
            (identical(other.prediction, prediction) ||
                const DeepCollectionEquality()
                    .equals(other.prediction, prediction)) &&
            (identical(other.confidence, confidence) ||
                const DeepCollectionEquality()
                    .equals(other.confidence, confidence)) &&
            (identical(other.arguments, arguments) ||
                const DeepCollectionEquality()
                    .equals(other.arguments, arguments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(prediction) ^
      const DeepCollectionEquality().hash(confidence) ^
      const DeepCollectionEquality().hash(arguments);

  @JsonKey(ignore: true)
  @override
  _$RoutePredictionCopyWith<_RoutePrediction> get copyWith =>
      __$RoutePredictionCopyWithImpl<_RoutePrediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoutePredictionToJson(this);
  }
}

abstract class _RoutePrediction implements RoutePrediction {
  const factory _RoutePrediction(@LocalRouteConverter() LocalRoute? prediction,
      double confidence, PredictionArguments arguments) = _$_RoutePrediction;

  factory _RoutePrediction.fromJson(Map<String, dynamic> json) =
      _$_RoutePrediction.fromJson;

  @override
  @LocalRouteConverter()
  LocalRoute? get prediction => throw _privateConstructorUsedError;
  @override
  double get confidence => throw _privateConstructorUsedError;
  @override
  PredictionArguments get arguments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoutePredictionCopyWith<_RoutePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

FullArguments _$FullArgumentsFromJson(Map<String, dynamic> json) {
  return _FullArguments.fromJson(json);
}

/// @nodoc
class _$FullArgumentsTearOff {
  const _$FullArgumentsTearOff();

  _FullArguments call(List<LocalRoute> routes, PredictionArguments arguments) {
    return _FullArguments(
      routes,
      arguments,
    );
  }

  FullArguments fromJson(Map<String, Object> json) {
    return FullArguments.fromJson(json);
  }
}

/// @nodoc
const $FullArguments = _$FullArgumentsTearOff();

/// @nodoc
mixin _$FullArguments {
  List<LocalRoute> get routes => throw _privateConstructorUsedError;
  PredictionArguments get arguments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullArgumentsCopyWith<FullArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullArgumentsCopyWith<$Res> {
  factory $FullArgumentsCopyWith(
          FullArguments value, $Res Function(FullArguments) then) =
      _$FullArgumentsCopyWithImpl<$Res>;
  $Res call({List<LocalRoute> routes, PredictionArguments arguments});

  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class _$FullArgumentsCopyWithImpl<$Res>
    implements $FullArgumentsCopyWith<$Res> {
  _$FullArgumentsCopyWithImpl(this._value, this._then);

  final FullArguments _value;
  // ignore: unused_field
  final $Res Function(FullArguments) _then;

  @override
  $Res call({
    Object? routes = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_value.copyWith(
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<LocalRoute>,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ));
  }

  @override
  $PredictionArgumentsCopyWith<$Res> get arguments {
    return $PredictionArgumentsCopyWith<$Res>(_value.arguments, (value) {
      return _then(_value.copyWith(arguments: value));
    });
  }
}

/// @nodoc
abstract class _$FullArgumentsCopyWith<$Res>
    implements $FullArgumentsCopyWith<$Res> {
  factory _$FullArgumentsCopyWith(
          _FullArguments value, $Res Function(_FullArguments) then) =
      __$FullArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({List<LocalRoute> routes, PredictionArguments arguments});

  @override
  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class __$FullArgumentsCopyWithImpl<$Res>
    extends _$FullArgumentsCopyWithImpl<$Res>
    implements _$FullArgumentsCopyWith<$Res> {
  __$FullArgumentsCopyWithImpl(
      _FullArguments _value, $Res Function(_FullArguments) _then)
      : super(_value, (v) => _then(v as _FullArguments));

  @override
  _FullArguments get _value => super._value as _FullArguments;

  @override
  $Res call({
    Object? routes = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_FullArguments(
      routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<LocalRoute>,
      arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FullArguments implements _FullArguments {
  const _$_FullArguments(this.routes, this.arguments);

  factory _$_FullArguments.fromJson(Map<String, dynamic> json) =>
      _$_$_FullArgumentsFromJson(json);

  @override
  final List<LocalRoute> routes;
  @override
  final PredictionArguments arguments;

  @override
  String toString() {
    return 'FullArguments(routes: $routes, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FullArguments &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)) &&
            (identical(other.arguments, arguments) ||
                const DeepCollectionEquality()
                    .equals(other.arguments, arguments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(routes) ^
      const DeepCollectionEquality().hash(arguments);

  @JsonKey(ignore: true)
  @override
  _$FullArgumentsCopyWith<_FullArguments> get copyWith =>
      __$FullArgumentsCopyWithImpl<_FullArguments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FullArgumentsToJson(this);
  }
}

abstract class _FullArguments implements FullArguments {
  const factory _FullArguments(
          List<LocalRoute> routes, PredictionArguments arguments) =
      _$_FullArguments;

  factory _FullArguments.fromJson(Map<String, dynamic> json) =
      _$_FullArguments.fromJson;

  @override
  List<LocalRoute> get routes => throw _privateConstructorUsedError;
  @override
  PredictionArguments get arguments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FullArgumentsCopyWith<_FullArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

PredictionArguments _$PredictionArgumentsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return DateTimeArgument.fromJson(json);
    case 'withSource':
      return SourceDateArguments.fromJson(json);
    case 'withLocation':
      return LocationArgument.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$PredictionArgumentsTearOff {
  const _$PredictionArgumentsTearOff();

  DateTimeArgument call(DateTime? dateTime) {
    return DateTimeArgument(
      dateTime,
    );
  }

  SourceDateArguments withSource(DateTime? dateTime, String source) {
    return SourceDateArguments(
      dateTime,
      source,
    );
  }

  LocationArgument withLocation(LatLon latLon, {DateTime? dateTime}) {
    return LocationArgument(
      latLon,
      dateTime: dateTime,
    );
  }

  PredictionArguments fromJson(Map<String, Object> json) {
    return PredictionArguments.fromJson(json);
  }
}

/// @nodoc
const $PredictionArguments = _$PredictionArgumentsTearOff();

/// @nodoc
mixin _$PredictionArguments {
  DateTime? get dateTime => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DateTime? dateTime) $default, {
    required TResult Function(DateTime? dateTime, String source) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DateTime? dateTime)? $default, {
    TResult Function(DateTime? dateTime, String source)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DateTimeArgument value) $default, {
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DateTimeArgument value)? $default, {
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionArgumentsCopyWith<PredictionArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionArgumentsCopyWith<$Res> {
  factory $PredictionArgumentsCopyWith(
          PredictionArguments value, $Res Function(PredictionArguments) then) =
      _$PredictionArgumentsCopyWithImpl<$Res>;
  $Res call({DateTime? dateTime});
}

/// @nodoc
class _$PredictionArgumentsCopyWithImpl<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  _$PredictionArgumentsCopyWithImpl(this._value, this._then);

  final PredictionArguments _value;
  // ignore: unused_field
  final $Res Function(PredictionArguments) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class $DateTimeArgumentCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory $DateTimeArgumentCopyWith(
          DateTimeArgument value, $Res Function(DateTimeArgument) then) =
      _$DateTimeArgumentCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? dateTime});
}

/// @nodoc
class _$DateTimeArgumentCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res>
    implements $DateTimeArgumentCopyWith<$Res> {
  _$DateTimeArgumentCopyWithImpl(
      DateTimeArgument _value, $Res Function(DateTimeArgument) _then)
      : super(_value, (v) => _then(v as DateTimeArgument));

  @override
  DateTimeArgument get _value => super._value as DateTimeArgument;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(DateTimeArgument(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DateTimeArgument extends DateTimeArgument {
  const _$DateTimeArgument(this.dateTime) : super._();

  factory _$DateTimeArgument.fromJson(Map<String, dynamic> json) =>
      _$_$DateTimeArgumentFromJson(json);

  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'PredictionArguments(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DateTimeArgument &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  $DateTimeArgumentCopyWith<DateTimeArgument> get copyWith =>
      _$DateTimeArgumentCopyWithImpl<DateTimeArgument>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DateTime? dateTime) $default, {
    required TResult Function(DateTime? dateTime, String source) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) {
    return $default(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DateTime? dateTime)? $default, {
    TResult Function(DateTime? dateTime, String source)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DateTimeArgument value) $default, {
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DateTimeArgument value)? $default, {
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$DateTimeArgumentToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class DateTimeArgument extends PredictionArguments {
  const factory DateTimeArgument(DateTime? dateTime) = _$DateTimeArgument;
  const DateTimeArgument._() : super._();

  factory DateTimeArgument.fromJson(Map<String, dynamic> json) =
      _$DateTimeArgument.fromJson;

  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $DateTimeArgumentCopyWith<DateTimeArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceDateArgumentsCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory $SourceDateArgumentsCopyWith(
          SourceDateArguments value, $Res Function(SourceDateArguments) then) =
      _$SourceDateArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? dateTime, String source});
}

/// @nodoc
class _$SourceDateArgumentsCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res>
    implements $SourceDateArgumentsCopyWith<$Res> {
  _$SourceDateArgumentsCopyWithImpl(
      SourceDateArguments _value, $Res Function(SourceDateArguments) _then)
      : super(_value, (v) => _then(v as SourceDateArguments));

  @override
  SourceDateArguments get _value => super._value as SourceDateArguments;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? source = freezed,
  }) {
    return _then(SourceDateArguments(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SourceDateArguments extends SourceDateArguments {
  const _$SourceDateArguments(this.dateTime, this.source) : super._();

  factory _$SourceDateArguments.fromJson(Map<String, dynamic> json) =>
      _$_$SourceDateArgumentsFromJson(json);

  @override
  final DateTime? dateTime;
  @override
  final String source;

  @override
  String toString() {
    return 'PredictionArguments.withSource(dateTime: $dateTime, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SourceDateArguments &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(source);

  @JsonKey(ignore: true)
  @override
  $SourceDateArgumentsCopyWith<SourceDateArguments> get copyWith =>
      _$SourceDateArgumentsCopyWithImpl<SourceDateArguments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DateTime? dateTime) $default, {
    required TResult Function(DateTime? dateTime, String source) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) {
    return withSource(dateTime, source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DateTime? dateTime)? $default, {
    TResult Function(DateTime? dateTime, String source)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) {
    if (withSource != null) {
      return withSource(dateTime, source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DateTimeArgument value) $default, {
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) {
    return withSource(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DateTimeArgument value)? $default, {
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
    required TResult orElse(),
  }) {
    if (withSource != null) {
      return withSource(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SourceDateArgumentsToJson(this)..['runtimeType'] = 'withSource';
  }
}

abstract class SourceDateArguments extends PredictionArguments {
  const factory SourceDateArguments(DateTime? dateTime, String source) =
      _$SourceDateArguments;
  const SourceDateArguments._() : super._();

  factory SourceDateArguments.fromJson(Map<String, dynamic> json) =
      _$SourceDateArguments.fromJson;

  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SourceDateArgumentsCopyWith<SourceDateArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationArgumentCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory $LocationArgumentCopyWith(
          LocationArgument value, $Res Function(LocationArgument) then) =
      _$LocationArgumentCopyWithImpl<$Res>;
  @override
  $Res call({LatLon latLon, DateTime? dateTime});

  $LatLonCopyWith<$Res> get latLon;
}

/// @nodoc
class _$LocationArgumentCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res>
    implements $LocationArgumentCopyWith<$Res> {
  _$LocationArgumentCopyWithImpl(
      LocationArgument _value, $Res Function(LocationArgument) _then)
      : super(_value, (v) => _then(v as LocationArgument));

  @override
  LocationArgument get _value => super._value as LocationArgument;

  @override
  $Res call({
    Object? latLon = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(LocationArgument(
      latLon == freezed
          ? _value.latLon
          : latLon // ignore: cast_nullable_to_non_nullable
              as LatLon,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $LatLonCopyWith<$Res> get latLon {
    return $LatLonCopyWith<$Res>(_value.latLon, (value) {
      return _then(_value.copyWith(latLon: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationArgument extends LocationArgument {
  const _$LocationArgument(this.latLon, {this.dateTime}) : super._();

  factory _$LocationArgument.fromJson(Map<String, dynamic> json) =>
      _$_$LocationArgumentFromJson(json);

  @override
  final LatLon latLon;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'PredictionArguments.withLocation(latLon: $latLon, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocationArgument &&
            (identical(other.latLon, latLon) ||
                const DeepCollectionEquality().equals(other.latLon, latLon)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latLon) ^
      const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  $LocationArgumentCopyWith<LocationArgument> get copyWith =>
      _$LocationArgumentCopyWithImpl<LocationArgument>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(DateTime? dateTime) $default, {
    required TResult Function(DateTime? dateTime, String source) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) {
    return withLocation(latLon, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(DateTime? dateTime)? $default, {
    TResult Function(DateTime? dateTime, String source)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) {
    if (withLocation != null) {
      return withLocation(latLon, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DateTimeArgument value) $default, {
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) {
    return withLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DateTimeArgument value)? $default, {
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
    required TResult orElse(),
  }) {
    if (withLocation != null) {
      return withLocation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$LocationArgumentToJson(this)..['runtimeType'] = 'withLocation';
  }
}

abstract class LocationArgument extends PredictionArguments {
  const factory LocationArgument(LatLon latLon, {DateTime? dateTime}) =
      _$LocationArgument;
  const LocationArgument._() : super._();

  factory LocationArgument.fromJson(Map<String, dynamic> json) =
      _$LocationArgument.fromJson;

  LatLon get latLon => throw _privateConstructorUsedError;
  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LocationArgumentCopyWith<LocationArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PairTearOff {
  const _$PairTearOff();

  _Pair<R, S> call<R, S>(R first, S second) {
    return _Pair<R, S>(
      first,
      second,
    );
  }
}

/// @nodoc
const $Pair = _$PairTearOff();

/// @nodoc
mixin _$Pair<R, S> {
  R get first => throw _privateConstructorUsedError;
  S get second => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PairCopyWith<R, S, Pair<R, S>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairCopyWith<R, S, $Res> {
  factory $PairCopyWith(Pair<R, S> value, $Res Function(Pair<R, S>) then) =
      _$PairCopyWithImpl<R, S, $Res>;
  $Res call({R first, S second});
}

/// @nodoc
class _$PairCopyWithImpl<R, S, $Res> implements $PairCopyWith<R, S, $Res> {
  _$PairCopyWithImpl(this._value, this._then);

  final Pair<R, S> _value;
  // ignore: unused_field
  final $Res Function(Pair<R, S>) _then;

  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as R,
      second: second == freezed
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc
abstract class _$PairCopyWith<R, S, $Res> implements $PairCopyWith<R, S, $Res> {
  factory _$PairCopyWith(_Pair<R, S> value, $Res Function(_Pair<R, S>) then) =
      __$PairCopyWithImpl<R, S, $Res>;
  @override
  $Res call({R first, S second});
}

/// @nodoc
class __$PairCopyWithImpl<R, S, $Res> extends _$PairCopyWithImpl<R, S, $Res>
    implements _$PairCopyWith<R, S, $Res> {
  __$PairCopyWithImpl(_Pair<R, S> _value, $Res Function(_Pair<R, S>) _then)
      : super(_value, (v) => _then(v as _Pair<R, S>));

  @override
  _Pair<R, S> get _value => super._value as _Pair<R, S>;

  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_Pair<R, S>(
      first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as R,
      second == freezed
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc

class _$_Pair<R, S> extends _Pair<R, S> {
  const _$_Pair(this.first, this.second) : super._();

  @override
  final R first;
  @override
  final S second;

  @override
  String toString() {
    return 'Pair<$R, $S>(first: $first, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pair<R, S> &&
            (identical(other.first, first) ||
                const DeepCollectionEquality().equals(other.first, first)) &&
            (identical(other.second, second) ||
                const DeepCollectionEquality().equals(other.second, second)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(first) ^
      const DeepCollectionEquality().hash(second);

  @JsonKey(ignore: true)
  @override
  _$PairCopyWith<R, S, _Pair<R, S>> get copyWith =>
      __$PairCopyWithImpl<R, S, _Pair<R, S>>(this, _$identity);
}

abstract class _Pair<R, S> extends Pair<R, S> {
  const factory _Pair(R first, S second) = _$_Pair<R, S>;
  const _Pair._() : super._();

  @override
  R get first => throw _privateConstructorUsedError;
  @override
  S get second => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PairCopyWith<R, S, _Pair<R, S>> get copyWith =>
      throw _privateConstructorUsedError;
}
