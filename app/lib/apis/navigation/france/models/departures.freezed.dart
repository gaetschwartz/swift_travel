// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'departures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SncfStationboard _$SncfStationboardFromJson(Map<String, dynamic> json) {
  return _SncfStationboard.fromJson(json);
}

/// @nodoc
mixin _$SncfStationboard {
  SncfContext get context => throw _privateConstructorUsedError;
  List<SncfDeparture> get departures => throw _privateConstructorUsedError;
  SncfError? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Stop get stop => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfStationboardCopyWith<SncfStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfStationboardCopyWith<$Res> {
  factory $SncfStationboardCopyWith(
          SncfStationboard value, $Res Function(SncfStationboard) then) =
      _$SncfStationboardCopyWithImpl<$Res, SncfStationboard>;
  @useResult
  $Res call(
      {SncfContext context,
      List<SncfDeparture> departures,
      SncfError? error,
      @JsonKey(ignore: true) Stop stop});

  $SncfContextCopyWith<$Res> get context;
  $SncfErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$SncfStationboardCopyWithImpl<$Res, $Val extends SncfStationboard>
    implements $SncfStationboardCopyWith<$Res> {
  _$SncfStationboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? departures = null,
    Object? error = freezed,
    Object? stop = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as SncfContext,
      departures: null == departures
          ? _value.departures
          : departures // ignore: cast_nullable_to_non_nullable
              as List<SncfDeparture>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as SncfError?,
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SncfContextCopyWith<$Res> get context {
    return $SncfContextCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SncfErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $SncfErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SncfStationboardCopyWith<$Res>
    implements $SncfStationboardCopyWith<$Res> {
  factory _$$_SncfStationboardCopyWith(
          _$_SncfStationboard value, $Res Function(_$_SncfStationboard) then) =
      __$$_SncfStationboardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SncfContext context,
      List<SncfDeparture> departures,
      SncfError? error,
      @JsonKey(ignore: true) Stop stop});

  @override
  $SncfContextCopyWith<$Res> get context;
  @override
  $SncfErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$_SncfStationboardCopyWithImpl<$Res>
    extends _$SncfStationboardCopyWithImpl<$Res, _$_SncfStationboard>
    implements _$$_SncfStationboardCopyWith<$Res> {
  __$$_SncfStationboardCopyWithImpl(
      _$_SncfStationboard _value, $Res Function(_$_SncfStationboard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? departures = null,
    Object? error = freezed,
    Object? stop = null,
  }) {
    return _then(_$_SncfStationboard(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as SncfContext,
      departures: null == departures
          ? _value._departures
          : departures // ignore: cast_nullable_to_non_nullable
              as List<SncfDeparture>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as SncfError?,
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfStationboard extends _SncfStationboard {
  const _$_SncfStationboard(
      {required this.context,
      required final List<SncfDeparture> departures,
      this.error,
      @JsonKey(ignore: true) this.stop = const MockStop()})
      : _departures = departures,
        super._();

  factory _$_SncfStationboard.fromJson(Map<String, dynamic> json) =>
      _$$_SncfStationboardFromJson(json);

  @override
  final SncfContext context;
  final List<SncfDeparture> _departures;
  @override
  List<SncfDeparture> get departures {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departures);
  }

  @override
  final SncfError? error;
  @override
  @JsonKey(ignore: true)
  final Stop stop;

  @override
  String toString() {
    return 'SncfStationboard(context: $context, departures: $departures, error: $error, stop: $stop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfStationboard &&
            (identical(other.context, context) || other.context == context) &&
            const DeepCollectionEquality()
                .equals(other._departures, _departures) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stop, stop) || other.stop == stop));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context,
      const DeepCollectionEquality().hash(_departures), error, stop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfStationboardCopyWith<_$_SncfStationboard> get copyWith =>
      __$$_SncfStationboardCopyWithImpl<_$_SncfStationboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfStationboardToJson(
      this,
    );
  }
}

abstract class _SncfStationboard extends SncfStationboard {
  const factory _SncfStationboard(
      {required final SncfContext context,
      required final List<SncfDeparture> departures,
      final SncfError? error,
      @JsonKey(ignore: true) final Stop stop}) = _$_SncfStationboard;
  const _SncfStationboard._() : super._();

  factory _SncfStationboard.fromJson(Map<String, dynamic> json) =
      _$_SncfStationboard.fromJson;

  @override
  SncfContext get context;
  @override
  List<SncfDeparture> get departures;
  @override
  SncfError? get error;
  @override
  @JsonKey(ignore: true)
  Stop get stop;
  @override
  @JsonKey(ignore: true)
  _$$_SncfStationboardCopyWith<_$_SncfStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfError _$SncfErrorFromJson(Map<String, dynamic> json) {
  return _SncfError.fromJson(json);
}

/// @nodoc
mixin _$SncfError {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfErrorCopyWith<SncfError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfErrorCopyWith<$Res> {
  factory $SncfErrorCopyWith(SncfError value, $Res Function(SncfError) then) =
      _$SncfErrorCopyWithImpl<$Res, SncfError>;
  @useResult
  $Res call({String id, String message});
}

/// @nodoc
class _$SncfErrorCopyWithImpl<$Res, $Val extends SncfError>
    implements $SncfErrorCopyWith<$Res> {
  _$SncfErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfErrorCopyWith<$Res> implements $SncfErrorCopyWith<$Res> {
  factory _$$_SncfErrorCopyWith(
          _$_SncfError value, $Res Function(_$_SncfError) then) =
      __$$_SncfErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String message});
}

/// @nodoc
class __$$_SncfErrorCopyWithImpl<$Res>
    extends _$SncfErrorCopyWithImpl<$Res, _$_SncfError>
    implements _$$_SncfErrorCopyWith<$Res> {
  __$$_SncfErrorCopyWithImpl(
      _$_SncfError _value, $Res Function(_$_SncfError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
  }) {
    return _then(_$_SncfError(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfError implements _SncfError {
  const _$_SncfError(this.id, this.message);

  factory _$_SncfError.fromJson(Map<String, dynamic> json) =>
      _$$_SncfErrorFromJson(json);

  @override
  final String id;
  @override
  final String message;

  @override
  String toString() {
    return 'SncfError(id: $id, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfError &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfErrorCopyWith<_$_SncfError> get copyWith =>
      __$$_SncfErrorCopyWithImpl<_$_SncfError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfErrorToJson(
      this,
    );
  }
}

abstract class _SncfError implements SncfError {
  const factory _SncfError(final String id, final String message) =
      _$_SncfError;

  factory _SncfError.fromJson(Map<String, dynamic> json) =
      _$_SncfError.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_SncfErrorCopyWith<_$_SncfError> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfDeparture _$SncfDepartureFromJson(Map<String, dynamic> json) {
  return _SncfDeparture.fromJson(json);
}

/// @nodoc
mixin _$SncfDeparture {
  @JsonKey(name: 'display_informations')
  SncfDispInfo get displayInformations => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_date_time')
  SncfStopDateTime get stopDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_point')
  SncfStopPoint get stopPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfDepartureCopyWith<SncfDeparture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfDepartureCopyWith<$Res> {
  factory $SncfDepartureCopyWith(
          SncfDeparture value, $Res Function(SncfDeparture) then) =
      _$SncfDepartureCopyWithImpl<$Res, SncfDeparture>;
  @useResult
  $Res call(
      {@JsonKey(name: 'display_informations') SncfDispInfo displayInformations,
      @JsonKey(name: 'stop_date_time') SncfStopDateTime stopDateTime,
      @JsonKey(name: 'stop_point') SncfStopPoint stopPoint});

  $SncfDispInfoCopyWith<$Res> get displayInformations;
  $SncfStopDateTimeCopyWith<$Res> get stopDateTime;
  $SncfStopPointCopyWith<$Res> get stopPoint;
}

/// @nodoc
class _$SncfDepartureCopyWithImpl<$Res, $Val extends SncfDeparture>
    implements $SncfDepartureCopyWith<$Res> {
  _$SncfDepartureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayInformations = null,
    Object? stopDateTime = null,
    Object? stopPoint = null,
  }) {
    return _then(_value.copyWith(
      displayInformations: null == displayInformations
          ? _value.displayInformations
          : displayInformations // ignore: cast_nullable_to_non_nullable
              as SncfDispInfo,
      stopDateTime: null == stopDateTime
          ? _value.stopDateTime
          : stopDateTime // ignore: cast_nullable_to_non_nullable
              as SncfStopDateTime,
      stopPoint: null == stopPoint
          ? _value.stopPoint
          : stopPoint // ignore: cast_nullable_to_non_nullable
              as SncfStopPoint,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SncfDispInfoCopyWith<$Res> get displayInformations {
    return $SncfDispInfoCopyWith<$Res>(_value.displayInformations, (value) {
      return _then(_value.copyWith(displayInformations: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SncfStopDateTimeCopyWith<$Res> get stopDateTime {
    return $SncfStopDateTimeCopyWith<$Res>(_value.stopDateTime, (value) {
      return _then(_value.copyWith(stopDateTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SncfStopPointCopyWith<$Res> get stopPoint {
    return $SncfStopPointCopyWith<$Res>(_value.stopPoint, (value) {
      return _then(_value.copyWith(stopPoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SncfDepartureCopyWith<$Res>
    implements $SncfDepartureCopyWith<$Res> {
  factory _$$_SncfDepartureCopyWith(
          _$_SncfDeparture value, $Res Function(_$_SncfDeparture) then) =
      __$$_SncfDepartureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'display_informations') SncfDispInfo displayInformations,
      @JsonKey(name: 'stop_date_time') SncfStopDateTime stopDateTime,
      @JsonKey(name: 'stop_point') SncfStopPoint stopPoint});

  @override
  $SncfDispInfoCopyWith<$Res> get displayInformations;
  @override
  $SncfStopDateTimeCopyWith<$Res> get stopDateTime;
  @override
  $SncfStopPointCopyWith<$Res> get stopPoint;
}

/// @nodoc
class __$$_SncfDepartureCopyWithImpl<$Res>
    extends _$SncfDepartureCopyWithImpl<$Res, _$_SncfDeparture>
    implements _$$_SncfDepartureCopyWith<$Res> {
  __$$_SncfDepartureCopyWithImpl(
      _$_SncfDeparture _value, $Res Function(_$_SncfDeparture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayInformations = null,
    Object? stopDateTime = null,
    Object? stopPoint = null,
  }) {
    return _then(_$_SncfDeparture(
      displayInformations: null == displayInformations
          ? _value.displayInformations
          : displayInformations // ignore: cast_nullable_to_non_nullable
              as SncfDispInfo,
      stopDateTime: null == stopDateTime
          ? _value.stopDateTime
          : stopDateTime // ignore: cast_nullable_to_non_nullable
              as SncfStopDateTime,
      stopPoint: null == stopPoint
          ? _value.stopPoint
          : stopPoint // ignore: cast_nullable_to_non_nullable
              as SncfStopPoint,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfDeparture extends _SncfDeparture {
  const _$_SncfDeparture(
      {@JsonKey(name: 'display_informations') required this.displayInformations,
      @JsonKey(name: 'stop_date_time') required this.stopDateTime,
      @JsonKey(name: 'stop_point') required this.stopPoint})
      : super._();

  factory _$_SncfDeparture.fromJson(Map<String, dynamic> json) =>
      _$$_SncfDepartureFromJson(json);

  @override
  @JsonKey(name: 'display_informations')
  final SncfDispInfo displayInformations;
  @override
  @JsonKey(name: 'stop_date_time')
  final SncfStopDateTime stopDateTime;
  @override
  @JsonKey(name: 'stop_point')
  final SncfStopPoint stopPoint;

  @override
  String toString() {
    return 'SncfDeparture(displayInformations: $displayInformations, stopDateTime: $stopDateTime, stopPoint: $stopPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfDeparture &&
            (identical(other.displayInformations, displayInformations) ||
                other.displayInformations == displayInformations) &&
            (identical(other.stopDateTime, stopDateTime) ||
                other.stopDateTime == stopDateTime) &&
            (identical(other.stopPoint, stopPoint) ||
                other.stopPoint == stopPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, displayInformations, stopDateTime, stopPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfDepartureCopyWith<_$_SncfDeparture> get copyWith =>
      __$$_SncfDepartureCopyWithImpl<_$_SncfDeparture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfDepartureToJson(
      this,
    );
  }
}

abstract class _SncfDeparture extends SncfDeparture {
  const factory _SncfDeparture(
      {@JsonKey(name: 'display_informations')
          required final SncfDispInfo displayInformations,
      @JsonKey(name: 'stop_date_time')
          required final SncfStopDateTime stopDateTime,
      @JsonKey(name: 'stop_point')
          required final SncfStopPoint stopPoint}) = _$_SncfDeparture;
  const _SncfDeparture._() : super._();

  factory _SncfDeparture.fromJson(Map<String, dynamic> json) =
      _$_SncfDeparture.fromJson;

  @override
  @JsonKey(name: 'display_informations')
  SncfDispInfo get displayInformations;
  @override
  @JsonKey(name: 'stop_date_time')
  SncfStopDateTime get stopDateTime;
  @override
  @JsonKey(name: 'stop_point')
  SncfStopPoint get stopPoint;
  @override
  @JsonKey(ignore: true)
  _$$_SncfDepartureCopyWith<_$_SncfDeparture> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfStopPoint _$SncfStopPointFromJson(Map<String, dynamic> json) {
  return _SncfStopPoint.fromJson(json);
}

/// @nodoc
mixin _$SncfStopPoint {
  @JsonKey(name: 'commercial_modes')
  List<SncfMode> get commercialModes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfStopPointCopyWith<SncfStopPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfStopPointCopyWith<$Res> {
  factory $SncfStopPointCopyWith(
          SncfStopPoint value, $Res Function(SncfStopPoint) then) =
      _$SncfStopPointCopyWithImpl<$Res, SncfStopPoint>;
  @useResult
  $Res call(
      {@JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes});
}

/// @nodoc
class _$SncfStopPointCopyWithImpl<$Res, $Val extends SncfStopPoint>
    implements $SncfStopPointCopyWith<$Res> {
  _$SncfStopPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commercialModes = null,
  }) {
    return _then(_value.copyWith(
      commercialModes: null == commercialModes
          ? _value.commercialModes
          : commercialModes // ignore: cast_nullable_to_non_nullable
              as List<SncfMode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfStopPointCopyWith<$Res>
    implements $SncfStopPointCopyWith<$Res> {
  factory _$$_SncfStopPointCopyWith(
          _$_SncfStopPoint value, $Res Function(_$_SncfStopPoint) then) =
      __$$_SncfStopPointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes});
}

/// @nodoc
class __$$_SncfStopPointCopyWithImpl<$Res>
    extends _$SncfStopPointCopyWithImpl<$Res, _$_SncfStopPoint>
    implements _$$_SncfStopPointCopyWith<$Res> {
  __$$_SncfStopPointCopyWithImpl(
      _$_SncfStopPoint _value, $Res Function(_$_SncfStopPoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commercialModes = null,
  }) {
    return _then(_$_SncfStopPoint(
      null == commercialModes
          ? _value._commercialModes
          : commercialModes // ignore: cast_nullable_to_non_nullable
              as List<SncfMode>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfStopPoint implements _SncfStopPoint {
  const _$_SncfStopPoint(
      @JsonKey(name: 'commercial_modes') final List<SncfMode> commercialModes)
      : _commercialModes = commercialModes;

  factory _$_SncfStopPoint.fromJson(Map<String, dynamic> json) =>
      _$$_SncfStopPointFromJson(json);

  final List<SncfMode> _commercialModes;
  @override
  @JsonKey(name: 'commercial_modes')
  List<SncfMode> get commercialModes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commercialModes);
  }

  @override
  String toString() {
    return 'SncfStopPoint(commercialModes: $commercialModes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfStopPoint &&
            const DeepCollectionEquality()
                .equals(other._commercialModes, _commercialModes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_commercialModes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfStopPointCopyWith<_$_SncfStopPoint> get copyWith =>
      __$$_SncfStopPointCopyWithImpl<_$_SncfStopPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfStopPointToJson(
      this,
    );
  }
}

abstract class _SncfStopPoint implements SncfStopPoint {
  const factory _SncfStopPoint(
      @JsonKey(name: 'commercial_modes')
          final List<SncfMode> commercialModes) = _$_SncfStopPoint;

  factory _SncfStopPoint.fromJson(Map<String, dynamic> json) =
      _$_SncfStopPoint.fromJson;

  @override
  @JsonKey(name: 'commercial_modes')
  List<SncfMode> get commercialModes;
  @override
  @JsonKey(ignore: true)
  _$$_SncfStopPointCopyWith<_$_SncfStopPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfMode _$SncfModeFromJson(Map<String, dynamic> json) {
  return _SncfMode.fromJson(json);
}

/// @nodoc
mixin _$SncfMode {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfModeCopyWith<SncfMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfModeCopyWith<$Res> {
  factory $SncfModeCopyWith(SncfMode value, $Res Function(SncfMode) then) =
      _$SncfModeCopyWithImpl<$Res, SncfMode>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$SncfModeCopyWithImpl<$Res, $Val extends SncfMode>
    implements $SncfModeCopyWith<$Res> {
  _$SncfModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfModeCopyWith<$Res> implements $SncfModeCopyWith<$Res> {
  factory _$$_SncfModeCopyWith(
          _$_SncfMode value, $Res Function(_$_SncfMode) then) =
      __$$_SncfModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_SncfModeCopyWithImpl<$Res>
    extends _$SncfModeCopyWithImpl<$Res, _$_SncfMode>
    implements _$$_SncfModeCopyWith<$Res> {
  __$$_SncfModeCopyWithImpl(
      _$_SncfMode _value, $Res Function(_$_SncfMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_SncfMode(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfMode implements _SncfMode {
  const _$_SncfMode(this.id, this.name);

  factory _$_SncfMode.fromJson(Map<String, dynamic> json) =>
      _$$_SncfModeFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'SncfMode(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfMode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfModeCopyWith<_$_SncfMode> get copyWith =>
      __$$_SncfModeCopyWithImpl<_$_SncfMode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfModeToJson(
      this,
    );
  }
}

abstract class _SncfMode implements SncfMode {
  const factory _SncfMode(final String id, final String name) = _$_SncfMode;

  factory _SncfMode.fromJson(Map<String, dynamic> json) = _$_SncfMode.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SncfModeCopyWith<_$_SncfMode> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfStopDateTime _$SncfStopDateTimeFromJson(Map<String, dynamic> json) {
  return _SncfStopDateTime.fromJson(json);
}

/// @nodoc
mixin _$SncfStopDateTime {
  @JsonKey(name: 'additional_informations')
  List<Object> get additionalInformations => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrival_date_time')
  DateTime get arrivalDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_arrival_date_time')
  DateTime get baseArrivalDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_departure_date_time')
  DateTime get baseDepartureDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_date_time')
  DateTime get departureDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_freshness')
  String get dataFreshness => throw _privateConstructorUsedError;
  List<Object> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfStopDateTimeCopyWith<SncfStopDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfStopDateTimeCopyWith<$Res> {
  factory $SncfStopDateTimeCopyWith(
          SncfStopDateTime value, $Res Function(SncfStopDateTime) then) =
      _$SncfStopDateTimeCopyWithImpl<$Res, SncfStopDateTime>;
  @useResult
  $Res call(
      {@JsonKey(name: 'additional_informations')
          List<Object> additionalInformations,
      @JsonKey(name: 'arrival_date_time')
          DateTime arrivalDateTime,
      @JsonKey(name: 'base_arrival_date_time')
          DateTime baseArrivalDateTime,
      @JsonKey(name: 'base_departure_date_time')
          DateTime baseDepartureDateTime,
      @JsonKey(name: 'departure_date_time')
          DateTime departureDateTime,
      @JsonKey(name: 'data_freshness')
          String dataFreshness,
      List<Object> links});
}

/// @nodoc
class _$SncfStopDateTimeCopyWithImpl<$Res, $Val extends SncfStopDateTime>
    implements $SncfStopDateTimeCopyWith<$Res> {
  _$SncfStopDateTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalInformations = null,
    Object? arrivalDateTime = null,
    Object? baseArrivalDateTime = null,
    Object? baseDepartureDateTime = null,
    Object? departureDateTime = null,
    Object? dataFreshness = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      additionalInformations: null == additionalInformations
          ? _value.additionalInformations
          : additionalInformations // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      arrivalDateTime: null == arrivalDateTime
          ? _value.arrivalDateTime
          : arrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseArrivalDateTime: null == baseArrivalDateTime
          ? _value.baseArrivalDateTime
          : baseArrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseDepartureDateTime: null == baseDepartureDateTime
          ? _value.baseDepartureDateTime
          : baseDepartureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departureDateTime: null == departureDateTime
          ? _value.departureDateTime
          : departureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataFreshness: null == dataFreshness
          ? _value.dataFreshness
          : dataFreshness // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfStopDateTimeCopyWith<$Res>
    implements $SncfStopDateTimeCopyWith<$Res> {
  factory _$$_SncfStopDateTimeCopyWith(
          _$_SncfStopDateTime value, $Res Function(_$_SncfStopDateTime) then) =
      __$$_SncfStopDateTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'additional_informations')
          List<Object> additionalInformations,
      @JsonKey(name: 'arrival_date_time')
          DateTime arrivalDateTime,
      @JsonKey(name: 'base_arrival_date_time')
          DateTime baseArrivalDateTime,
      @JsonKey(name: 'base_departure_date_time')
          DateTime baseDepartureDateTime,
      @JsonKey(name: 'departure_date_time')
          DateTime departureDateTime,
      @JsonKey(name: 'data_freshness')
          String dataFreshness,
      List<Object> links});
}

/// @nodoc
class __$$_SncfStopDateTimeCopyWithImpl<$Res>
    extends _$SncfStopDateTimeCopyWithImpl<$Res, _$_SncfStopDateTime>
    implements _$$_SncfStopDateTimeCopyWith<$Res> {
  __$$_SncfStopDateTimeCopyWithImpl(
      _$_SncfStopDateTime _value, $Res Function(_$_SncfStopDateTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalInformations = null,
    Object? arrivalDateTime = null,
    Object? baseArrivalDateTime = null,
    Object? baseDepartureDateTime = null,
    Object? departureDateTime = null,
    Object? dataFreshness = null,
    Object? links = null,
  }) {
    return _then(_$_SncfStopDateTime(
      additionalInformations: null == additionalInformations
          ? _value._additionalInformations
          : additionalInformations // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      arrivalDateTime: null == arrivalDateTime
          ? _value.arrivalDateTime
          : arrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseArrivalDateTime: null == baseArrivalDateTime
          ? _value.baseArrivalDateTime
          : baseArrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseDepartureDateTime: null == baseDepartureDateTime
          ? _value.baseDepartureDateTime
          : baseDepartureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departureDateTime: null == departureDateTime
          ? _value.departureDateTime
          : departureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataFreshness: null == dataFreshness
          ? _value.dataFreshness
          : dataFreshness // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfStopDateTime implements _SncfStopDateTime {
  const _$_SncfStopDateTime(
      {@JsonKey(name: 'additional_informations')
          required final List<Object> additionalInformations,
      @JsonKey(name: 'arrival_date_time')
          required this.arrivalDateTime,
      @JsonKey(name: 'base_arrival_date_time')
          required this.baseArrivalDateTime,
      @JsonKey(name: 'base_departure_date_time')
          required this.baseDepartureDateTime,
      @JsonKey(name: 'departure_date_time')
          required this.departureDateTime,
      @JsonKey(name: 'data_freshness')
          required this.dataFreshness,
      required final List<Object> links})
      : _additionalInformations = additionalInformations,
        _links = links;

  factory _$_SncfStopDateTime.fromJson(Map<String, dynamic> json) =>
      _$$_SncfStopDateTimeFromJson(json);

  final List<Object> _additionalInformations;
  @override
  @JsonKey(name: 'additional_informations')
  List<Object> get additionalInformations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalInformations);
  }

  @override
  @JsonKey(name: 'arrival_date_time')
  final DateTime arrivalDateTime;
  @override
  @JsonKey(name: 'base_arrival_date_time')
  final DateTime baseArrivalDateTime;
  @override
  @JsonKey(name: 'base_departure_date_time')
  final DateTime baseDepartureDateTime;
  @override
  @JsonKey(name: 'departure_date_time')
  final DateTime departureDateTime;
  @override
  @JsonKey(name: 'data_freshness')
  final String dataFreshness;
  final List<Object> _links;
  @override
  List<Object> get links {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  String toString() {
    return 'SncfStopDateTime(additionalInformations: $additionalInformations, arrivalDateTime: $arrivalDateTime, baseArrivalDateTime: $baseArrivalDateTime, baseDepartureDateTime: $baseDepartureDateTime, departureDateTime: $departureDateTime, dataFreshness: $dataFreshness, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfStopDateTime &&
            const DeepCollectionEquality().equals(
                other._additionalInformations, _additionalInformations) &&
            (identical(other.arrivalDateTime, arrivalDateTime) ||
                other.arrivalDateTime == arrivalDateTime) &&
            (identical(other.baseArrivalDateTime, baseArrivalDateTime) ||
                other.baseArrivalDateTime == baseArrivalDateTime) &&
            (identical(other.baseDepartureDateTime, baseDepartureDateTime) ||
                other.baseDepartureDateTime == baseDepartureDateTime) &&
            (identical(other.departureDateTime, departureDateTime) ||
                other.departureDateTime == departureDateTime) &&
            (identical(other.dataFreshness, dataFreshness) ||
                other.dataFreshness == dataFreshness) &&
            const DeepCollectionEquality().equals(other._links, _links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_additionalInformations),
      arrivalDateTime,
      baseArrivalDateTime,
      baseDepartureDateTime,
      departureDateTime,
      dataFreshness,
      const DeepCollectionEquality().hash(_links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfStopDateTimeCopyWith<_$_SncfStopDateTime> get copyWith =>
      __$$_SncfStopDateTimeCopyWithImpl<_$_SncfStopDateTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfStopDateTimeToJson(
      this,
    );
  }
}

abstract class _SncfStopDateTime implements SncfStopDateTime {
  const factory _SncfStopDateTime(
      {@JsonKey(name: 'additional_informations')
          required final List<Object> additionalInformations,
      @JsonKey(name: 'arrival_date_time')
          required final DateTime arrivalDateTime,
      @JsonKey(name: 'base_arrival_date_time')
          required final DateTime baseArrivalDateTime,
      @JsonKey(name: 'base_departure_date_time')
          required final DateTime baseDepartureDateTime,
      @JsonKey(name: 'departure_date_time')
          required final DateTime departureDateTime,
      @JsonKey(name: 'data_freshness')
          required final String dataFreshness,
      required final List<Object> links}) = _$_SncfStopDateTime;

  factory _SncfStopDateTime.fromJson(Map<String, dynamic> json) =
      _$_SncfStopDateTime.fromJson;

  @override
  @JsonKey(name: 'additional_informations')
  List<Object> get additionalInformations;
  @override
  @JsonKey(name: 'arrival_date_time')
  DateTime get arrivalDateTime;
  @override
  @JsonKey(name: 'base_arrival_date_time')
  DateTime get baseArrivalDateTime;
  @override
  @JsonKey(name: 'base_departure_date_time')
  DateTime get baseDepartureDateTime;
  @override
  @JsonKey(name: 'departure_date_time')
  DateTime get departureDateTime;
  @override
  @JsonKey(name: 'data_freshness')
  String get dataFreshness;
  @override
  List<Object> get links;
  @override
  @JsonKey(ignore: true)
  _$$_SncfStopDateTimeCopyWith<_$_SncfStopDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfDispInfo _$SncfDispInfoFromJson(Map<String, dynamic> json) {
  return _SncfDispInfo.fromJson(json);
}

/// @nodoc
mixin _$SncfDispInfo {
  String get code => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'commercial_mode')
  String get commercialMode => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  List<Object> get equipments => throw _privateConstructorUsedError;
  String get headsign => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  List<Object> get links => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  @JsonKey(name: 'physical_mode')
  String get physicalMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'text_color')
  String get textColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'trip_short_name')
  String get tripShortName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfDispInfoCopyWith<SncfDispInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfDispInfoCopyWith<$Res> {
  factory $SncfDispInfoCopyWith(
          SncfDispInfo value, $Res Function(SncfDispInfo) then) =
      _$SncfDispInfoCopyWithImpl<$Res, SncfDispInfo>;
  @useResult
  $Res call(
      {String code,
      String color,
      @JsonKey(name: 'commercial_mode') String commercialMode,
      String description,
      String direction,
      List<Object> equipments,
      String headsign,
      String label,
      List<Object> links,
      String name,
      String network,
      @JsonKey(name: 'physical_mode') String physicalMode,
      @JsonKey(name: 'text_color') String textColor,
      @JsonKey(name: 'trip_short_name') String tripShortName});
}

/// @nodoc
class _$SncfDispInfoCopyWithImpl<$Res, $Val extends SncfDispInfo>
    implements $SncfDispInfoCopyWith<$Res> {
  _$SncfDispInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? color = null,
    Object? commercialMode = null,
    Object? description = null,
    Object? direction = null,
    Object? equipments = null,
    Object? headsign = null,
    Object? label = null,
    Object? links = null,
    Object? name = null,
    Object? network = null,
    Object? physicalMode = null,
    Object? textColor = null,
    Object? tripShortName = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      commercialMode: null == commercialMode
          ? _value.commercialMode
          : commercialMode // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      equipments: null == equipments
          ? _value.equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      headsign: null == headsign
          ? _value.headsign
          : headsign // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      physicalMode: null == physicalMode
          ? _value.physicalMode
          : physicalMode // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
      tripShortName: null == tripShortName
          ? _value.tripShortName
          : tripShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfDispInfoCopyWith<$Res>
    implements $SncfDispInfoCopyWith<$Res> {
  factory _$$_SncfDispInfoCopyWith(
          _$_SncfDispInfo value, $Res Function(_$_SncfDispInfo) then) =
      __$$_SncfDispInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String color,
      @JsonKey(name: 'commercial_mode') String commercialMode,
      String description,
      String direction,
      List<Object> equipments,
      String headsign,
      String label,
      List<Object> links,
      String name,
      String network,
      @JsonKey(name: 'physical_mode') String physicalMode,
      @JsonKey(name: 'text_color') String textColor,
      @JsonKey(name: 'trip_short_name') String tripShortName});
}

/// @nodoc
class __$$_SncfDispInfoCopyWithImpl<$Res>
    extends _$SncfDispInfoCopyWithImpl<$Res, _$_SncfDispInfo>
    implements _$$_SncfDispInfoCopyWith<$Res> {
  __$$_SncfDispInfoCopyWithImpl(
      _$_SncfDispInfo _value, $Res Function(_$_SncfDispInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? color = null,
    Object? commercialMode = null,
    Object? description = null,
    Object? direction = null,
    Object? equipments = null,
    Object? headsign = null,
    Object? label = null,
    Object? links = null,
    Object? name = null,
    Object? network = null,
    Object? physicalMode = null,
    Object? textColor = null,
    Object? tripShortName = null,
  }) {
    return _then(_$_SncfDispInfo(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      commercialMode: null == commercialMode
          ? _value.commercialMode
          : commercialMode // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      equipments: null == equipments
          ? _value._equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      headsign: null == headsign
          ? _value.headsign
          : headsign // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      physicalMode: null == physicalMode
          ? _value.physicalMode
          : physicalMode // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
      tripShortName: null == tripShortName
          ? _value.tripShortName
          : tripShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfDispInfo implements _SncfDispInfo {
  const _$_SncfDispInfo(
      {required this.code,
      required this.color,
      @JsonKey(name: 'commercial_mode') required this.commercialMode,
      required this.description,
      required this.direction,
      required final List<Object> equipments,
      required this.headsign,
      required this.label,
      required final List<Object> links,
      required this.name,
      required this.network,
      @JsonKey(name: 'physical_mode') required this.physicalMode,
      @JsonKey(name: 'text_color') required this.textColor,
      @JsonKey(name: 'trip_short_name') required this.tripShortName})
      : _equipments = equipments,
        _links = links;

  factory _$_SncfDispInfo.fromJson(Map<String, dynamic> json) =>
      _$$_SncfDispInfoFromJson(json);

  @override
  final String code;
  @override
  final String color;
  @override
  @JsonKey(name: 'commercial_mode')
  final String commercialMode;
  @override
  final String description;
  @override
  final String direction;
  final List<Object> _equipments;
  @override
  List<Object> get equipments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipments);
  }

  @override
  final String headsign;
  @override
  final String label;
  final List<Object> _links;
  @override
  List<Object> get links {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  final String name;
  @override
  final String network;
  @override
  @JsonKey(name: 'physical_mode')
  final String physicalMode;
  @override
  @JsonKey(name: 'text_color')
  final String textColor;
  @override
  @JsonKey(name: 'trip_short_name')
  final String tripShortName;

  @override
  String toString() {
    return 'SncfDispInfo(code: $code, color: $color, commercialMode: $commercialMode, description: $description, direction: $direction, equipments: $equipments, headsign: $headsign, label: $label, links: $links, name: $name, network: $network, physicalMode: $physicalMode, textColor: $textColor, tripShortName: $tripShortName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfDispInfo &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.commercialMode, commercialMode) ||
                other.commercialMode == commercialMode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            const DeepCollectionEquality()
                .equals(other._equipments, _equipments) &&
            (identical(other.headsign, headsign) ||
                other.headsign == headsign) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.physicalMode, physicalMode) ||
                other.physicalMode == physicalMode) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.tripShortName, tripShortName) ||
                other.tripShortName == tripShortName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      color,
      commercialMode,
      description,
      direction,
      const DeepCollectionEquality().hash(_equipments),
      headsign,
      label,
      const DeepCollectionEquality().hash(_links),
      name,
      network,
      physicalMode,
      textColor,
      tripShortName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfDispInfoCopyWith<_$_SncfDispInfo> get copyWith =>
      __$$_SncfDispInfoCopyWithImpl<_$_SncfDispInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfDispInfoToJson(
      this,
    );
  }
}

abstract class _SncfDispInfo implements SncfDispInfo {
  const factory _SncfDispInfo(
      {required final String code,
      required final String color,
      @JsonKey(name: 'commercial_mode')
          required final String commercialMode,
      required final String description,
      required final String direction,
      required final List<Object> equipments,
      required final String headsign,
      required final String label,
      required final List<Object> links,
      required final String name,
      required final String network,
      @JsonKey(name: 'physical_mode')
          required final String physicalMode,
      @JsonKey(name: 'text_color')
          required final String textColor,
      @JsonKey(name: 'trip_short_name')
          required final String tripShortName}) = _$_SncfDispInfo;

  factory _SncfDispInfo.fromJson(Map<String, dynamic> json) =
      _$_SncfDispInfo.fromJson;

  @override
  String get code;
  @override
  String get color;
  @override
  @JsonKey(name: 'commercial_mode')
  String get commercialMode;
  @override
  String get description;
  @override
  String get direction;
  @override
  List<Object> get equipments;
  @override
  String get headsign;
  @override
  String get label;
  @override
  List<Object> get links;
  @override
  String get name;
  @override
  String get network;
  @override
  @JsonKey(name: 'physical_mode')
  String get physicalMode;
  @override
  @JsonKey(name: 'text_color')
  String get textColor;
  @override
  @JsonKey(name: 'trip_short_name')
  String get tripShortName;
  @override
  @JsonKey(ignore: true)
  _$$_SncfDispInfoCopyWith<_$_SncfDispInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
