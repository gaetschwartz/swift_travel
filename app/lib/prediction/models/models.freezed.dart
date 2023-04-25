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
