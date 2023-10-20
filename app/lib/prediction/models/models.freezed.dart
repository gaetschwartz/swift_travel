// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$RoutePredictionImplCopyWith<$Res>
    implements $RoutePredictionCopyWith<$Res> {
  factory _$$RoutePredictionImplCopyWith(_$RoutePredictionImpl value,
          $Res Function(_$RoutePredictionImpl) then) =
      __$$RoutePredictionImplCopyWithImpl<$Res>;
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
class __$$RoutePredictionImplCopyWithImpl<$Res>
    extends _$RoutePredictionCopyWithImpl<$Res, _$RoutePredictionImpl>
    implements _$$RoutePredictionImplCopyWith<$Res> {
  __$$RoutePredictionImplCopyWithImpl(
      _$RoutePredictionImpl _value, $Res Function(_$RoutePredictionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = freezed,
    Object? confidence = null,
    Object? arguments = null,
  }) {
    return _then(_$RoutePredictionImpl(
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
class _$RoutePredictionImpl implements _RoutePrediction {
  const _$RoutePredictionImpl(
      @LocalRouteConverter() this.prediction, this.confidence, this.arguments);

  factory _$RoutePredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutePredictionImplFromJson(json);

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
            other is _$RoutePredictionImpl &&
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
  _$$RoutePredictionImplCopyWith<_$RoutePredictionImpl> get copyWith =>
      __$$RoutePredictionImplCopyWithImpl<_$RoutePredictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutePredictionImplToJson(
      this,
    );
  }
}

abstract class _RoutePrediction implements RoutePrediction {
  const factory _RoutePrediction(
      @LocalRouteConverter() final LocalRoute? prediction,
      final double confidence,
      final PredictionArguments arguments) = _$RoutePredictionImpl;

  factory _RoutePrediction.fromJson(Map<String, dynamic> json) =
      _$RoutePredictionImpl.fromJson;

  @override
  @LocalRouteConverter()
  LocalRoute? get prediction;
  @override
  double get confidence;
  @override
  PredictionArguments get arguments;
  @override
  @JsonKey(ignore: true)
  _$$RoutePredictionImplCopyWith<_$RoutePredictionImpl> get copyWith =>
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
abstract class _$$FullArgumentsImplCopyWith<$Res>
    implements $FullArgumentsCopyWith<$Res> {
  factory _$$FullArgumentsImplCopyWith(
          _$FullArgumentsImpl value, $Res Function(_$FullArgumentsImpl) then) =
      __$$FullArgumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LocalRoute> routes, PredictionArguments arguments});

  @override
  $PredictionArgumentsCopyWith<$Res> get arguments;
}

/// @nodoc
class __$$FullArgumentsImplCopyWithImpl<$Res>
    extends _$FullArgumentsCopyWithImpl<$Res, _$FullArgumentsImpl>
    implements _$$FullArgumentsImplCopyWith<$Res> {
  __$$FullArgumentsImplCopyWithImpl(
      _$FullArgumentsImpl _value, $Res Function(_$FullArgumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? arguments = null,
  }) {
    return _then(_$FullArgumentsImpl(
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
class _$FullArgumentsImpl implements _FullArguments {
  const _$FullArgumentsImpl(final List<LocalRoute> routes, this.arguments)
      : _routes = routes;

  factory _$FullArgumentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FullArgumentsImplFromJson(json);

  final List<LocalRoute> _routes;
  @override
  List<LocalRoute> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
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
            other is _$FullArgumentsImpl &&
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
  _$$FullArgumentsImplCopyWith<_$FullArgumentsImpl> get copyWith =>
      __$$FullArgumentsImplCopyWithImpl<_$FullArgumentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FullArgumentsImplToJson(
      this,
    );
  }
}

abstract class _FullArguments implements FullArguments {
  const factory _FullArguments(
          final List<LocalRoute> routes, final PredictionArguments arguments) =
      _$FullArgumentsImpl;

  factory _FullArguments.fromJson(Map<String, dynamic> json) =
      _$FullArgumentsImpl.fromJson;

  @override
  List<LocalRoute> get routes;
  @override
  PredictionArguments get arguments;
  @override
  @JsonKey(ignore: true)
  _$$FullArgumentsImplCopyWith<_$FullArgumentsImpl> get copyWith =>
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
abstract class _$$EmptyArgumentImplCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory _$$EmptyArgumentImplCopyWith(
          _$EmptyArgumentImpl value, $Res Function(_$EmptyArgumentImpl) then) =
      __$$EmptyArgumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? dateTime});
}

/// @nodoc
class __$$EmptyArgumentImplCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res, _$EmptyArgumentImpl>
    implements _$$EmptyArgumentImplCopyWith<$Res> {
  __$$EmptyArgumentImplCopyWithImpl(
      _$EmptyArgumentImpl _value, $Res Function(_$EmptyArgumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_$EmptyArgumentImpl(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmptyArgumentImpl extends EmptyArgument {
  const _$EmptyArgumentImpl({required this.dateTime, final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$EmptyArgumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyArgumentImplFromJson(json);

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
            other is _$EmptyArgumentImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyArgumentImplCopyWith<_$EmptyArgumentImpl> get copyWith =>
      __$$EmptyArgumentImplCopyWithImpl<_$EmptyArgumentImpl>(this, _$identity);

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
    return _$$EmptyArgumentImplToJson(
      this,
    );
  }
}

abstract class EmptyArgument extends PredictionArguments {
  const factory EmptyArgument({required final DateTime? dateTime}) =
      _$EmptyArgumentImpl;
  const EmptyArgument._() : super._();

  factory EmptyArgument.fromJson(Map<String, dynamic> json) =
      _$EmptyArgumentImpl.fromJson;

  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$EmptyArgumentImplCopyWith<_$EmptyArgumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SourceDateArgumentsImplCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory _$$SourceDateArgumentsImplCopyWith(_$SourceDateArgumentsImpl value,
          $Res Function(_$SourceDateArgumentsImpl) then) =
      __$$SourceDateArgumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, DateTime? dateTime});
}

/// @nodoc
class __$$SourceDateArgumentsImplCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res, _$SourceDateArgumentsImpl>
    implements _$$SourceDateArgumentsImplCopyWith<$Res> {
  __$$SourceDateArgumentsImplCopyWithImpl(_$SourceDateArgumentsImpl _value,
      $Res Function(_$SourceDateArgumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? dateTime = freezed,
  }) {
    return _then(_$SourceDateArgumentsImpl(
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
class _$SourceDateArgumentsImpl extends SourceDateArguments {
  const _$SourceDateArgumentsImpl(this.source,
      {required this.dateTime, final String? $type})
      : $type = $type ?? 'withSource',
        super._();

  factory _$SourceDateArgumentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceDateArgumentsImplFromJson(json);

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
            other is _$SourceDateArgumentsImpl &&
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
  _$$SourceDateArgumentsImplCopyWith<_$SourceDateArgumentsImpl> get copyWith =>
      __$$SourceDateArgumentsImplCopyWithImpl<_$SourceDateArgumentsImpl>(
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
    return _$$SourceDateArgumentsImplToJson(
      this,
    );
  }
}

abstract class SourceDateArguments extends PredictionArguments {
  const factory SourceDateArguments(final String source,
      {required final DateTime? dateTime}) = _$SourceDateArgumentsImpl;
  const SourceDateArguments._() : super._();

  factory SourceDateArguments.fromJson(Map<String, dynamic> json) =
      _$SourceDateArgumentsImpl.fromJson;

  String get source;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$SourceDateArgumentsImplCopyWith<_$SourceDateArgumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationArgumentImplCopyWith<$Res>
    implements $PredictionArgumentsCopyWith<$Res> {
  factory _$$LocationArgumentImplCopyWith(_$LocationArgumentImpl value,
          $Res Function(_$LocationArgumentImpl) then) =
      __$$LocationArgumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LatLon latLon, DateTime? dateTime});

  $LatLonCopyWith<$Res> get latLon;
}

/// @nodoc
class __$$LocationArgumentImplCopyWithImpl<$Res>
    extends _$PredictionArgumentsCopyWithImpl<$Res, _$LocationArgumentImpl>
    implements _$$LocationArgumentImplCopyWith<$Res> {
  __$$LocationArgumentImplCopyWithImpl(_$LocationArgumentImpl _value,
      $Res Function(_$LocationArgumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLon = null,
    Object? dateTime = freezed,
  }) {
    return _then(_$LocationArgumentImpl(
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
class _$LocationArgumentImpl extends LocationArgument {
  const _$LocationArgumentImpl(this.latLon,
      {required this.dateTime, final String? $type})
      : $type = $type ?? 'withLocation',
        super._();

  factory _$LocationArgumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationArgumentImplFromJson(json);

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
            other is _$LocationArgumentImpl &&
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
  _$$LocationArgumentImplCopyWith<_$LocationArgumentImpl> get copyWith =>
      __$$LocationArgumentImplCopyWithImpl<_$LocationArgumentImpl>(
          this, _$identity);

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
    return _$$LocationArgumentImplToJson(
      this,
    );
  }
}

abstract class LocationArgument extends PredictionArguments {
  const factory LocationArgument(final LatLon latLon,
      {required final DateTime? dateTime}) = _$LocationArgumentImpl;
  const LocationArgument._() : super._();

  factory LocationArgument.fromJson(Map<String, dynamic> json) =
      _$LocationArgumentImpl.fromJson;

  LatLon get latLon;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$LocationArgumentImplCopyWith<_$LocationArgumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
