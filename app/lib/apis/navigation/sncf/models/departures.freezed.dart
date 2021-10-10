// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'departures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SncfStationboard _$SncfStationboardFromJson(Map<String, dynamic> json) {
  return _SncfStationboard.fromJson(json);
}

/// @nodoc
class _$SncfStationboardTearOff {
  const _$SncfStationboardTearOff();

  _SncfStationboard call(
      {required SncfContext context,
      required List<SncfDeparture> departures,
      SncfError? error,
      @JsonKey(ignore: true) Stop stop = const MockStop()}) {
    return _SncfStationboard(
      context: context,
      departures: departures,
      error: error,
      stop: stop,
    );
  }

  SncfStationboard fromJson(Map<String, Object?> json) {
    return SncfStationboard.fromJson(json);
  }
}

/// @nodoc
const $SncfStationboard = _$SncfStationboardTearOff();

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
      _$SncfStationboardCopyWithImpl<$Res>;
  $Res call(
      {SncfContext context,
      List<SncfDeparture> departures,
      SncfError? error,
      @JsonKey(ignore: true) Stop stop});

  $SncfContextCopyWith<$Res> get context;
  $SncfErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$SncfStationboardCopyWithImpl<$Res>
    implements $SncfStationboardCopyWith<$Res> {
  _$SncfStationboardCopyWithImpl(this._value, this._then);

  final SncfStationboard _value;
  // ignore: unused_field
  final $Res Function(SncfStationboard) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? departures = freezed,
    Object? error = freezed,
    Object? stop = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as SncfContext,
      departures: departures == freezed
          ? _value.departures
          : departures // ignore: cast_nullable_to_non_nullable
              as List<SncfDeparture>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as SncfError?,
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
    ));
  }

  @override
  $SncfContextCopyWith<$Res> get context {
    return $SncfContextCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value));
    });
  }

  @override
  $SncfErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $SncfErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
abstract class _$SncfStationboardCopyWith<$Res>
    implements $SncfStationboardCopyWith<$Res> {
  factory _$SncfStationboardCopyWith(
          _SncfStationboard value, $Res Function(_SncfStationboard) then) =
      __$SncfStationboardCopyWithImpl<$Res>;
  @override
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
class __$SncfStationboardCopyWithImpl<$Res>
    extends _$SncfStationboardCopyWithImpl<$Res>
    implements _$SncfStationboardCopyWith<$Res> {
  __$SncfStationboardCopyWithImpl(
      _SncfStationboard _value, $Res Function(_SncfStationboard) _then)
      : super(_value, (v) => _then(v as _SncfStationboard));

  @override
  _SncfStationboard get _value => super._value as _SncfStationboard;

  @override
  $Res call({
    Object? context = freezed,
    Object? departures = freezed,
    Object? error = freezed,
    Object? stop = freezed,
  }) {
    return _then(_SncfStationboard(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as SncfContext,
      departures: departures == freezed
          ? _value.departures
          : departures // ignore: cast_nullable_to_non_nullable
              as List<SncfDeparture>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as SncfError?,
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfStationboard extends _SncfStationboard
    with DiagnosticableTreeMixin {
  const _$_SncfStationboard(
      {required this.context,
      required this.departures,
      this.error,
      @JsonKey(ignore: true) this.stop = const MockStop()})
      : super._();

  factory _$_SncfStationboard.fromJson(Map<String, dynamic> json) =>
      _$$_SncfStationboardFromJson(json);

  @override
  final SncfContext context;
  @override
  final List<SncfDeparture> departures;
  @override
  final SncfError? error;
  @override
  @JsonKey(ignore: true)
  final Stop stop;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfStationboard(context: $context, departures: $departures, error: $error, stop: $stop)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfStationboard'))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('departures', departures))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('stop', stop));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfStationboard &&
            (identical(other.context, context) || other.context == context) &&
            const DeepCollectionEquality()
                .equals(other.departures, departures) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stop, stop) || other.stop == stop));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context,
      const DeepCollectionEquality().hash(departures), error, stop);

  @JsonKey(ignore: true)
  @override
  _$SncfStationboardCopyWith<_SncfStationboard> get copyWith =>
      __$SncfStationboardCopyWithImpl<_SncfStationboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfStationboardToJson(this);
  }
}

abstract class _SncfStationboard extends SncfStationboard {
  const factory _SncfStationboard(
      {required SncfContext context,
      required List<SncfDeparture> departures,
      SncfError? error,
      @JsonKey(ignore: true) Stop stop}) = _$_SncfStationboard;
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
  _$SncfStationboardCopyWith<_SncfStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfError _$SncfErrorFromJson(Map<String, dynamic> json) {
  return _SncfError.fromJson(json);
}

/// @nodoc
class _$SncfErrorTearOff {
  const _$SncfErrorTearOff();

  _SncfError call(String id, String message) {
    return _SncfError(
      id,
      message,
    );
  }

  SncfError fromJson(Map<String, Object?> json) {
    return SncfError.fromJson(json);
  }
}

/// @nodoc
const $SncfError = _$SncfErrorTearOff();

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
      _$SncfErrorCopyWithImpl<$Res>;
  $Res call({String id, String message});
}

/// @nodoc
class _$SncfErrorCopyWithImpl<$Res> implements $SncfErrorCopyWith<$Res> {
  _$SncfErrorCopyWithImpl(this._value, this._then);

  final SncfError _value;
  // ignore: unused_field
  final $Res Function(SncfError) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SncfErrorCopyWith<$Res> implements $SncfErrorCopyWith<$Res> {
  factory _$SncfErrorCopyWith(
          _SncfError value, $Res Function(_SncfError) then) =
      __$SncfErrorCopyWithImpl<$Res>;
  @override
  $Res call({String id, String message});
}

/// @nodoc
class __$SncfErrorCopyWithImpl<$Res> extends _$SncfErrorCopyWithImpl<$Res>
    implements _$SncfErrorCopyWith<$Res> {
  __$SncfErrorCopyWithImpl(_SncfError _value, $Res Function(_SncfError) _then)
      : super(_value, (v) => _then(v as _SncfError));

  @override
  _SncfError get _value => super._value as _SncfError;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_SncfError(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfError with DiagnosticableTreeMixin implements _SncfError {
  const _$_SncfError(this.id, this.message);

  factory _$_SncfError.fromJson(Map<String, dynamic> json) =>
      _$$_SncfErrorFromJson(json);

  @override
  final String id;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfError(id: $id, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfError'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfError &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, message);

  @JsonKey(ignore: true)
  @override
  _$SncfErrorCopyWith<_SncfError> get copyWith =>
      __$SncfErrorCopyWithImpl<_SncfError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfErrorToJson(this);
  }
}

abstract class _SncfError implements SncfError {
  const factory _SncfError(String id, String message) = _$_SncfError;

  factory _SncfError.fromJson(Map<String, dynamic> json) =
      _$_SncfError.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$SncfErrorCopyWith<_SncfError> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfDeparture _$SncfDepartureFromJson(Map<String, dynamic> json) {
  return _SncfDeparture.fromJson(json);
}

/// @nodoc
class _$SncfDepartureTearOff {
  const _$SncfDepartureTearOff();

  _SncfDeparture call(
      {@JsonKey(name: 'display_informations')
          required SncfDispInfo displayInformations,
      @JsonKey(name: 'stop_date_time')
          required SncfStopDateTime stopDateTime,
      @JsonKey(name: 'stop_point')
          required SncfStopPoint stopPoint}) {
    return _SncfDeparture(
      displayInformations: displayInformations,
      stopDateTime: stopDateTime,
      stopPoint: stopPoint,
    );
  }

  SncfDeparture fromJson(Map<String, Object?> json) {
    return SncfDeparture.fromJson(json);
  }
}

/// @nodoc
const $SncfDeparture = _$SncfDepartureTearOff();

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
      _$SncfDepartureCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'display_informations') SncfDispInfo displayInformations,
      @JsonKey(name: 'stop_date_time') SncfStopDateTime stopDateTime,
      @JsonKey(name: 'stop_point') SncfStopPoint stopPoint});

  $SncfDispInfoCopyWith<$Res> get displayInformations;
  $SncfStopDateTimeCopyWith<$Res> get stopDateTime;
  $SncfStopPointCopyWith<$Res> get stopPoint;
}

/// @nodoc
class _$SncfDepartureCopyWithImpl<$Res>
    implements $SncfDepartureCopyWith<$Res> {
  _$SncfDepartureCopyWithImpl(this._value, this._then);

  final SncfDeparture _value;
  // ignore: unused_field
  final $Res Function(SncfDeparture) _then;

  @override
  $Res call({
    Object? displayInformations = freezed,
    Object? stopDateTime = freezed,
    Object? stopPoint = freezed,
  }) {
    return _then(_value.copyWith(
      displayInformations: displayInformations == freezed
          ? _value.displayInformations
          : displayInformations // ignore: cast_nullable_to_non_nullable
              as SncfDispInfo,
      stopDateTime: stopDateTime == freezed
          ? _value.stopDateTime
          : stopDateTime // ignore: cast_nullable_to_non_nullable
              as SncfStopDateTime,
      stopPoint: stopPoint == freezed
          ? _value.stopPoint
          : stopPoint // ignore: cast_nullable_to_non_nullable
              as SncfStopPoint,
    ));
  }

  @override
  $SncfDispInfoCopyWith<$Res> get displayInformations {
    return $SncfDispInfoCopyWith<$Res>(_value.displayInformations, (value) {
      return _then(_value.copyWith(displayInformations: value));
    });
  }

  @override
  $SncfStopDateTimeCopyWith<$Res> get stopDateTime {
    return $SncfStopDateTimeCopyWith<$Res>(_value.stopDateTime, (value) {
      return _then(_value.copyWith(stopDateTime: value));
    });
  }

  @override
  $SncfStopPointCopyWith<$Res> get stopPoint {
    return $SncfStopPointCopyWith<$Res>(_value.stopPoint, (value) {
      return _then(_value.copyWith(stopPoint: value));
    });
  }
}

/// @nodoc
abstract class _$SncfDepartureCopyWith<$Res>
    implements $SncfDepartureCopyWith<$Res> {
  factory _$SncfDepartureCopyWith(
          _SncfDeparture value, $Res Function(_SncfDeparture) then) =
      __$SncfDepartureCopyWithImpl<$Res>;
  @override
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
class __$SncfDepartureCopyWithImpl<$Res>
    extends _$SncfDepartureCopyWithImpl<$Res>
    implements _$SncfDepartureCopyWith<$Res> {
  __$SncfDepartureCopyWithImpl(
      _SncfDeparture _value, $Res Function(_SncfDeparture) _then)
      : super(_value, (v) => _then(v as _SncfDeparture));

  @override
  _SncfDeparture get _value => super._value as _SncfDeparture;

  @override
  $Res call({
    Object? displayInformations = freezed,
    Object? stopDateTime = freezed,
    Object? stopPoint = freezed,
  }) {
    return _then(_SncfDeparture(
      displayInformations: displayInformations == freezed
          ? _value.displayInformations
          : displayInformations // ignore: cast_nullable_to_non_nullable
              as SncfDispInfo,
      stopDateTime: stopDateTime == freezed
          ? _value.stopDateTime
          : stopDateTime // ignore: cast_nullable_to_non_nullable
              as SncfStopDateTime,
      stopPoint: stopPoint == freezed
          ? _value.stopPoint
          : stopPoint // ignore: cast_nullable_to_non_nullable
              as SncfStopPoint,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfDeparture extends _SncfDeparture with DiagnosticableTreeMixin {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfDeparture(displayInformations: $displayInformations, stopDateTime: $stopDateTime, stopPoint: $stopPoint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfDeparture'))
      ..add(DiagnosticsProperty('displayInformations', displayInformations))
      ..add(DiagnosticsProperty('stopDateTime', stopDateTime))
      ..add(DiagnosticsProperty('stopPoint', stopPoint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfDeparture &&
            (identical(other.displayInformations, displayInformations) ||
                other.displayInformations == displayInformations) &&
            (identical(other.stopDateTime, stopDateTime) ||
                other.stopDateTime == stopDateTime) &&
            (identical(other.stopPoint, stopPoint) ||
                other.stopPoint == stopPoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, displayInformations, stopDateTime, stopPoint);

  @JsonKey(ignore: true)
  @override
  _$SncfDepartureCopyWith<_SncfDeparture> get copyWith =>
      __$SncfDepartureCopyWithImpl<_SncfDeparture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfDepartureToJson(this);
  }
}

abstract class _SncfDeparture extends SncfDeparture {
  const factory _SncfDeparture(
      {@JsonKey(name: 'display_informations')
          required SncfDispInfo displayInformations,
      @JsonKey(name: 'stop_date_time')
          required SncfStopDateTime stopDateTime,
      @JsonKey(name: 'stop_point')
          required SncfStopPoint stopPoint}) = _$_SncfDeparture;
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
  _$SncfDepartureCopyWith<_SncfDeparture> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfStopPoint _$SncfStopPointFromJson(Map<String, dynamic> json) {
  return _SncfStopPoint.fromJson(json);
}

/// @nodoc
class _$SncfStopPointTearOff {
  const _$SncfStopPointTearOff();

  _SncfStopPoint call(
      @JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes) {
    return _SncfStopPoint(
      commercialModes,
    );
  }

  SncfStopPoint fromJson(Map<String, Object?> json) {
    return SncfStopPoint.fromJson(json);
  }
}

/// @nodoc
const $SncfStopPoint = _$SncfStopPointTearOff();

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
      _$SncfStopPointCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes});
}

/// @nodoc
class _$SncfStopPointCopyWithImpl<$Res>
    implements $SncfStopPointCopyWith<$Res> {
  _$SncfStopPointCopyWithImpl(this._value, this._then);

  final SncfStopPoint _value;
  // ignore: unused_field
  final $Res Function(SncfStopPoint) _then;

  @override
  $Res call({
    Object? commercialModes = freezed,
  }) {
    return _then(_value.copyWith(
      commercialModes: commercialModes == freezed
          ? _value.commercialModes
          : commercialModes // ignore: cast_nullable_to_non_nullable
              as List<SncfMode>,
    ));
  }
}

/// @nodoc
abstract class _$SncfStopPointCopyWith<$Res>
    implements $SncfStopPointCopyWith<$Res> {
  factory _$SncfStopPointCopyWith(
          _SncfStopPoint value, $Res Function(_SncfStopPoint) then) =
      __$SncfStopPointCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes});
}

/// @nodoc
class __$SncfStopPointCopyWithImpl<$Res>
    extends _$SncfStopPointCopyWithImpl<$Res>
    implements _$SncfStopPointCopyWith<$Res> {
  __$SncfStopPointCopyWithImpl(
      _SncfStopPoint _value, $Res Function(_SncfStopPoint) _then)
      : super(_value, (v) => _then(v as _SncfStopPoint));

  @override
  _SncfStopPoint get _value => super._value as _SncfStopPoint;

  @override
  $Res call({
    Object? commercialModes = freezed,
  }) {
    return _then(_SncfStopPoint(
      commercialModes == freezed
          ? _value.commercialModes
          : commercialModes // ignore: cast_nullable_to_non_nullable
              as List<SncfMode>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfStopPoint with DiagnosticableTreeMixin implements _SncfStopPoint {
  const _$_SncfStopPoint(
      @JsonKey(name: 'commercial_modes') this.commercialModes);

  factory _$_SncfStopPoint.fromJson(Map<String, dynamic> json) =>
      _$$_SncfStopPointFromJson(json);

  @override
  @JsonKey(name: 'commercial_modes')
  final List<SncfMode> commercialModes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfStopPoint(commercialModes: $commercialModes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfStopPoint'))
      ..add(DiagnosticsProperty('commercialModes', commercialModes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfStopPoint &&
            const DeepCollectionEquality()
                .equals(other.commercialModes, commercialModes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(commercialModes));

  @JsonKey(ignore: true)
  @override
  _$SncfStopPointCopyWith<_SncfStopPoint> get copyWith =>
      __$SncfStopPointCopyWithImpl<_SncfStopPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfStopPointToJson(this);
  }
}

abstract class _SncfStopPoint implements SncfStopPoint {
  const factory _SncfStopPoint(
          @JsonKey(name: 'commercial_modes') List<SncfMode> commercialModes) =
      _$_SncfStopPoint;

  factory _SncfStopPoint.fromJson(Map<String, dynamic> json) =
      _$_SncfStopPoint.fromJson;

  @override
  @JsonKey(name: 'commercial_modes')
  List<SncfMode> get commercialModes;
  @override
  @JsonKey(ignore: true)
  _$SncfStopPointCopyWith<_SncfStopPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfMode _$SncfModeFromJson(Map<String, dynamic> json) {
  return _SncfMode.fromJson(json);
}

/// @nodoc
class _$SncfModeTearOff {
  const _$SncfModeTearOff();

  _SncfMode call(String id, String name) {
    return _SncfMode(
      id,
      name,
    );
  }

  SncfMode fromJson(Map<String, Object?> json) {
    return SncfMode.fromJson(json);
  }
}

/// @nodoc
const $SncfMode = _$SncfModeTearOff();

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
      _$SncfModeCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$SncfModeCopyWithImpl<$Res> implements $SncfModeCopyWith<$Res> {
  _$SncfModeCopyWithImpl(this._value, this._then);

  final SncfMode _value;
  // ignore: unused_field
  final $Res Function(SncfMode) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SncfModeCopyWith<$Res> implements $SncfModeCopyWith<$Res> {
  factory _$SncfModeCopyWith(_SncfMode value, $Res Function(_SncfMode) then) =
      __$SncfModeCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$SncfModeCopyWithImpl<$Res> extends _$SncfModeCopyWithImpl<$Res>
    implements _$SncfModeCopyWith<$Res> {
  __$SncfModeCopyWithImpl(_SncfMode _value, $Res Function(_SncfMode) _then)
      : super(_value, (v) => _then(v as _SncfMode));

  @override
  _SncfMode get _value => super._value as _SncfMode;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_SncfMode(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfMode with DiagnosticableTreeMixin implements _SncfMode {
  const _$_SncfMode(this.id, this.name);

  factory _$_SncfMode.fromJson(Map<String, dynamic> json) =>
      _$$_SncfModeFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfMode(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfMode'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfMode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  _$SncfModeCopyWith<_SncfMode> get copyWith =>
      __$SncfModeCopyWithImpl<_SncfMode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfModeToJson(this);
  }
}

abstract class _SncfMode implements SncfMode {
  const factory _SncfMode(String id, String name) = _$_SncfMode;

  factory _SncfMode.fromJson(Map<String, dynamic> json) = _$_SncfMode.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$SncfModeCopyWith<_SncfMode> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfStopDateTime _$SncfStopDateTimeFromJson(Map<String, dynamic> json) {
  return _SncfStopDateTime.fromJson(json);
}

/// @nodoc
class _$SncfStopDateTimeTearOff {
  const _$SncfStopDateTimeTearOff();

  _SncfStopDateTime call(
      {@JsonKey(name: 'additional_informations')
          required List<Object> additionalInformations,
      @JsonKey(name: 'arrival_date_time')
          required DateTime arrivalDateTime,
      @JsonKey(name: 'base_arrival_date_time')
          required DateTime baseArrivalDateTime,
      @JsonKey(name: 'base_departure_date_time')
          required DateTime baseDepartureDateTime,
      @JsonKey(name: 'departure_date_time')
          required DateTime departureDateTime,
      @JsonKey(name: 'data_freshness')
          required String dataFreshness,
      required List<Object> links}) {
    return _SncfStopDateTime(
      additionalInformations: additionalInformations,
      arrivalDateTime: arrivalDateTime,
      baseArrivalDateTime: baseArrivalDateTime,
      baseDepartureDateTime: baseDepartureDateTime,
      departureDateTime: departureDateTime,
      dataFreshness: dataFreshness,
      links: links,
    );
  }

  SncfStopDateTime fromJson(Map<String, Object?> json) {
    return SncfStopDateTime.fromJson(json);
  }
}

/// @nodoc
const $SncfStopDateTime = _$SncfStopDateTimeTearOff();

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
      _$SncfStopDateTimeCopyWithImpl<$Res>;
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
class _$SncfStopDateTimeCopyWithImpl<$Res>
    implements $SncfStopDateTimeCopyWith<$Res> {
  _$SncfStopDateTimeCopyWithImpl(this._value, this._then);

  final SncfStopDateTime _value;
  // ignore: unused_field
  final $Res Function(SncfStopDateTime) _then;

  @override
  $Res call({
    Object? additionalInformations = freezed,
    Object? arrivalDateTime = freezed,
    Object? baseArrivalDateTime = freezed,
    Object? baseDepartureDateTime = freezed,
    Object? departureDateTime = freezed,
    Object? dataFreshness = freezed,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      additionalInformations: additionalInformations == freezed
          ? _value.additionalInformations
          : additionalInformations // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      arrivalDateTime: arrivalDateTime == freezed
          ? _value.arrivalDateTime
          : arrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseArrivalDateTime: baseArrivalDateTime == freezed
          ? _value.baseArrivalDateTime
          : baseArrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseDepartureDateTime: baseDepartureDateTime == freezed
          ? _value.baseDepartureDateTime
          : baseDepartureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departureDateTime: departureDateTime == freezed
          ? _value.departureDateTime
          : departureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataFreshness: dataFreshness == freezed
          ? _value.dataFreshness
          : dataFreshness // ignore: cast_nullable_to_non_nullable
              as String,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc
abstract class _$SncfStopDateTimeCopyWith<$Res>
    implements $SncfStopDateTimeCopyWith<$Res> {
  factory _$SncfStopDateTimeCopyWith(
          _SncfStopDateTime value, $Res Function(_SncfStopDateTime) then) =
      __$SncfStopDateTimeCopyWithImpl<$Res>;
  @override
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
class __$SncfStopDateTimeCopyWithImpl<$Res>
    extends _$SncfStopDateTimeCopyWithImpl<$Res>
    implements _$SncfStopDateTimeCopyWith<$Res> {
  __$SncfStopDateTimeCopyWithImpl(
      _SncfStopDateTime _value, $Res Function(_SncfStopDateTime) _then)
      : super(_value, (v) => _then(v as _SncfStopDateTime));

  @override
  _SncfStopDateTime get _value => super._value as _SncfStopDateTime;

  @override
  $Res call({
    Object? additionalInformations = freezed,
    Object? arrivalDateTime = freezed,
    Object? baseArrivalDateTime = freezed,
    Object? baseDepartureDateTime = freezed,
    Object? departureDateTime = freezed,
    Object? dataFreshness = freezed,
    Object? links = freezed,
  }) {
    return _then(_SncfStopDateTime(
      additionalInformations: additionalInformations == freezed
          ? _value.additionalInformations
          : additionalInformations // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      arrivalDateTime: arrivalDateTime == freezed
          ? _value.arrivalDateTime
          : arrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseArrivalDateTime: baseArrivalDateTime == freezed
          ? _value.baseArrivalDateTime
          : baseArrivalDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      baseDepartureDateTime: baseDepartureDateTime == freezed
          ? _value.baseDepartureDateTime
          : baseDepartureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departureDateTime: departureDateTime == freezed
          ? _value.departureDateTime
          : departureDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataFreshness: dataFreshness == freezed
          ? _value.dataFreshness
          : dataFreshness // ignore: cast_nullable_to_non_nullable
              as String,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfStopDateTime
    with DiagnosticableTreeMixin
    implements _SncfStopDateTime {
  const _$_SncfStopDateTime(
      {@JsonKey(name: 'additional_informations')
          required this.additionalInformations,
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
      required this.links});

  factory _$_SncfStopDateTime.fromJson(Map<String, dynamic> json) =>
      _$$_SncfStopDateTimeFromJson(json);

  @override
  @JsonKey(name: 'additional_informations')
  final List<Object> additionalInformations;
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
  @override
  final List<Object> links;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfStopDateTime(additionalInformations: $additionalInformations, arrivalDateTime: $arrivalDateTime, baseArrivalDateTime: $baseArrivalDateTime, baseDepartureDateTime: $baseDepartureDateTime, departureDateTime: $departureDateTime, dataFreshness: $dataFreshness, links: $links)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfStopDateTime'))
      ..add(
          DiagnosticsProperty('additionalInformations', additionalInformations))
      ..add(DiagnosticsProperty('arrivalDateTime', arrivalDateTime))
      ..add(DiagnosticsProperty('baseArrivalDateTime', baseArrivalDateTime))
      ..add(DiagnosticsProperty('baseDepartureDateTime', baseDepartureDateTime))
      ..add(DiagnosticsProperty('departureDateTime', departureDateTime))
      ..add(DiagnosticsProperty('dataFreshness', dataFreshness))
      ..add(DiagnosticsProperty('links', links));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfStopDateTime &&
            const DeepCollectionEquality()
                .equals(other.additionalInformations, additionalInformations) &&
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
            const DeepCollectionEquality().equals(other.links, links));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(additionalInformations),
      arrivalDateTime,
      baseArrivalDateTime,
      baseDepartureDateTime,
      departureDateTime,
      dataFreshness,
      const DeepCollectionEquality().hash(links));

  @JsonKey(ignore: true)
  @override
  _$SncfStopDateTimeCopyWith<_SncfStopDateTime> get copyWith =>
      __$SncfStopDateTimeCopyWithImpl<_SncfStopDateTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfStopDateTimeToJson(this);
  }
}

abstract class _SncfStopDateTime implements SncfStopDateTime {
  const factory _SncfStopDateTime(
      {@JsonKey(name: 'additional_informations')
          required List<Object> additionalInformations,
      @JsonKey(name: 'arrival_date_time')
          required DateTime arrivalDateTime,
      @JsonKey(name: 'base_arrival_date_time')
          required DateTime baseArrivalDateTime,
      @JsonKey(name: 'base_departure_date_time')
          required DateTime baseDepartureDateTime,
      @JsonKey(name: 'departure_date_time')
          required DateTime departureDateTime,
      @JsonKey(name: 'data_freshness')
          required String dataFreshness,
      required List<Object> links}) = _$_SncfStopDateTime;

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
  _$SncfStopDateTimeCopyWith<_SncfStopDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

SncfDispInfo _$SncfDispInfoFromJson(Map<String, dynamic> json) {
  return _SncfDispInfo.fromJson(json);
}

/// @nodoc
class _$SncfDispInfoTearOff {
  const _$SncfDispInfoTearOff();

  _SncfDispInfo call(
      {required String code,
      required String color,
      @JsonKey(name: 'commercial_mode') required String commercialMode,
      required String description,
      required String direction,
      required List<Object> equipments,
      required String headsign,
      required String label,
      required List<Object> links,
      required String name,
      required String network,
      @JsonKey(name: 'physical_mode') required String physicalMode,
      @JsonKey(name: 'text_color') required String textColor,
      @JsonKey(name: 'trip_short_name') required String tripShortName}) {
    return _SncfDispInfo(
      code: code,
      color: color,
      commercialMode: commercialMode,
      description: description,
      direction: direction,
      equipments: equipments,
      headsign: headsign,
      label: label,
      links: links,
      name: name,
      network: network,
      physicalMode: physicalMode,
      textColor: textColor,
      tripShortName: tripShortName,
    );
  }

  SncfDispInfo fromJson(Map<String, Object?> json) {
    return SncfDispInfo.fromJson(json);
  }
}

/// @nodoc
const $SncfDispInfo = _$SncfDispInfoTearOff();

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
      _$SncfDispInfoCopyWithImpl<$Res>;
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
class _$SncfDispInfoCopyWithImpl<$Res> implements $SncfDispInfoCopyWith<$Res> {
  _$SncfDispInfoCopyWithImpl(this._value, this._then);

  final SncfDispInfo _value;
  // ignore: unused_field
  final $Res Function(SncfDispInfo) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? color = freezed,
    Object? commercialMode = freezed,
    Object? description = freezed,
    Object? direction = freezed,
    Object? equipments = freezed,
    Object? headsign = freezed,
    Object? label = freezed,
    Object? links = freezed,
    Object? name = freezed,
    Object? network = freezed,
    Object? physicalMode = freezed,
    Object? textColor = freezed,
    Object? tripShortName = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      commercialMode: commercialMode == freezed
          ? _value.commercialMode
          : commercialMode // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      equipments: equipments == freezed
          ? _value.equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      headsign: headsign == freezed
          ? _value.headsign
          : headsign // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      physicalMode: physicalMode == freezed
          ? _value.physicalMode
          : physicalMode // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: textColor == freezed
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
      tripShortName: tripShortName == freezed
          ? _value.tripShortName
          : tripShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SncfDispInfoCopyWith<$Res>
    implements $SncfDispInfoCopyWith<$Res> {
  factory _$SncfDispInfoCopyWith(
          _SncfDispInfo value, $Res Function(_SncfDispInfo) then) =
      __$SncfDispInfoCopyWithImpl<$Res>;
  @override
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
class __$SncfDispInfoCopyWithImpl<$Res> extends _$SncfDispInfoCopyWithImpl<$Res>
    implements _$SncfDispInfoCopyWith<$Res> {
  __$SncfDispInfoCopyWithImpl(
      _SncfDispInfo _value, $Res Function(_SncfDispInfo) _then)
      : super(_value, (v) => _then(v as _SncfDispInfo));

  @override
  _SncfDispInfo get _value => super._value as _SncfDispInfo;

  @override
  $Res call({
    Object? code = freezed,
    Object? color = freezed,
    Object? commercialMode = freezed,
    Object? description = freezed,
    Object? direction = freezed,
    Object? equipments = freezed,
    Object? headsign = freezed,
    Object? label = freezed,
    Object? links = freezed,
    Object? name = freezed,
    Object? network = freezed,
    Object? physicalMode = freezed,
    Object? textColor = freezed,
    Object? tripShortName = freezed,
  }) {
    return _then(_SncfDispInfo(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      commercialMode: commercialMode == freezed
          ? _value.commercialMode
          : commercialMode // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      equipments: equipments == freezed
          ? _value.equipments
          : equipments // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      headsign: headsign == freezed
          ? _value.headsign
          : headsign // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      physicalMode: physicalMode == freezed
          ? _value.physicalMode
          : physicalMode // ignore: cast_nullable_to_non_nullable
              as String,
      textColor: textColor == freezed
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as String,
      tripShortName: tripShortName == freezed
          ? _value.tripShortName
          : tripShortName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SncfDispInfo with DiagnosticableTreeMixin implements _SncfDispInfo {
  const _$_SncfDispInfo(
      {required this.code,
      required this.color,
      @JsonKey(name: 'commercial_mode') required this.commercialMode,
      required this.description,
      required this.direction,
      required this.equipments,
      required this.headsign,
      required this.label,
      required this.links,
      required this.name,
      required this.network,
      @JsonKey(name: 'physical_mode') required this.physicalMode,
      @JsonKey(name: 'text_color') required this.textColor,
      @JsonKey(name: 'trip_short_name') required this.tripShortName});

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
  @override
  final List<Object> equipments;
  @override
  final String headsign;
  @override
  final String label;
  @override
  final List<Object> links;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SncfDispInfo(code: $code, color: $color, commercialMode: $commercialMode, description: $description, direction: $direction, equipments: $equipments, headsign: $headsign, label: $label, links: $links, name: $name, network: $network, physicalMode: $physicalMode, textColor: $textColor, tripShortName: $tripShortName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SncfDispInfo'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('commercialMode', commercialMode))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('direction', direction))
      ..add(DiagnosticsProperty('equipments', equipments))
      ..add(DiagnosticsProperty('headsign', headsign))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('network', network))
      ..add(DiagnosticsProperty('physicalMode', physicalMode))
      ..add(DiagnosticsProperty('textColor', textColor))
      ..add(DiagnosticsProperty('tripShortName', tripShortName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SncfDispInfo &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.commercialMode, commercialMode) ||
                other.commercialMode == commercialMode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            const DeepCollectionEquality()
                .equals(other.equipments, equipments) &&
            (identical(other.headsign, headsign) ||
                other.headsign == headsign) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.links, links) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.physicalMode, physicalMode) ||
                other.physicalMode == physicalMode) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.tripShortName, tripShortName) ||
                other.tripShortName == tripShortName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      color,
      commercialMode,
      description,
      direction,
      const DeepCollectionEquality().hash(equipments),
      headsign,
      label,
      const DeepCollectionEquality().hash(links),
      name,
      network,
      physicalMode,
      textColor,
      tripShortName);

  @JsonKey(ignore: true)
  @override
  _$SncfDispInfoCopyWith<_SncfDispInfo> get copyWith =>
      __$SncfDispInfoCopyWithImpl<_SncfDispInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfDispInfoToJson(this);
  }
}

abstract class _SncfDispInfo implements SncfDispInfo {
  const factory _SncfDispInfo(
          {required String code,
          required String color,
          @JsonKey(name: 'commercial_mode') required String commercialMode,
          required String description,
          required String direction,
          required List<Object> equipments,
          required String headsign,
          required String label,
          required List<Object> links,
          required String name,
          required String network,
          @JsonKey(name: 'physical_mode') required String physicalMode,
          @JsonKey(name: 'text_color') required String textColor,
          @JsonKey(name: 'trip_short_name') required String tripShortName}) =
      _$_SncfDispInfo;

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
  _$SncfDispInfoCopyWith<_SncfDispInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
