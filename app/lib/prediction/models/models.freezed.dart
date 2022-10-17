// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutePrediction _$RoutePredictionFromJson(Map<String, dynamic> json) {
  return _RoutePrediction.fromJson(json);
}

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
      _$RoutePredictionCopyWithImpl<$Res, RoutePrediction>;
  @useResult
  $Res call(
      {@LocalRouteConverter() LocalRoute? prediction,
      double confidence,
      PredictionArguments arguments});

  $LocalRouteCopyWith<$Res>? get prediction;
  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class _$RoutePredictionCopyWithImpl<$Res, $Val extends RoutePrediction>
    implements $RoutePredictionCopyWith<$Res> {
  _$RoutePredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = freezed,
    Object? confidence = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      prediction: freezed == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as LocalRoute?,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalRouteCopyWith<$Res>? get prediction {
    if (_value.prediction == null) {
      return null;
    }

    return $LocalRouteCopyWith<$Res>(_value.prediction!, (value) {
      return _then(_value.copyWith(prediction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PredictionArgumentsCopyWith<$Res> get arguments {
    return $PredictionArgumentsCopyWith<$Res>(_value.arguments, (value) {
      return _then(_value.copyWith(arguments: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoutePredictionCopyWith<$Res>
    implements $RoutePredictionCopyWith<$Res> {
  factory _$$_RoutePredictionCopyWith(
          _$_RoutePrediction value, $Res Function(_$_RoutePrediction) then) =
      __$$_RoutePredictionCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_RoutePredictionCopyWithImpl<$Res>
    extends _$RoutePredictionCopyWithImpl<$Res, _$_RoutePrediction>
    implements _$$_RoutePredictionCopyWith<$Res> {
  __$$_RoutePredictionCopyWithImpl(
      _$_RoutePrediction _value, $Res Function(_$_RoutePrediction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = freezed,
    Object? confidence = null,
    Object? arguments = null,
  }) {
    return _then(_$_RoutePrediction(
      freezed == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as LocalRoute?,
      null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      null == arguments
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
            other is _$_RoutePrediction &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, prediction, confidence, arguments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoutePredictionCopyWith<_$_RoutePrediction> get copyWith =>
      __$$_RoutePredictionCopyWithImpl<_$_RoutePrediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutePredictionToJson(
      this,
    );
  }
}

abstract class _RoutePrediction implements RoutePrediction {
  const factory _RoutePrediction(
      @LocalRouteConverter() final LocalRoute? prediction,
      final double confidence,
      final PredictionArguments arguments) = _$_RoutePrediction;

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
  _$$_RoutePredictionCopyWith<_$_RoutePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

FullArguments _$FullArgumentsFromJson(Map<String, dynamic> json) {
  return _FullArguments.fromJson(json);
}

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
      _$FullArgumentsCopyWithImpl<$Res, FullArguments>;
  @useResult
  $Res call({List<LocalRoute> routes, PredictionArguments arguments});

  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class _$FullArgumentsCopyWithImpl<$Res, $Val extends FullArguments>
    implements $FullArgumentsCopyWith<$Res> {
  _$FullArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<LocalRoute>,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PredictionArgumentsCopyWith<$Res> get arguments {
    return $PredictionArgumentsCopyWith<$Res>(_value.arguments, (value) {
      return _then(_value.copyWith(arguments: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FullArgumentsCopyWith<$Res>
    implements $FullArgumentsCopyWith<$Res> {
  factory _$$_FullArgumentsCopyWith(
          _$_FullArguments value, $Res Function(_$_FullArguments) then) =
      __$$_FullArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LocalRoute> routes, PredictionArguments arguments});

  @override
  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class __$$_FullArgumentsCopyWithImpl<$Res>
    extends _$FullArgumentsCopyWithImpl<$Res, _$_FullArguments>
    implements _$$_FullArgumentsCopyWith<$Res> {
  __$$_FullArgumentsCopyWithImpl(
      _$_FullArguments _value, $Res Function(_$_FullArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? arguments = null,
  }) {
    return _then(_$_FullArguments(
      null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<LocalRoute>,
      null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as PredictionArguments,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FullArguments implements _FullArguments {
  const _$_FullArguments(final List<LocalRoute> routes, this.arguments)
      : _routes = routes;

  factory _$_FullArguments.fromJson(Map<String, dynamic> json) =>
      _$$_FullArgumentsFromJson(json);

  final List<LocalRoute> _routes;
  @override
  List<LocalRoute> get routes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

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
            other is _$_FullArguments &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            (identical(other.arguments, arguments) ||
                other.arguments == arguments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_routes), arguments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullArgumentsCopyWith<_$_FullArguments> get copyWith =>
      __$$_FullArgumentsCopyWithImpl<_$_FullArguments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullArgumentsToJson(
      this,
    );
  }
}

abstract class _FullArguments implements FullArguments {
  const factory _FullArguments(
          final List<LocalRoute> routes, final PredictionArguments arguments) =
      _$_FullArguments;

  factory _FullArguments.fromJson(Map<String, dynamic> json) =
      _$_FullArguments.fromJson;

  @override
  List<LocalRoute> get routes;
  @override
  PredictionArguments get arguments;
  @override
  @JsonKey(ignore: true)
  _$$_FullArgumentsCopyWith<_$_FullArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

PredictionArguments _$PredictionArgumentsFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
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
    TResult? Function(DateTime? dateTime)? empty,
    TResult? Function(String source, DateTime? dateTime)? withSource,
    TResult? Function(LatLon latLon, DateTime? dateTime)? withLocation,
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
    TResult? Function(EmptyArgument value)? empty,
    TResult? Function(SourceDateArguments value)? withSource,
    TResult? Function(LocationArgument value)? withLocation,
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
      _$PredictionArgumentsCopyWithImpl<$Res, PredictionArguments>;
  @useResult
  $Res call({DateTime? dateTime});
}

/// @nodoc
class _$PredictionArgumentsCopyWithImpl<$Res, $Val extends PredictionArguments>
    implements $PredictionArgumentsCopyWith<$Res> {
  _$PredictionArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmptyArgumentCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory _$$EmptyArgumentCopyWith(
          _$EmptyArgument value, $Res Function(_$EmptyArgument) then) =
      __$$EmptyArgumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime});
}

/// @nodoc
class __$$EmptyArgumentCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res, _$EmptyArgument>
    implements _$$EmptyArgumentCopyWith<$Res> {
  __$$EmptyArgumentCopyWithImpl(
      _$EmptyArgument _value, $Res Function(_$EmptyArgument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_$EmptyArgument(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmptyArgument extends EmptyArgument {
  const _$EmptyArgument({required this.dateTime, final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$EmptyArgument.fromJson(Map<String, dynamic> json) =>
      _$$EmptyArgumentFromJson(json);

  @override
  final DateTime? dateTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PredictionArguments.empty(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyArgument &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyArgumentCopyWith<_$EmptyArgument> get copyWith =>
      __$$EmptyArgumentCopyWithImpl<_$EmptyArgument>(this, _$identity);

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
    TResult? Function(DateTime? dateTime)? empty,
    TResult? Function(String source, DateTime? dateTime)? withSource,
    TResult? Function(LatLon latLon, DateTime? dateTime)? withLocation,
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
    TResult? Function(EmptyArgument value)? empty,
    TResult? Function(SourceDateArguments value)? withSource,
    TResult? Function(LocationArgument value)? withLocation,
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
    return _$$EmptyArgumentToJson(
      this,
    );
  }
}

abstract class EmptyArgument extends PredictionArguments {
  const factory EmptyArgument({required final DateTime? dateTime}) =
      _$EmptyArgument;
  const EmptyArgument._() : super._();

  factory EmptyArgument.fromJson(Map<String, dynamic> json) =
      _$EmptyArgument.fromJson;

  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$EmptyArgumentCopyWith<_$EmptyArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SourceDateArgumentsCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory _$$SourceDateArgumentsCopyWith(_$SourceDateArguments value,
          $Res Function(_$SourceDateArguments) then) =
      __$$SourceDateArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, DateTime? dateTime});
}

/// @nodoc
class __$$SourceDateArgumentsCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res, _$SourceDateArguments>
    implements _$$SourceDateArgumentsCopyWith<$Res> {
  __$$SourceDateArgumentsCopyWithImpl(
      _$SourceDateArguments _value, $Res Function(_$SourceDateArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? dateTime = freezed,
  }) {
    return _then(_$SourceDateArguments(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SourceDateArguments extends SourceDateArguments {
  const _$SourceDateArguments(this.source,
      {required this.dateTime, final String? $type})
      : $type = $type ?? 'withSource',
        super._();

  factory _$SourceDateArguments.fromJson(Map<String, dynamic> json) =>
      _$$SourceDateArgumentsFromJson(json);

  @override
  final String source;
  @override
  final DateTime? dateTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PredictionArguments.withSource(source: $source, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceDateArguments &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceDateArgumentsCopyWith<_$SourceDateArguments> get copyWith =>
      __$$SourceDateArgumentsCopyWithImpl<_$SourceDateArguments>(
          this, _$identity);

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
    TResult? Function(DateTime? dateTime)? empty,
    TResult? Function(String source, DateTime? dateTime)? withSource,
    TResult? Function(LatLon latLon, DateTime? dateTime)? withLocation,
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
    TResult? Function(EmptyArgument value)? empty,
    TResult? Function(SourceDateArguments value)? withSource,
    TResult? Function(LocationArgument value)? withLocation,
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
    return _$$SourceDateArgumentsToJson(
      this,
    );
  }
}

abstract class SourceDateArguments extends PredictionArguments {
  const factory SourceDateArguments(final String source,
      {required final DateTime? dateTime}) = _$SourceDateArguments;
  const SourceDateArguments._() : super._();

  factory SourceDateArguments.fromJson(Map<String, dynamic> json) =
      _$SourceDateArguments.fromJson;

  String get source;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$SourceDateArgumentsCopyWith<_$SourceDateArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationArgumentCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory _$$LocationArgumentCopyWith(
          _$LocationArgument value, $Res Function(_$LocationArgument) then) =
      __$$LocationArgumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LatLon latLon, DateTime? dateTime});

  $LatLonCopyWith<$Res> get latLon;
}

/// @nodoc
class __$$LocationArgumentCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res, _$LocationArgument>
    implements _$$LocationArgumentCopyWith<$Res> {
  __$$LocationArgumentCopyWithImpl(
      _$LocationArgument _value, $Res Function(_$LocationArgument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLon = null,
    Object? dateTime = freezed,
  }) {
    return _then(_$LocationArgument(
      null == latLon
          ? _value.latLon
          : latLon // ignore: cast_nullable_to_non_nullable
              as LatLon,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLonCopyWith<$Res> get latLon {
    return $LatLonCopyWith<$Res>(_value.latLon, (value) {
      return _then(_value.copyWith(latLon: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationArgument extends LocationArgument {
  const _$LocationArgument(this.latLon,
      {required this.dateTime, final String? $type})
      : $type = $type ?? 'withLocation',
        super._();

  factory _$LocationArgument.fromJson(Map<String, dynamic> json) =>
      _$$LocationArgumentFromJson(json);

  @override
  final LatLon latLon;
  @override
  final DateTime? dateTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PredictionArguments.withLocation(latLon: $latLon, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationArgument &&
            (identical(other.latLon, latLon) || other.latLon == latLon) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latLon, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationArgumentCopyWith<_$LocationArgument> get copyWith =>
      __$$LocationArgumentCopyWithImpl<_$LocationArgument>(this, _$identity);

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
    TResult? Function(DateTime? dateTime)? empty,
    TResult? Function(String source, DateTime? dateTime)? withSource,
    TResult? Function(LatLon latLon, DateTime? dateTime)? withLocation,
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
    TResult? Function(EmptyArgument value)? empty,
    TResult? Function(SourceDateArguments value)? withSource,
    TResult? Function(LocationArgument value)? withLocation,
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
    return _$$LocationArgumentToJson(
      this,
    );
  }
}

abstract class LocationArgument extends PredictionArguments {
  const factory LocationArgument(final LatLon latLon,
      {required final DateTime? dateTime}) = _$LocationArgument;
  const LocationArgument._() : super._();

  factory LocationArgument.fromJson(Map<String, dynamic> json) =
      _$LocationArgument.fromJson;

  LatLon get latLon;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$LocationArgumentCopyWith<_$LocationArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      _$PairCopyWithImpl<R, S, $Res, Pair<R, S>>;
  @useResult
  $Res call({R first, S second});
}

/// @nodoc
class _$PairCopyWithImpl<R, S, $Res, $Val extends Pair<R, S>>
    implements $PairCopyWith<R, S, $Res> {
  _$PairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as R,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PairCopyWith<R, S, $Res>
    implements $PairCopyWith<R, S, $Res> {
  factory _$$_PairCopyWith(
          _$_Pair<R, S> value, $Res Function(_$_Pair<R, S>) then) =
      __$$_PairCopyWithImpl<R, S, $Res>;
  @override
  @useResult
  $Res call({R first, S second});
}

/// @nodoc
class __$$_PairCopyWithImpl<R, S, $Res>
    extends _$PairCopyWithImpl<R, S, $Res, _$_Pair<R, S>>
    implements _$$_PairCopyWith<R, S, $Res> {
  __$$_PairCopyWithImpl(
      _$_Pair<R, S> _value, $Res Function(_$_Pair<R, S>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
  }) {
    return _then(_$_Pair<R, S>(
      null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as R,
      null == second
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
            other is _$_Pair<R, S> &&
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
  @pragma('vm:prefer-inline')
  _$$_PairCopyWith<R, S, _$_Pair<R, S>> get copyWith =>
      __$$_PairCopyWithImpl<R, S, _$_Pair<R, S>>(this, _$identity);
}

abstract class _Pair<R, S> extends Pair<R, S> {
  const factory _Pair(final R first, final S second) = _$_Pair<R, S>;
  const _Pair._() : super._();

  @override
  R get first;
  @override
  S get second;
  @override
  @JsonKey(ignore: true)
  _$$_PairCopyWith<R, S, _$_Pair<R, S>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Triple<R, S, T> {
  R get first => throw _privateConstructorUsedError;
  S get second => throw _privateConstructorUsedError;
  T get third => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TripleCopyWith<R, S, T, Triple<R, S, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripleCopyWith<R, S, T, $Res> {
  factory $TripleCopyWith(
          Triple<R, S, T> value, $Res Function(Triple<R, S, T>) then) =
      _$TripleCopyWithImpl<R, S, T, $Res, Triple<R, S, T>>;
  @useResult
  $Res call({R first, S second, T third});
}

/// @nodoc
class _$TripleCopyWithImpl<R, S, T, $Res, $Val extends Triple<R, S, T>>
    implements $TripleCopyWith<R, S, T, $Res> {
  _$TripleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
    Object? third = null,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as R,
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
      third: null == third
          ? _value.third
          : third // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripleCopyWith<R, S, T, $Res>
    implements $TripleCopyWith<R, S, T, $Res> {
  factory _$$_TripleCopyWith(
          _$_Triple<R, S, T> value, $Res Function(_$_Triple<R, S, T>) then) =
      __$$_TripleCopyWithImpl<R, S, T, $Res>;
  @override
  @useResult
  $Res call({R first, S second, T third});
}

/// @nodoc
class __$$_TripleCopyWithImpl<R, S, T, $Res>
    extends _$TripleCopyWithImpl<R, S, T, $Res, _$_Triple<R, S, T>>
    implements _$$_TripleCopyWith<R, S, T, $Res> {
  __$$_TripleCopyWithImpl(
      _$_Triple<R, S, T> _value, $Res Function(_$_Triple<R, S, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? second = null,
    Object? third = null,
  }) {
    return _then(_$_Triple<R, S, T>(
      null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as R,
      null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as S,
      null == third
          ? _value.third
          : third // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Triple<R, S, T> implements _Triple<R, S, T> {
  const _$_Triple(this.first, this.second, this.third);

  @override
  final R first;
  @override
  final S second;
  @override
  final T third;

  @override
  String toString() {
    return 'Triple<$R, $S, $T>(first: $first, second: $second, third: $third)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Triple<R, S, T> &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.second, second) &&
            const DeepCollectionEquality().equals(other.third, third));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(second),
      const DeepCollectionEquality().hash(third));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripleCopyWith<R, S, T, _$_Triple<R, S, T>> get copyWith =>
      __$$_TripleCopyWithImpl<R, S, T, _$_Triple<R, S, T>>(this, _$identity);
}

abstract class _Triple<R, S, T> implements Triple<R, S, T> {
  const factory _Triple(final R first, final S second, final T third) =
      _$_Triple<R, S, T>;

  @override
  R get first;
  @override
  S get second;
  @override
  T get third;
  @override
  @JsonKey(ignore: true)
  _$$_TripleCopyWith<R, S, T, _$_Triple<R, S, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      _$ContactCompletionCopyWithImpl<$Res, ContactCompletion>;
  @useResult
  $Res call({Contact contact});
}

/// @nodoc
class _$ContactCompletionCopyWithImpl<$Res, $Val extends ContactCompletion>
    implements $ContactCompletionCopyWith<$Res> {
  _$ContactCompletionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
  }) {
    return _then(_value.copyWith(
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactCompletionCopyWith<$Res>
    implements $ContactCompletionCopyWith<$Res> {
  factory _$$_ContactCompletionCopyWith(_$_ContactCompletion value,
          $Res Function(_$_ContactCompletion) then) =
      __$$_ContactCompletionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Contact contact});
}

/// @nodoc
class __$$_ContactCompletionCopyWithImpl<$Res>
    extends _$ContactCompletionCopyWithImpl<$Res, _$_ContactCompletion>
    implements _$$_ContactCompletionCopyWith<$Res> {
  __$$_ContactCompletionCopyWithImpl(
      _$_ContactCompletion _value, $Res Function(_$_ContactCompletion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
  }) {
    return _then(_$_ContactCompletion(
      null == contact
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
            other is _$_ContactCompletion &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCompletionCopyWith<_$_ContactCompletion> get copyWith =>
      __$$_ContactCompletionCopyWithImpl<_$_ContactCompletion>(
          this, _$identity);
}

abstract class _ContactCompletion extends ContactCompletion {
  const factory _ContactCompletion(final Contact contact) =
      _$_ContactCompletion;
  const _ContactCompletion._() : super._();

  @override
  Contact get contact;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCompletionCopyWith<_$_ContactCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentLocationCompletion {}

/// @nodoc
abstract class $CurrentLocationCompletionCopyWith<$Res> {
  factory $CurrentLocationCompletionCopyWith(CurrentLocationCompletion value,
          $Res Function(CurrentLocationCompletion) then) =
      _$CurrentLocationCompletionCopyWithImpl<$Res, CurrentLocationCompletion>;
}

/// @nodoc
class _$CurrentLocationCompletionCopyWithImpl<$Res,
        $Val extends CurrentLocationCompletion>
    implements $CurrentLocationCompletionCopyWith<$Res> {
  _$CurrentLocationCompletionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CurrentLocationCompletionCopyWith<$Res> {
  factory _$$_CurrentLocationCompletionCopyWith(
          _$_CurrentLocationCompletion value,
          $Res Function(_$_CurrentLocationCompletion) then) =
      __$$_CurrentLocationCompletionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CurrentLocationCompletionCopyWithImpl<$Res>
    extends _$CurrentLocationCompletionCopyWithImpl<$Res,
        _$_CurrentLocationCompletion>
    implements _$$_CurrentLocationCompletionCopyWith<$Res> {
  __$$_CurrentLocationCompletionCopyWithImpl(
      _$_CurrentLocationCompletion _value,
      $Res Function(_$_CurrentLocationCompletion) _then)
      : super(_value, _then);
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
            other is _$_CurrentLocationCompletion);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _CurrentLocationCompletion extends CurrentLocationCompletion {
  const factory _CurrentLocationCompletion() = _$_CurrentLocationCompletion;
  const _CurrentLocationCompletion._() : super._();
}
