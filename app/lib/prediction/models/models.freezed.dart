// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  RoutePrediction fromJson(Map<String, Object?> json) {
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
      _$$_RoutePredictionFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _RoutePrediction &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, prediction, confidence, arguments);

  @JsonKey(ignore: true)
  @override
  _$RoutePredictionCopyWith<_RoutePrediction> get copyWith =>
      __$RoutePredictionCopyWithImpl<_RoutePrediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutePredictionToJson(this);
  }
}

abstract class _RoutePrediction implements RoutePrediction {
  const factory _RoutePrediction(@LocalRouteConverter() LocalRoute? prediction,
      double confidence, PredictionArguments arguments) = _$_RoutePrediction;

  factory _RoutePrediction.fromJson(Map<String, dynamic> json) =
      _$_RoutePrediction.fromJson;

  @override
  @LocalRouteConverter()
  LocalRoute? get prediction;
  @override
  double get confidence;
  @override
  PredictionArguments get arguments;
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

  FullArguments fromJson(Map<String, Object?> json) {
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
      _$$_FullArgumentsFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _FullArguments &&
            const DeepCollectionEquality().equals(other.routes, routes) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(routes), arguments);

  @JsonKey(ignore: true)
  @override
  _$FullArgumentsCopyWith<_FullArguments> get copyWith =>
      __$FullArgumentsCopyWithImpl<_FullArguments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullArgumentsToJson(this);
  }
}

abstract class _FullArguments implements FullArguments {
  const factory _FullArguments(
          List<LocalRoute> routes, PredictionArguments arguments) =
      _$_FullArguments;

  factory _FullArguments.fromJson(Map<String, dynamic> json) =
      _$_FullArguments.fromJson;

  @override
  List<LocalRoute> get routes;
  @override
  PredictionArguments get arguments;
  @override
  @JsonKey(ignore: true)
  _$FullArgumentsCopyWith<_FullArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

PredictionArguments _$PredictionArgumentsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'empty':
      return EmptyArgument.fromJson(json);
    case 'withSource':
      return SourceDateArguments.fromJson(json);
    case 'withLocation':
      return LocationArgument.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PredictionArguments',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$PredictionArgumentsTearOff {
  const _$PredictionArgumentsTearOff();

  EmptyArgument empty({required DateTime? dateTime}) {
    return EmptyArgument(
      dateTime: dateTime,
    );
  }

  SourceDateArguments withSource(String source, {required DateTime? dateTime}) {
    return SourceDateArguments(
      source,
      dateTime: dateTime,
    );
  }

  LocationArgument withLocation(LatLon latLon, {required DateTime? dateTime}) {
    return LocationArgument(
      latLon,
      dateTime: dateTime,
    );
  }

  PredictionArguments fromJson(Map<String, Object?> json) {
    return PredictionArguments.fromJson(json);
  }
}

/// @nodoc
const $PredictionArguments = _$PredictionArgumentsTearOff();

/// @nodoc
mixin _$PredictionArguments {
  DateTime? get dateTime => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateTime) empty,
    required TResult Function(String source, DateTime? dateTime) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyArgument value) empty,
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
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
abstract class $EmptyArgumentCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory $EmptyArgumentCopyWith(
          EmptyArgument value, $Res Function(EmptyArgument) then) =
      _$EmptyArgumentCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? dateTime});
}

/// @nodoc
class _$EmptyArgumentCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res>
    implements $EmptyArgumentCopyWith<$Res> {
  _$EmptyArgumentCopyWithImpl(
      EmptyArgument _value, $Res Function(EmptyArgument) _then)
      : super(_value, (v) => _then(v as EmptyArgument));

  @override
  EmptyArgument get _value => super._value as EmptyArgument;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(EmptyArgument(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmptyArgument extends EmptyArgument {
  const _$EmptyArgument({required this.dateTime}) : super._();

  factory _$EmptyArgument.fromJson(Map<String, dynamic> json) =>
      _$$EmptyArgumentFromJson(json);

  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'PredictionArguments.empty(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmptyArgument &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  $EmptyArgumentCopyWith<EmptyArgument> get copyWith =>
      _$EmptyArgumentCopyWithImpl<EmptyArgument>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateTime) empty,
    required TResult Function(String source, DateTime? dateTime) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) {
    return empty(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
  }) {
    return empty?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyArgument value) empty,
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyArgumentToJson(this)..['runtimeType'] = 'empty';
  }
}

abstract class EmptyArgument extends PredictionArguments {
  const factory EmptyArgument({required DateTime? dateTime}) = _$EmptyArgument;
  const EmptyArgument._() : super._();

  factory EmptyArgument.fromJson(Map<String, dynamic> json) =
      _$EmptyArgument.fromJson;

  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  $EmptyArgumentCopyWith<EmptyArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceDateArgumentsCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory $SourceDateArgumentsCopyWith(
          SourceDateArguments value, $Res Function(SourceDateArguments) then) =
      _$SourceDateArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({String source, DateTime? dateTime});
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
    Object? source = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(SourceDateArguments(
      source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SourceDateArguments extends SourceDateArguments {
  const _$SourceDateArguments(this.source, {required this.dateTime})
      : super._();

  factory _$SourceDateArguments.fromJson(Map<String, dynamic> json) =>
      _$$SourceDateArgumentsFromJson(json);

  @override
  final String source;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'PredictionArguments.withSource(source: $source, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SourceDateArguments &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, dateTime);

  @JsonKey(ignore: true)
  @override
  $SourceDateArgumentsCopyWith<SourceDateArguments> get copyWith =>
      _$SourceDateArgumentsCopyWithImpl<SourceDateArguments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateTime) empty,
    required TResult Function(String source, DateTime? dateTime) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) {
    return withSource(source, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
  }) {
    return withSource?.call(source, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
    required TResult orElse(),
  }) {
    if (withSource != null) {
      return withSource(source, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyArgument value) empty,
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) {
    return withSource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
  }) {
    return withSource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
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
    return _$$SourceDateArgumentsToJson(this)..['runtimeType'] = 'withSource';
  }
}

abstract class SourceDateArguments extends PredictionArguments {
  const factory SourceDateArguments(String source,
      {required DateTime? dateTime}) = _$SourceDateArguments;
  const SourceDateArguments._() : super._();

  factory SourceDateArguments.fromJson(Map<String, dynamic> json) =
      _$SourceDateArguments.fromJson;

  String get source;
  @override
  DateTime? get dateTime;
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
  const _$LocationArgument(this.latLon, {required this.dateTime}) : super._();

  factory _$LocationArgument.fromJson(Map<String, dynamic> json) =>
      _$$LocationArgumentFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is LocationArgument &&
            (identical(other.latLon, latLon) || other.latLon == latLon) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latLon, dateTime);

  @JsonKey(ignore: true)
  @override
  $LocationArgumentCopyWith<LocationArgument> get copyWith =>
      _$LocationArgumentCopyWithImpl<LocationArgument>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? dateTime) empty,
    required TResult Function(String source, DateTime? dateTime) withSource,
    required TResult Function(LatLon latLon, DateTime? dateTime) withLocation,
  }) {
    return withLocation(latLon, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
    TResult Function(LatLon latLon, DateTime? dateTime)? withLocation,
  }) {
    return withLocation?.call(latLon, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? dateTime)? empty,
    TResult Function(String source, DateTime? dateTime)? withSource,
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
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyArgument value) empty,
    required TResult Function(SourceDateArguments value) withSource,
    required TResult Function(LocationArgument value) withLocation,
  }) {
    return withLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
    TResult Function(SourceDateArguments value)? withSource,
    TResult Function(LocationArgument value)? withLocation,
  }) {
    return withLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyArgument value)? empty,
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
    return _$$LocationArgumentToJson(this)..['runtimeType'] = 'withLocation';
  }
}

abstract class LocationArgument extends PredictionArguments {
  const factory LocationArgument(LatLon latLon, {required DateTime? dateTime}) =
      _$LocationArgument;
  const LocationArgument._() : super._();

  factory LocationArgument.fromJson(Map<String, dynamic> json) =
      _$LocationArgument.fromJson;

  LatLon get latLon;
  @override
  DateTime? get dateTime;
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
        (other.runtimeType == runtimeType &&
            other is _Pair<R, S> &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.second, second));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(second));

  @JsonKey(ignore: true)
  @override
  _$PairCopyWith<R, S, _Pair<R, S>> get copyWith =>
      __$PairCopyWithImpl<R, S, _Pair<R, S>>(this, _$identity);
}

abstract class _Pair<R, S> extends Pair<R, S> {
  const factory _Pair(R first, S second) = _$_Pair<R, S>;
  const _Pair._() : super._();

  @override
  R get first;
  @override
  S get second;
  @override
  @JsonKey(ignore: true)
  _$PairCopyWith<R, S, _Pair<R, S>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ContactCompletionTearOff {
  const _$ContactCompletionTearOff();

  _ContactCompletion call(Contact contact) {
    return _ContactCompletion(
      contact,
    );
  }
}

/// @nodoc
const $ContactCompletion = _$ContactCompletionTearOff();

/// @nodoc
mixin _$ContactCompletion {
  Contact get contact => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactCompletionCopyWith<ContactCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCompletionCopyWith<$Res> {
  factory $ContactCompletionCopyWith(
          ContactCompletion value, $Res Function(ContactCompletion) then) =
      _$ContactCompletionCopyWithImpl<$Res>;
  $Res call({Contact contact});
}

/// @nodoc
class _$ContactCompletionCopyWithImpl<$Res>
    implements $ContactCompletionCopyWith<$Res> {
  _$ContactCompletionCopyWithImpl(this._value, this._then);

  final ContactCompletion _value;
  // ignore: unused_field
  final $Res Function(ContactCompletion) _then;

  @override
  $Res call({
    Object? contact = freezed,
  }) {
    return _then(_value.copyWith(
      contact: contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
    ));
  }
}

/// @nodoc
abstract class _$ContactCompletionCopyWith<$Res>
    implements $ContactCompletionCopyWith<$Res> {
  factory _$ContactCompletionCopyWith(
          _ContactCompletion value, $Res Function(_ContactCompletion) then) =
      __$ContactCompletionCopyWithImpl<$Res>;
  @override
  $Res call({Contact contact});
}

/// @nodoc
class __$ContactCompletionCopyWithImpl<$Res>
    extends _$ContactCompletionCopyWithImpl<$Res>
    implements _$ContactCompletionCopyWith<$Res> {
  __$ContactCompletionCopyWithImpl(
      _ContactCompletion _value, $Res Function(_ContactCompletion) _then)
      : super(_value, (v) => _then(v as _ContactCompletion));

  @override
  _ContactCompletion get _value => super._value as _ContactCompletion;

  @override
  $Res call({
    Object? contact = freezed,
  }) {
    return _then(_ContactCompletion(
      contact == freezed
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
    ));
  }
}

/// @nodoc

class _$_ContactCompletion extends _ContactCompletion {
  const _$_ContactCompletion(this.contact) : super._();

  @override
  final Contact contact;

  @override
  String toString() {
    return 'ContactCompletion(contact: $contact)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactCompletion &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  _$ContactCompletionCopyWith<_ContactCompletion> get copyWith =>
      __$ContactCompletionCopyWithImpl<_ContactCompletion>(this, _$identity);
}

abstract class _ContactCompletion extends ContactCompletion {
  const factory _ContactCompletion(Contact contact) = _$_ContactCompletion;
  const _ContactCompletion._() : super._();

  @override
  Contact get contact;
  @override
  @JsonKey(ignore: true)
  _$ContactCompletionCopyWith<_ContactCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CurrentLocationCompletionTearOff {
  const _$CurrentLocationCompletionTearOff();

  _CurrentLocationCompletion call() {
    return const _CurrentLocationCompletion();
  }
}

/// @nodoc
const $CurrentLocationCompletion = _$CurrentLocationCompletionTearOff();

/// @nodoc
mixin _$CurrentLocationCompletion {}

/// @nodoc
abstract class $CurrentLocationCompletionCopyWith<$Res> {
  factory $CurrentLocationCompletionCopyWith(CurrentLocationCompletion value,
          $Res Function(CurrentLocationCompletion) then) =
      _$CurrentLocationCompletionCopyWithImpl<$Res>;
}

/// @nodoc
class _$CurrentLocationCompletionCopyWithImpl<$Res>
    implements $CurrentLocationCompletionCopyWith<$Res> {
  _$CurrentLocationCompletionCopyWithImpl(this._value, this._then);

  final CurrentLocationCompletion _value;
  // ignore: unused_field
  final $Res Function(CurrentLocationCompletion) _then;
}

/// @nodoc
abstract class _$CurrentLocationCompletionCopyWith<$Res> {
  factory _$CurrentLocationCompletionCopyWith(_CurrentLocationCompletion value,
          $Res Function(_CurrentLocationCompletion) then) =
      __$CurrentLocationCompletionCopyWithImpl<$Res>;
}

/// @nodoc
class __$CurrentLocationCompletionCopyWithImpl<$Res>
    extends _$CurrentLocationCompletionCopyWithImpl<$Res>
    implements _$CurrentLocationCompletionCopyWith<$Res> {
  __$CurrentLocationCompletionCopyWithImpl(_CurrentLocationCompletion _value,
      $Res Function(_CurrentLocationCompletion) _then)
      : super(_value, (v) => _then(v as _CurrentLocationCompletion));

  @override
  _CurrentLocationCompletion get _value =>
      super._value as _CurrentLocationCompletion;
}

/// @nodoc

class _$_CurrentLocationCompletion extends _CurrentLocationCompletion {
  const _$_CurrentLocationCompletion() : super._();

  @override
  String toString() {
    return 'CurrentLocationCompletion()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentLocationCompletion);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _CurrentLocationCompletion extends CurrentLocationCompletion {
  const factory _CurrentLocationCompletion() = _$_CurrentLocationCompletion;
  const _CurrentLocationCompletion._() : super._();
}
