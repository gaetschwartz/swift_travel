// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of switzerland_navigation_api;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TriasLocation {
  String get stopPointName => throw _privateConstructorUsedError;
  String get stopPointRef => throw _privateConstructorUsedError;
  TriasGeoPosition get geoPosition => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;
  List<TriasPtMode> get modes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasLocationCopyWith<TriasLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasLocationCopyWith<$Res> {
  factory $TriasLocationCopyWith(
          TriasLocation value, $Res Function(TriasLocation) then) =
      _$TriasLocationCopyWithImpl<$Res, TriasLocation>;
  @useResult
  $Res call(
      {String stopPointName,
      String stopPointRef,
      TriasGeoPosition geoPosition,
      bool complete,
      double probability,
      List<TriasPtMode> modes});

  $TriasGeoPositionCopyWith<$Res> get geoPosition;
}

/// @nodoc
class _$TriasLocationCopyWithImpl<$Res, $Val extends TriasLocation>
    implements $TriasLocationCopyWith<$Res> {
  _$TriasLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointName = null,
    Object? stopPointRef = null,
    Object? geoPosition = null,
    Object? complete = null,
    Object? probability = null,
    Object? modes = null,
  }) {
    return _then(_value.copyWith(
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      geoPosition: null == geoPosition
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as TriasGeoPosition,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
      modes: null == modes
          ? _value.modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasPtMode>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasGeoPositionCopyWith<$Res> get geoPosition {
    return $TriasGeoPositionCopyWith<$Res>(_value.geoPosition, (value) {
      return _then(_value.copyWith(geoPosition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TriasLocationCopyWith<$Res>
    implements $TriasLocationCopyWith<$Res> {
  factory _$$_TriasLocationCopyWith(
          _$_TriasLocation value, $Res Function(_$_TriasLocation) then) =
      __$$_TriasLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stopPointName,
      String stopPointRef,
      TriasGeoPosition geoPosition,
      bool complete,
      double probability,
      List<TriasPtMode> modes});

  @override
  $TriasGeoPositionCopyWith<$Res> get geoPosition;
}

/// @nodoc
class __$$_TriasLocationCopyWithImpl<$Res>
    extends _$TriasLocationCopyWithImpl<$Res, _$_TriasLocation>
    implements _$$_TriasLocationCopyWith<$Res> {
  __$$_TriasLocationCopyWithImpl(
      _$_TriasLocation _value, $Res Function(_$_TriasLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointName = null,
    Object? stopPointRef = null,
    Object? geoPosition = null,
    Object? complete = null,
    Object? probability = null,
    Object? modes = null,
  }) {
    return _then(_$_TriasLocation(
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      geoPosition: null == geoPosition
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as TriasGeoPosition,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
      modes: null == modes
          ? _value._modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasPtMode>,
    ));
  }
}

/// @nodoc

class _$_TriasLocation extends _TriasLocation {
  const _$_TriasLocation(
      {required this.stopPointName,
      required this.stopPointRef,
      required this.geoPosition,
      required this.complete,
      this.probability = 1.0,
      final List<TriasPtMode> modes = const <TriasPtMode>[]})
      : _modes = modes,
        super._();

  @override
  final String stopPointName;
  @override
  final String stopPointRef;
  @override
  final TriasGeoPosition geoPosition;
  @override
  final bool complete;
  @override
  @JsonKey()
  final double probability;
  final List<TriasPtMode> _modes;
  @override
  @JsonKey()
  List<TriasPtMode> get modes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modes);
  }

  @override
  String toString() {
    return 'TriasLocation(stopPointName: $stopPointName, stopPointRef: $stopPointRef, geoPosition: $geoPosition, complete: $complete, probability: $probability, modes: $modes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasLocation &&
            (identical(other.stopPointName, stopPointName) ||
                other.stopPointName == stopPointName) &&
            (identical(other.stopPointRef, stopPointRef) ||
                other.stopPointRef == stopPointRef) &&
            (identical(other.geoPosition, geoPosition) ||
                other.geoPosition == geoPosition) &&
            (identical(other.complete, complete) ||
                other.complete == complete) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            const DeepCollectionEquality().equals(other._modes, _modes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stopPointName,
      stopPointRef,
      geoPosition,
      complete,
      probability,
      const DeepCollectionEquality().hash(_modes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasLocationCopyWith<_$_TriasLocation> get copyWith =>
      __$$_TriasLocationCopyWithImpl<_$_TriasLocation>(this, _$identity);
}

abstract class _TriasLocation extends TriasLocation {
  const factory _TriasLocation(
      {required final String stopPointName,
      required final String stopPointRef,
      required final TriasGeoPosition geoPosition,
      required final bool complete,
      final double probability,
      final List<TriasPtMode> modes}) = _$_TriasLocation;
  const _TriasLocation._() : super._();

  @override
  String get stopPointName;
  @override
  String get stopPointRef;
  @override
  TriasGeoPosition get geoPosition;
  @override
  bool get complete;
  @override
  double get probability;
  @override
  List<TriasPtMode> get modes;
  @override
  @JsonKey(ignore: true)
  _$$_TriasLocationCopyWith<_$_TriasLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasPtMode {
  String get mode => throw _privateConstructorUsedError;
  String? get submode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasPtModeCopyWith<TriasPtMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasPtModeCopyWith<$Res> {
  factory $TriasPtModeCopyWith(
          TriasPtMode value, $Res Function(TriasPtMode) then) =
      _$TriasPtModeCopyWithImpl<$Res, TriasPtMode>;
  @useResult
  $Res call({String mode, String? submode});
}

/// @nodoc
class _$TriasPtModeCopyWithImpl<$Res, $Val extends TriasPtMode>
    implements $TriasPtModeCopyWith<$Res> {
  _$TriasPtModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? submode = freezed,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode: freezed == submode
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TriasPtModeCopyWith<$Res>
    implements $TriasPtModeCopyWith<$Res> {
  factory _$$_TriasPtModeCopyWith(
          _$_TriasPtMode value, $Res Function(_$_TriasPtMode) then) =
      __$$_TriasPtModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, String? submode});
}

/// @nodoc
class __$$_TriasPtModeCopyWithImpl<$Res>
    extends _$TriasPtModeCopyWithImpl<$Res, _$_TriasPtMode>
    implements _$$_TriasPtModeCopyWith<$Res> {
  __$$_TriasPtModeCopyWithImpl(
      _$_TriasPtMode _value, $Res Function(_$_TriasPtMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? submode = freezed,
  }) {
    return _then(_$_TriasPtMode(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == submode
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TriasPtMode implements _TriasPtMode {
  const _$_TriasPtMode(this.mode, this.submode);

  @override
  final String mode;
  @override
  final String? submode;

  @override
  String toString() {
    return 'TriasPtMode(mode: $mode, submode: $submode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasPtMode &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.submode, submode) || other.submode == submode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, submode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasPtModeCopyWith<_$_TriasPtMode> get copyWith =>
      __$$_TriasPtModeCopyWithImpl<_$_TriasPtMode>(this, _$identity);
}

abstract class _TriasPtMode implements TriasPtMode {
  const factory _TriasPtMode(final String mode, final String? submode) =
      _$_TriasPtMode;

  @override
  String get mode;
  @override
  String? get submode;
  @override
  @JsonKey(ignore: true)
  _$$_TriasPtModeCopyWith<_$_TriasPtMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasStationBoard {
  Stop get stop => throw _privateConstructorUsedError;
  TriasService get service => throw _privateConstructorUsedError;
  List<TriasPreviousCall> get previousCalls =>
      throw _privateConstructorUsedError;
  TriasThisCall get thisCall => throw _privateConstructorUsedError;
  List<TriasOnwardCall> get onwardCalls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasStationBoardCopyWith<TriasStationBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasStationBoardCopyWith<$Res> {
  factory $TriasStationBoardCopyWith(
          TriasStationBoard value, $Res Function(TriasStationBoard) then) =
      _$TriasStationBoardCopyWithImpl<$Res, TriasStationBoard>;
  @useResult
  $Res call(
      {Stop stop,
      TriasService service,
      List<TriasPreviousCall> previousCalls,
      TriasThisCall thisCall,
      List<TriasOnwardCall> onwardCalls});

  $TriasServiceCopyWith<$Res> get service;
  $TriasThisCallCopyWith<$Res> get thisCall;
}

/// @nodoc
class _$TriasStationBoardCopyWithImpl<$Res, $Val extends TriasStationBoard>
    implements $TriasStationBoardCopyWith<$Res> {
  _$TriasStationBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? service = null,
    Object? previousCalls = null,
    Object? thisCall = null,
    Object? onwardCalls = null,
  }) {
    return _then(_value.copyWith(
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as TriasService,
      previousCalls: null == previousCalls
          ? _value.previousCalls
          : previousCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasPreviousCall>,
      thisCall: null == thisCall
          ? _value.thisCall
          : thisCall // ignore: cast_nullable_to_non_nullable
              as TriasThisCall,
      onwardCalls: null == onwardCalls
          ? _value.onwardCalls
          : onwardCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasOnwardCall>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasServiceCopyWith<$Res> get service {
    return $TriasServiceCopyWith<$Res>(_value.service, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasThisCallCopyWith<$Res> get thisCall {
    return $TriasThisCallCopyWith<$Res>(_value.thisCall, (value) {
      return _then(_value.copyWith(thisCall: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TriasStationBoardCopyWith<$Res>
    implements $TriasStationBoardCopyWith<$Res> {
  factory _$$_TriasStationBoardCopyWith(_$_TriasStationBoard value,
          $Res Function(_$_TriasStationBoard) then) =
      __$$_TriasStationBoardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Stop stop,
      TriasService service,
      List<TriasPreviousCall> previousCalls,
      TriasThisCall thisCall,
      List<TriasOnwardCall> onwardCalls});

  @override
  $TriasServiceCopyWith<$Res> get service;
  @override
  $TriasThisCallCopyWith<$Res> get thisCall;
}

/// @nodoc
class __$$_TriasStationBoardCopyWithImpl<$Res>
    extends _$TriasStationBoardCopyWithImpl<$Res, _$_TriasStationBoard>
    implements _$$_TriasStationBoardCopyWith<$Res> {
  __$$_TriasStationBoardCopyWithImpl(
      _$_TriasStationBoard _value, $Res Function(_$_TriasStationBoard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? service = null,
    Object? previousCalls = null,
    Object? thisCall = null,
    Object? onwardCalls = null,
  }) {
    return _then(_$_TriasStationBoard(
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as TriasService,
      previousCalls: null == previousCalls
          ? _value._previousCalls
          : previousCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasPreviousCall>,
      thisCall: null == thisCall
          ? _value.thisCall
          : thisCall // ignore: cast_nullable_to_non_nullable
              as TriasThisCall,
      onwardCalls: null == onwardCalls
          ? _value._onwardCalls
          : onwardCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasOnwardCall>,
    ));
  }
}

/// @nodoc

class _$_TriasStationBoard extends _TriasStationBoard {
  const _$_TriasStationBoard(
      {required this.stop,
      required this.service,
      required final List<TriasPreviousCall> previousCalls,
      required this.thisCall,
      required final List<TriasOnwardCall> onwardCalls})
      : _previousCalls = previousCalls,
        _onwardCalls = onwardCalls,
        super._();

  @override
  final Stop stop;
  @override
  final TriasService service;
  final List<TriasPreviousCall> _previousCalls;
  @override
  List<TriasPreviousCall> get previousCalls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousCalls);
  }

  @override
  final TriasThisCall thisCall;
  final List<TriasOnwardCall> _onwardCalls;
  @override
  List<TriasOnwardCall> get onwardCalls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onwardCalls);
  }

  @override
  String toString() {
    return 'TriasStationBoard(stop: $stop, service: $service, previousCalls: $previousCalls, thisCall: $thisCall, onwardCalls: $onwardCalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasStationBoard &&
            (identical(other.stop, stop) || other.stop == stop) &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality()
                .equals(other._previousCalls, _previousCalls) &&
            (identical(other.thisCall, thisCall) ||
                other.thisCall == thisCall) &&
            const DeepCollectionEquality()
                .equals(other._onwardCalls, _onwardCalls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stop,
      service,
      const DeepCollectionEquality().hash(_previousCalls),
      thisCall,
      const DeepCollectionEquality().hash(_onwardCalls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasStationBoardCopyWith<_$_TriasStationBoard> get copyWith =>
      __$$_TriasStationBoardCopyWithImpl<_$_TriasStationBoard>(
          this, _$identity);
}

abstract class _TriasStationBoard extends TriasStationBoard {
  const factory _TriasStationBoard(
      {required final Stop stop,
      required final TriasService service,
      required final List<TriasPreviousCall> previousCalls,
      required final TriasThisCall thisCall,
      required final List<TriasOnwardCall> onwardCalls}) = _$_TriasStationBoard;
  const _TriasStationBoard._() : super._();

  @override
  Stop get stop;
  @override
  TriasService get service;
  @override
  List<TriasPreviousCall> get previousCalls;
  @override
  TriasThisCall get thisCall;
  @override
  List<TriasOnwardCall> get onwardCalls;
  @override
  @JsonKey(ignore: true)
  _$$_TriasStationBoardCopyWith<_$_TriasStationBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasService {
  String get operatingDayRef => throw _privateConstructorUsedError;
  String get journeyRef => throw _privateConstructorUsedError;
  String get lineRef => throw _privateConstructorUsedError;
  String get directionRef => throw _privateConstructorUsedError;
  List<TriasMode> get modes => throw _privateConstructorUsedError;
  List<TriasAttribute> get attributes => throw _privateConstructorUsedError;
  String get publishedLineName => throw _privateConstructorUsedError;
  String get operatorRef => throw _privateConstructorUsedError;
  String get originStopPointRef => throw _privateConstructorUsedError;
  String get originText => throw _privateConstructorUsedError;
  String get destinationStopPointRef => throw _privateConstructorUsedError;
  String get destinationText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasServiceCopyWith<TriasService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasServiceCopyWith<$Res> {
  factory $TriasServiceCopyWith(
          TriasService value, $Res Function(TriasService) then) =
      _$TriasServiceCopyWithImpl<$Res, TriasService>;
  @useResult
  $Res call(
      {String operatingDayRef,
      String journeyRef,
      String lineRef,
      String directionRef,
      List<TriasMode> modes,
      List<TriasAttribute> attributes,
      String publishedLineName,
      String operatorRef,
      String originStopPointRef,
      String originText,
      String destinationStopPointRef,
      String destinationText});
}

/// @nodoc
class _$TriasServiceCopyWithImpl<$Res, $Val extends TriasService>
    implements $TriasServiceCopyWith<$Res> {
  _$TriasServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatingDayRef = null,
    Object? journeyRef = null,
    Object? lineRef = null,
    Object? directionRef = null,
    Object? modes = null,
    Object? attributes = null,
    Object? publishedLineName = null,
    Object? operatorRef = null,
    Object? originStopPointRef = null,
    Object? originText = null,
    Object? destinationStopPointRef = null,
    Object? destinationText = null,
  }) {
    return _then(_value.copyWith(
      operatingDayRef: null == operatingDayRef
          ? _value.operatingDayRef
          : operatingDayRef // ignore: cast_nullable_to_non_nullable
              as String,
      journeyRef: null == journeyRef
          ? _value.journeyRef
          : journeyRef // ignore: cast_nullable_to_non_nullable
              as String,
      lineRef: null == lineRef
          ? _value.lineRef
          : lineRef // ignore: cast_nullable_to_non_nullable
              as String,
      directionRef: null == directionRef
          ? _value.directionRef
          : directionRef // ignore: cast_nullable_to_non_nullable
              as String,
      modes: null == modes
          ? _value.modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasMode>,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<TriasAttribute>,
      publishedLineName: null == publishedLineName
          ? _value.publishedLineName
          : publishedLineName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorRef: null == operatorRef
          ? _value.operatorRef
          : operatorRef // ignore: cast_nullable_to_non_nullable
              as String,
      originStopPointRef: null == originStopPointRef
          ? _value.originStopPointRef
          : originStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      originText: null == originText
          ? _value.originText
          : originText // ignore: cast_nullable_to_non_nullable
              as String,
      destinationStopPointRef: null == destinationStopPointRef
          ? _value.destinationStopPointRef
          : destinationStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      destinationText: null == destinationText
          ? _value.destinationText
          : destinationText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TriasServiceCopyWith<$Res>
    implements $TriasServiceCopyWith<$Res> {
  factory _$$_TriasServiceCopyWith(
          _$_TriasService value, $Res Function(_$_TriasService) then) =
      __$$_TriasServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String operatingDayRef,
      String journeyRef,
      String lineRef,
      String directionRef,
      List<TriasMode> modes,
      List<TriasAttribute> attributes,
      String publishedLineName,
      String operatorRef,
      String originStopPointRef,
      String originText,
      String destinationStopPointRef,
      String destinationText});
}

/// @nodoc
class __$$_TriasServiceCopyWithImpl<$Res>
    extends _$TriasServiceCopyWithImpl<$Res, _$_TriasService>
    implements _$$_TriasServiceCopyWith<$Res> {
  __$$_TriasServiceCopyWithImpl(
      _$_TriasService _value, $Res Function(_$_TriasService) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatingDayRef = null,
    Object? journeyRef = null,
    Object? lineRef = null,
    Object? directionRef = null,
    Object? modes = null,
    Object? attributes = null,
    Object? publishedLineName = null,
    Object? operatorRef = null,
    Object? originStopPointRef = null,
    Object? originText = null,
    Object? destinationStopPointRef = null,
    Object? destinationText = null,
  }) {
    return _then(_$_TriasService(
      operatingDayRef: null == operatingDayRef
          ? _value.operatingDayRef
          : operatingDayRef // ignore: cast_nullable_to_non_nullable
              as String,
      journeyRef: null == journeyRef
          ? _value.journeyRef
          : journeyRef // ignore: cast_nullable_to_non_nullable
              as String,
      lineRef: null == lineRef
          ? _value.lineRef
          : lineRef // ignore: cast_nullable_to_non_nullable
              as String,
      directionRef: null == directionRef
          ? _value.directionRef
          : directionRef // ignore: cast_nullable_to_non_nullable
              as String,
      modes: null == modes
          ? _value._modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasMode>,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<TriasAttribute>,
      publishedLineName: null == publishedLineName
          ? _value.publishedLineName
          : publishedLineName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorRef: null == operatorRef
          ? _value.operatorRef
          : operatorRef // ignore: cast_nullable_to_non_nullable
              as String,
      originStopPointRef: null == originStopPointRef
          ? _value.originStopPointRef
          : originStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      originText: null == originText
          ? _value.originText
          : originText // ignore: cast_nullable_to_non_nullable
              as String,
      destinationStopPointRef: null == destinationStopPointRef
          ? _value.destinationStopPointRef
          : destinationStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      destinationText: null == destinationText
          ? _value.destinationText
          : destinationText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TriasService implements _TriasService {
  const _$_TriasService(
      {required this.operatingDayRef,
      required this.journeyRef,
      required this.lineRef,
      required this.directionRef,
      required final List<TriasMode> modes,
      required final List<TriasAttribute> attributes,
      required this.publishedLineName,
      required this.operatorRef,
      required this.originStopPointRef,
      required this.originText,
      required this.destinationStopPointRef,
      required this.destinationText})
      : _modes = modes,
        _attributes = attributes;

  @override
  final String operatingDayRef;
  @override
  final String journeyRef;
  @override
  final String lineRef;
  @override
  final String directionRef;
  final List<TriasMode> _modes;
  @override
  List<TriasMode> get modes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modes);
  }

  final List<TriasAttribute> _attributes;
  @override
  List<TriasAttribute> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributes);
  }

  @override
  final String publishedLineName;
  @override
  final String operatorRef;
  @override
  final String originStopPointRef;
  @override
  final String originText;
  @override
  final String destinationStopPointRef;
  @override
  final String destinationText;

  @override
  String toString() {
    return 'TriasService(operatingDayRef: $operatingDayRef, journeyRef: $journeyRef, lineRef: $lineRef, directionRef: $directionRef, modes: $modes, attributes: $attributes, publishedLineName: $publishedLineName, operatorRef: $operatorRef, originStopPointRef: $originStopPointRef, originText: $originText, destinationStopPointRef: $destinationStopPointRef, destinationText: $destinationText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasService &&
            (identical(other.operatingDayRef, operatingDayRef) ||
                other.operatingDayRef == operatingDayRef) &&
            (identical(other.journeyRef, journeyRef) ||
                other.journeyRef == journeyRef) &&
            (identical(other.lineRef, lineRef) || other.lineRef == lineRef) &&
            (identical(other.directionRef, directionRef) ||
                other.directionRef == directionRef) &&
            const DeepCollectionEquality().equals(other._modes, _modes) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.publishedLineName, publishedLineName) ||
                other.publishedLineName == publishedLineName) &&
            (identical(other.operatorRef, operatorRef) ||
                other.operatorRef == operatorRef) &&
            (identical(other.originStopPointRef, originStopPointRef) ||
                other.originStopPointRef == originStopPointRef) &&
            (identical(other.originText, originText) ||
                other.originText == originText) &&
            (identical(
                    other.destinationStopPointRef, destinationStopPointRef) ||
                other.destinationStopPointRef == destinationStopPointRef) &&
            (identical(other.destinationText, destinationText) ||
                other.destinationText == destinationText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operatingDayRef,
      journeyRef,
      lineRef,
      directionRef,
      const DeepCollectionEquality().hash(_modes),
      const DeepCollectionEquality().hash(_attributes),
      publishedLineName,
      operatorRef,
      originStopPointRef,
      originText,
      destinationStopPointRef,
      destinationText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasServiceCopyWith<_$_TriasService> get copyWith =>
      __$$_TriasServiceCopyWithImpl<_$_TriasService>(this, _$identity);
}

abstract class _TriasService implements TriasService {
  const factory _TriasService(
      {required final String operatingDayRef,
      required final String journeyRef,
      required final String lineRef,
      required final String directionRef,
      required final List<TriasMode> modes,
      required final List<TriasAttribute> attributes,
      required final String publishedLineName,
      required final String operatorRef,
      required final String originStopPointRef,
      required final String originText,
      required final String destinationStopPointRef,
      required final String destinationText}) = _$_TriasService;

  @override
  String get operatingDayRef;
  @override
  String get journeyRef;
  @override
  String get lineRef;
  @override
  String get directionRef;
  @override
  List<TriasMode> get modes;
  @override
  List<TriasAttribute> get attributes;
  @override
  String get publishedLineName;
  @override
  String get operatorRef;
  @override
  String get originStopPointRef;
  @override
  String get originText;
  @override
  String get destinationStopPointRef;
  @override
  String get destinationText;
  @override
  @JsonKey(ignore: true)
  _$$_TriasServiceCopyWith<_$_TriasService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasMode {
  String get mode => throw _privateConstructorUsedError;
  String? get submode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasModeCopyWith<TriasMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasModeCopyWith<$Res> {
  factory $TriasModeCopyWith(TriasMode value, $Res Function(TriasMode) then) =
      _$TriasModeCopyWithImpl<$Res, TriasMode>;
  @useResult
  $Res call({String mode, String? submode, String? name, String? language});
}

/// @nodoc
class _$TriasModeCopyWithImpl<$Res, $Val extends TriasMode>
    implements $TriasModeCopyWith<$Res> {
  _$TriasModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? submode = freezed,
    Object? name = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode: freezed == submode
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TriasModeCopyWith<$Res> implements $TriasModeCopyWith<$Res> {
  factory _$$_TriasModeCopyWith(
          _$_TriasMode value, $Res Function(_$_TriasMode) then) =
      __$$_TriasModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, String? submode, String? name, String? language});
}

/// @nodoc
class __$$_TriasModeCopyWithImpl<$Res>
    extends _$TriasModeCopyWithImpl<$Res, _$_TriasMode>
    implements _$$_TriasModeCopyWith<$Res> {
  __$$_TriasModeCopyWithImpl(
      _$_TriasMode _value, $Res Function(_$_TriasMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? submode = freezed,
    Object? name = freezed,
    Object? language = freezed,
  }) {
    return _then(_$_TriasMode(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode: freezed == submode
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TriasMode implements _TriasMode {
  const _$_TriasMode(this.mode, {this.submode, this.name, this.language});

  @override
  final String mode;
  @override
  final String? submode;
  @override
  final String? name;
  @override
  final String? language;

  @override
  String toString() {
    return 'TriasMode(mode: $mode, submode: $submode, name: $name, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasMode &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.submode, submode) || other.submode == submode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, submode, name, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasModeCopyWith<_$_TriasMode> get copyWith =>
      __$$_TriasModeCopyWithImpl<_$_TriasMode>(this, _$identity);
}

abstract class _TriasMode implements TriasMode {
  const factory _TriasMode(final String mode,
      {final String? submode,
      final String? name,
      final String? language}) = _$_TriasMode;

  @override
  String get mode;
  @override
  String? get submode;
  @override
  String? get name;
  @override
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$_TriasModeCopyWith<_$_TriasMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasAttribute {
  String get code => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasAttributeCopyWith<TriasAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasAttributeCopyWith<$Res> {
  factory $TriasAttributeCopyWith(
          TriasAttribute value, $Res Function(TriasAttribute) then) =
      _$TriasAttributeCopyWithImpl<$Res, TriasAttribute>;
  @useResult
  $Res call({String code, String text});
}

/// @nodoc
class _$TriasAttributeCopyWithImpl<$Res, $Val extends TriasAttribute>
    implements $TriasAttributeCopyWith<$Res> {
  _$TriasAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TriasAttributeCopyWith<$Res>
    implements $TriasAttributeCopyWith<$Res> {
  factory _$$_TriasAttributeCopyWith(
          _$_TriasAttribute value, $Res Function(_$_TriasAttribute) then) =
      __$$_TriasAttributeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String text});
}

/// @nodoc
class __$$_TriasAttributeCopyWithImpl<$Res>
    extends _$TriasAttributeCopyWithImpl<$Res, _$_TriasAttribute>
    implements _$$_TriasAttributeCopyWith<$Res> {
  __$$_TriasAttributeCopyWithImpl(
      _$_TriasAttribute _value, $Res Function(_$_TriasAttribute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? text = null,
  }) {
    return _then(_$_TriasAttribute(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TriasAttribute implements _TriasAttribute {
  const _$_TriasAttribute({required this.code, required this.text});

  @override
  final String code;
  @override
  final String text;

  @override
  String toString() {
    return 'TriasAttribute(code: $code, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasAttribute &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasAttributeCopyWith<_$_TriasAttribute> get copyWith =>
      __$$_TriasAttributeCopyWithImpl<_$_TriasAttribute>(this, _$identity);
}

abstract class _TriasAttribute implements TriasAttribute {
  const factory _TriasAttribute(
      {required final String code,
      required final String text}) = _$_TriasAttribute;

  @override
  String get code;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_TriasAttributeCopyWith<_$_TriasAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasOnwardCall {
  String get stopPointRef => throw _privateConstructorUsedError;
  String get stopPointName => throw _privateConstructorUsedError;
  String get plannedBay => throw _privateConstructorUsedError;
  TriasServiceTime get serviceArrival => throw _privateConstructorUsedError;
  String get stopSeqNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasOnwardCallCopyWith<TriasOnwardCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasOnwardCallCopyWith<$Res> {
  factory $TriasOnwardCallCopyWith(
          TriasOnwardCall value, $Res Function(TriasOnwardCall) then) =
      _$TriasOnwardCallCopyWithImpl<$Res, TriasOnwardCall>;
  @useResult
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      TriasServiceTime serviceArrival,
      String stopSeqNumber});

  $TriasServiceTimeCopyWith<$Res> get serviceArrival;
}

/// @nodoc
class _$TriasOnwardCallCopyWithImpl<$Res, $Val extends TriasOnwardCall>
    implements $TriasOnwardCallCopyWith<$Res> {
  _$TriasOnwardCallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointRef = null,
    Object? stopPointName = null,
    Object? plannedBay = null,
    Object? serviceArrival = null,
    Object? stopSeqNumber = null,
  }) {
    return _then(_value.copyWith(
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: null == plannedBay
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: null == serviceArrival
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: null == stopSeqNumber
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasServiceTimeCopyWith<$Res> get serviceArrival {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceArrival, (value) {
      return _then(_value.copyWith(serviceArrival: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TriasOnwardCallCopyWith<$Res>
    implements $TriasOnwardCallCopyWith<$Res> {
  factory _$$_TriasOnwardCallCopyWith(
          _$_TriasOnwardCall value, $Res Function(_$_TriasOnwardCall) then) =
      __$$_TriasOnwardCallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      TriasServiceTime serviceArrival,
      String stopSeqNumber});

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceArrival;
}

/// @nodoc
class __$$_TriasOnwardCallCopyWithImpl<$Res>
    extends _$TriasOnwardCallCopyWithImpl<$Res, _$_TriasOnwardCall>
    implements _$$_TriasOnwardCallCopyWith<$Res> {
  __$$_TriasOnwardCallCopyWithImpl(
      _$_TriasOnwardCall _value, $Res Function(_$_TriasOnwardCall) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointRef = null,
    Object? stopPointName = null,
    Object? plannedBay = null,
    Object? serviceArrival = null,
    Object? stopSeqNumber = null,
  }) {
    return _then(_$_TriasOnwardCall(
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: null == plannedBay
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: null == serviceArrival
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: null == stopSeqNumber
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TriasOnwardCall extends _TriasOnwardCall {
  const _$_TriasOnwardCall(
      {required this.stopPointRef,
      required this.stopPointName,
      required this.plannedBay,
      required this.serviceArrival,
      required this.stopSeqNumber})
      : super._();

  @override
  final String stopPointRef;
  @override
  final String stopPointName;
  @override
  final String plannedBay;
  @override
  final TriasServiceTime serviceArrival;
  @override
  final String stopSeqNumber;

  @override
  String toString() {
    return 'TriasOnwardCall(stopPointRef: $stopPointRef, stopPointName: $stopPointName, plannedBay: $plannedBay, serviceArrival: $serviceArrival, stopSeqNumber: $stopSeqNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasOnwardCall &&
            (identical(other.stopPointRef, stopPointRef) ||
                other.stopPointRef == stopPointRef) &&
            (identical(other.stopPointName, stopPointName) ||
                other.stopPointName == stopPointName) &&
            (identical(other.plannedBay, plannedBay) ||
                other.plannedBay == plannedBay) &&
            (identical(other.serviceArrival, serviceArrival) ||
                other.serviceArrival == serviceArrival) &&
            (identical(other.stopSeqNumber, stopSeqNumber) ||
                other.stopSeqNumber == stopSeqNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stopPointRef, stopPointName,
      plannedBay, serviceArrival, stopSeqNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasOnwardCallCopyWith<_$_TriasOnwardCall> get copyWith =>
      __$$_TriasOnwardCallCopyWithImpl<_$_TriasOnwardCall>(this, _$identity);
}

abstract class _TriasOnwardCall extends TriasOnwardCall {
  const factory _TriasOnwardCall(
      {required final String stopPointRef,
      required final String stopPointName,
      required final String plannedBay,
      required final TriasServiceTime serviceArrival,
      required final String stopSeqNumber}) = _$_TriasOnwardCall;
  const _TriasOnwardCall._() : super._();

  @override
  String get stopPointRef;
  @override
  String get stopPointName;
  @override
  String get plannedBay;
  @override
  TriasServiceTime get serviceArrival;
  @override
  String get stopSeqNumber;
  @override
  @JsonKey(ignore: true)
  _$$_TriasOnwardCallCopyWith<_$_TriasOnwardCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasServiceTime {
  DateTime get timetabledTime => throw _privateConstructorUsedError;
  DateTime get estimatedTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasServiceTimeCopyWith<TriasServiceTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasServiceTimeCopyWith<$Res> {
  factory $TriasServiceTimeCopyWith(
          TriasServiceTime value, $Res Function(TriasServiceTime) then) =
      _$TriasServiceTimeCopyWithImpl<$Res, TriasServiceTime>;
  @useResult
  $Res call({DateTime timetabledTime, DateTime estimatedTime});
}

/// @nodoc
class _$TriasServiceTimeCopyWithImpl<$Res, $Val extends TriasServiceTime>
    implements $TriasServiceTimeCopyWith<$Res> {
  _$TriasServiceTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetabledTime = null,
    Object? estimatedTime = null,
  }) {
    return _then(_value.copyWith(
      timetabledTime: null == timetabledTime
          ? _value.timetabledTime
          : timetabledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedTime: null == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TriasServiceTimeCopyWith<$Res>
    implements $TriasServiceTimeCopyWith<$Res> {
  factory _$$_TriasServiceTimeCopyWith(
          _$_TriasServiceTime value, $Res Function(_$_TriasServiceTime) then) =
      __$$_TriasServiceTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timetabledTime, DateTime estimatedTime});
}

/// @nodoc
class __$$_TriasServiceTimeCopyWithImpl<$Res>
    extends _$TriasServiceTimeCopyWithImpl<$Res, _$_TriasServiceTime>
    implements _$$_TriasServiceTimeCopyWith<$Res> {
  __$$_TriasServiceTimeCopyWithImpl(
      _$_TriasServiceTime _value, $Res Function(_$_TriasServiceTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetabledTime = null,
    Object? estimatedTime = null,
  }) {
    return _then(_$_TriasServiceTime(
      timetabledTime: null == timetabledTime
          ? _value.timetabledTime
          : timetabledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedTime: null == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TriasServiceTime extends _TriasServiceTime {
  const _$_TriasServiceTime(
      {required this.timetabledTime, required this.estimatedTime})
      : super._();

  @override
  final DateTime timetabledTime;
  @override
  final DateTime estimatedTime;

  @override
  String toString() {
    return 'TriasServiceTime(timetabledTime: $timetabledTime, estimatedTime: $estimatedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasServiceTime &&
            (identical(other.timetabledTime, timetabledTime) ||
                other.timetabledTime == timetabledTime) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timetabledTime, estimatedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasServiceTimeCopyWith<_$_TriasServiceTime> get copyWith =>
      __$$_TriasServiceTimeCopyWithImpl<_$_TriasServiceTime>(this, _$identity);
}

abstract class _TriasServiceTime extends TriasServiceTime {
  const factory _TriasServiceTime(
      {required final DateTime timetabledTime,
      required final DateTime estimatedTime}) = _$_TriasServiceTime;
  const _TriasServiceTime._() : super._();

  @override
  DateTime get timetabledTime;
  @override
  DateTime get estimatedTime;
  @override
  @JsonKey(ignore: true)
  _$$_TriasServiceTimeCopyWith<_$_TriasServiceTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasPreviousCall {
  String get stopPointRef => throw _privateConstructorUsedError;
  String get stopPointName => throw _privateConstructorUsedError;
  String get plannedBay => throw _privateConstructorUsedError;
  TriasServiceTime get serviceArrival => throw _privateConstructorUsedError;
  TriasServiceTime get serviceDeparture => throw _privateConstructorUsedError;
  String get stopSeqNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasPreviousCallCopyWith<TriasPreviousCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasPreviousCallCopyWith<$Res> {
  factory $TriasPreviousCallCopyWith(
          TriasPreviousCall value, $Res Function(TriasPreviousCall) then) =
      _$TriasPreviousCallCopyWithImpl<$Res, TriasPreviousCall>;
  @useResult
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      TriasServiceTime serviceArrival,
      TriasServiceTime serviceDeparture,
      String stopSeqNumber});

  $TriasServiceTimeCopyWith<$Res> get serviceArrival;
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture;
}

/// @nodoc
class _$TriasPreviousCallCopyWithImpl<$Res, $Val extends TriasPreviousCall>
    implements $TriasPreviousCallCopyWith<$Res> {
  _$TriasPreviousCallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointRef = null,
    Object? stopPointName = null,
    Object? plannedBay = null,
    Object? serviceArrival = null,
    Object? serviceDeparture = null,
    Object? stopSeqNumber = null,
  }) {
    return _then(_value.copyWith(
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: null == plannedBay
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: null == serviceArrival
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      serviceDeparture: null == serviceDeparture
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: null == stopSeqNumber
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasServiceTimeCopyWith<$Res> get serviceArrival {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceArrival, (value) {
      return _then(_value.copyWith(serviceArrival: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceDeparture, (value) {
      return _then(_value.copyWith(serviceDeparture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TriasPreviousCallCopyWith<$Res>
    implements $TriasPreviousCallCopyWith<$Res> {
  factory _$$_TriasPreviousCallCopyWith(_$_TriasPreviousCall value,
          $Res Function(_$_TriasPreviousCall) then) =
      __$$_TriasPreviousCallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      TriasServiceTime serviceArrival,
      TriasServiceTime serviceDeparture,
      String stopSeqNumber});

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceArrival;
  @override
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture;
}

/// @nodoc
class __$$_TriasPreviousCallCopyWithImpl<$Res>
    extends _$TriasPreviousCallCopyWithImpl<$Res, _$_TriasPreviousCall>
    implements _$$_TriasPreviousCallCopyWith<$Res> {
  __$$_TriasPreviousCallCopyWithImpl(
      _$_TriasPreviousCall _value, $Res Function(_$_TriasPreviousCall) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointRef = null,
    Object? stopPointName = null,
    Object? plannedBay = null,
    Object? serviceArrival = null,
    Object? serviceDeparture = null,
    Object? stopSeqNumber = null,
  }) {
    return _then(_$_TriasPreviousCall(
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: null == plannedBay
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: null == serviceArrival
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      serviceDeparture: null == serviceDeparture
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: null == stopSeqNumber
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TriasPreviousCall extends _TriasPreviousCall {
  const _$_TriasPreviousCall(
      {required this.stopPointRef,
      required this.stopPointName,
      required this.plannedBay,
      required this.serviceArrival,
      required this.serviceDeparture,
      required this.stopSeqNumber})
      : super._();

  @override
  final String stopPointRef;
  @override
  final String stopPointName;
  @override
  final String plannedBay;
  @override
  final TriasServiceTime serviceArrival;
  @override
  final TriasServiceTime serviceDeparture;
  @override
  final String stopSeqNumber;

  @override
  String toString() {
    return 'TriasPreviousCall(stopPointRef: $stopPointRef, stopPointName: $stopPointName, plannedBay: $plannedBay, serviceArrival: $serviceArrival, serviceDeparture: $serviceDeparture, stopSeqNumber: $stopSeqNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasPreviousCall &&
            (identical(other.stopPointRef, stopPointRef) ||
                other.stopPointRef == stopPointRef) &&
            (identical(other.stopPointName, stopPointName) ||
                other.stopPointName == stopPointName) &&
            (identical(other.plannedBay, plannedBay) ||
                other.plannedBay == plannedBay) &&
            (identical(other.serviceArrival, serviceArrival) ||
                other.serviceArrival == serviceArrival) &&
            (identical(other.serviceDeparture, serviceDeparture) ||
                other.serviceDeparture == serviceDeparture) &&
            (identical(other.stopSeqNumber, stopSeqNumber) ||
                other.stopSeqNumber == stopSeqNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stopPointRef, stopPointName,
      plannedBay, serviceArrival, serviceDeparture, stopSeqNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasPreviousCallCopyWith<_$_TriasPreviousCall> get copyWith =>
      __$$_TriasPreviousCallCopyWithImpl<_$_TriasPreviousCall>(
          this, _$identity);
}

abstract class _TriasPreviousCall extends TriasPreviousCall {
  const factory _TriasPreviousCall(
      {required final String stopPointRef,
      required final String stopPointName,
      required final String plannedBay,
      required final TriasServiceTime serviceArrival,
      required final TriasServiceTime serviceDeparture,
      required final String stopSeqNumber}) = _$_TriasPreviousCall;
  const _TriasPreviousCall._() : super._();

  @override
  String get stopPointRef;
  @override
  String get stopPointName;
  @override
  String get plannedBay;
  @override
  TriasServiceTime get serviceArrival;
  @override
  TriasServiceTime get serviceDeparture;
  @override
  String get stopSeqNumber;
  @override
  @JsonKey(ignore: true)
  _$$_TriasPreviousCallCopyWith<_$_TriasPreviousCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasThisCall {
  String get stopPointRef => throw _privateConstructorUsedError;
  String get stopPointName => throw _privateConstructorUsedError;
  String get plannedBay => throw _privateConstructorUsedError;
  String get estimatedBay => throw _privateConstructorUsedError;
  TriasServiceTime get serviceDeparture => throw _privateConstructorUsedError;
  String get stopSeqNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasThisCallCopyWith<TriasThisCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasThisCallCopyWith<$Res> {
  factory $TriasThisCallCopyWith(
          TriasThisCall value, $Res Function(TriasThisCall) then) =
      _$TriasThisCallCopyWithImpl<$Res, TriasThisCall>;
  @useResult
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      String estimatedBay,
      TriasServiceTime serviceDeparture,
      String stopSeqNumber});

  $TriasServiceTimeCopyWith<$Res> get serviceDeparture;
}

/// @nodoc
class _$TriasThisCallCopyWithImpl<$Res, $Val extends TriasThisCall>
    implements $TriasThisCallCopyWith<$Res> {
  _$TriasThisCallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointRef = null,
    Object? stopPointName = null,
    Object? plannedBay = null,
    Object? estimatedBay = null,
    Object? serviceDeparture = null,
    Object? stopSeqNumber = null,
  }) {
    return _then(_value.copyWith(
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: null == plannedBay
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedBay: null == estimatedBay
          ? _value.estimatedBay
          : estimatedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDeparture: null == serviceDeparture
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: null == stopSeqNumber
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceDeparture, (value) {
      return _then(_value.copyWith(serviceDeparture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TriasThisCallCopyWith<$Res>
    implements $TriasThisCallCopyWith<$Res> {
  factory _$$_TriasThisCallCopyWith(
          _$_TriasThisCall value, $Res Function(_$_TriasThisCall) then) =
      __$$_TriasThisCallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      String estimatedBay,
      TriasServiceTime serviceDeparture,
      String stopSeqNumber});

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture;
}

/// @nodoc
class __$$_TriasThisCallCopyWithImpl<$Res>
    extends _$TriasThisCallCopyWithImpl<$Res, _$_TriasThisCall>
    implements _$$_TriasThisCallCopyWith<$Res> {
  __$$_TriasThisCallCopyWithImpl(
      _$_TriasThisCall _value, $Res Function(_$_TriasThisCall) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointRef = null,
    Object? stopPointName = null,
    Object? plannedBay = null,
    Object? estimatedBay = null,
    Object? serviceDeparture = null,
    Object? stopSeqNumber = null,
  }) {
    return _then(_$_TriasThisCall(
      stopPointRef: null == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: null == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: null == plannedBay
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedBay: null == estimatedBay
          ? _value.estimatedBay
          : estimatedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDeparture: null == serviceDeparture
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: null == stopSeqNumber
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TriasThisCall extends _TriasThisCall {
  const _$_TriasThisCall(
      {required this.stopPointRef,
      required this.stopPointName,
      required this.plannedBay,
      required this.estimatedBay,
      required this.serviceDeparture,
      required this.stopSeqNumber})
      : super._();

  @override
  final String stopPointRef;
  @override
  final String stopPointName;
  @override
  final String plannedBay;
  @override
  final String estimatedBay;
  @override
  final TriasServiceTime serviceDeparture;
  @override
  final String stopSeqNumber;

  @override
  String toString() {
    return 'TriasThisCall(stopPointRef: $stopPointRef, stopPointName: $stopPointName, plannedBay: $plannedBay, estimatedBay: $estimatedBay, serviceDeparture: $serviceDeparture, stopSeqNumber: $stopSeqNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasThisCall &&
            (identical(other.stopPointRef, stopPointRef) ||
                other.stopPointRef == stopPointRef) &&
            (identical(other.stopPointName, stopPointName) ||
                other.stopPointName == stopPointName) &&
            (identical(other.plannedBay, plannedBay) ||
                other.plannedBay == plannedBay) &&
            (identical(other.estimatedBay, estimatedBay) ||
                other.estimatedBay == estimatedBay) &&
            (identical(other.serviceDeparture, serviceDeparture) ||
                other.serviceDeparture == serviceDeparture) &&
            (identical(other.stopSeqNumber, stopSeqNumber) ||
                other.stopSeqNumber == stopSeqNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stopPointRef, stopPointName,
      plannedBay, estimatedBay, serviceDeparture, stopSeqNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasThisCallCopyWith<_$_TriasThisCall> get copyWith =>
      __$$_TriasThisCallCopyWithImpl<_$_TriasThisCall>(this, _$identity);
}

abstract class _TriasThisCall extends TriasThisCall {
  const factory _TriasThisCall(
      {required final String stopPointRef,
      required final String stopPointName,
      required final String plannedBay,
      required final String estimatedBay,
      required final TriasServiceTime serviceDeparture,
      required final String stopSeqNumber}) = _$_TriasThisCall;
  const _TriasThisCall._() : super._();

  @override
  String get stopPointRef;
  @override
  String get stopPointName;
  @override
  String get plannedBay;
  @override
  String get estimatedBay;
  @override
  TriasServiceTime get serviceDeparture;
  @override
  String get stopSeqNumber;
  @override
  @JsonKey(ignore: true)
  _$$_TriasThisCallCopyWith<_$_TriasThisCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TriasGeoPosition {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriasGeoPositionCopyWith<TriasGeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriasGeoPositionCopyWith<$Res> {
  factory $TriasGeoPositionCopyWith(
          TriasGeoPosition value, $Res Function(TriasGeoPosition) then) =
      _$TriasGeoPositionCopyWithImpl<$Res, TriasGeoPosition>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$TriasGeoPositionCopyWithImpl<$Res, $Val extends TriasGeoPosition>
    implements $TriasGeoPositionCopyWith<$Res> {
  _$TriasGeoPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TriasGeoPositionCopyWith<$Res>
    implements $TriasGeoPositionCopyWith<$Res> {
  factory _$$_TriasGeoPositionCopyWith(
          _$_TriasGeoPosition value, $Res Function(_$_TriasGeoPosition) then) =
      __$$_TriasGeoPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$_TriasGeoPositionCopyWithImpl<$Res>
    extends _$TriasGeoPositionCopyWithImpl<$Res, _$_TriasGeoPosition>
    implements _$$_TriasGeoPositionCopyWith<$Res> {
  __$$_TriasGeoPositionCopyWithImpl(
      _$_TriasGeoPosition _value, $Res Function(_$_TriasGeoPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_TriasGeoPosition(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_TriasGeoPosition implements _TriasGeoPosition {
  const _$_TriasGeoPosition({required this.latitude, required this.longitude});

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'TriasGeoPosition(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriasGeoPosition &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriasGeoPositionCopyWith<_$_TriasGeoPosition> get copyWith =>
      __$$_TriasGeoPositionCopyWithImpl<_$_TriasGeoPosition>(this, _$identity);
}

abstract class _TriasGeoPosition implements TriasGeoPosition {
  const factory _TriasGeoPosition(
      {required final double latitude,
      required final double longitude}) = _$_TriasGeoPosition;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_TriasGeoPositionCopyWith<_$_TriasGeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
