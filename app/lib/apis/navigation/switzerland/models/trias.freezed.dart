// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trias.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TriasLocation {
  String? get stopPointName => throw _privateConstructorUsedError;
  String? get stopPointRef => throw _privateConstructorUsedError;
  TriasGeoPosition get geoPosition => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  double? get probability => throw _privateConstructorUsedError;
  List<TriasPtMode> get modes => throw _privateConstructorUsedError;
  double? get dist => throw _privateConstructorUsedError;

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
      {String? stopPointName,
      String? stopPointRef,
      TriasGeoPosition geoPosition,
      bool complete,
      double? probability,
      List<TriasPtMode> modes,
      double? dist});

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
    Object? stopPointName = freezed,
    Object? stopPointRef = freezed,
    Object? geoPosition = null,
    Object? complete = null,
    Object? probability = freezed,
    Object? modes = null,
    Object? dist = freezed,
  }) {
    return _then(_value.copyWith(
      stopPointName: freezed == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String?,
      stopPointRef: freezed == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String?,
      geoPosition: null == geoPosition
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as TriasGeoPosition,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double?,
      modes: null == modes
          ? _value.modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasPtMode>,
      dist: freezed == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$TriasLocationImplCopyWith<$Res>
    implements $TriasLocationCopyWith<$Res> {
  factory _$$TriasLocationImplCopyWith(
          _$TriasLocationImpl value, $Res Function(_$TriasLocationImpl) then) =
      __$$TriasLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? stopPointName,
      String? stopPointRef,
      TriasGeoPosition geoPosition,
      bool complete,
      double? probability,
      List<TriasPtMode> modes,
      double? dist});

  @override
  $TriasGeoPositionCopyWith<$Res> get geoPosition;
}

/// @nodoc
class __$$TriasLocationImplCopyWithImpl<$Res>
    extends _$TriasLocationCopyWithImpl<$Res, _$TriasLocationImpl>
    implements _$$TriasLocationImplCopyWith<$Res> {
  __$$TriasLocationImplCopyWithImpl(
      _$TriasLocationImpl _value, $Res Function(_$TriasLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopPointName = freezed,
    Object? stopPointRef = freezed,
    Object? geoPosition = null,
    Object? complete = null,
    Object? probability = freezed,
    Object? modes = null,
    Object? dist = freezed,
  }) {
    return _then(_$TriasLocationImpl(
      stopPointName: freezed == stopPointName
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String?,
      stopPointRef: freezed == stopPointRef
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String?,
      geoPosition: null == geoPosition
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as TriasGeoPosition,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double?,
      modes: null == modes
          ? _value._modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasPtMode>,
      dist: freezed == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$TriasLocationImpl extends _TriasLocation {
  const _$TriasLocationImpl(
      {required this.stopPointName,
      required this.stopPointRef,
      required this.geoPosition,
      required this.complete,
      this.probability,
      final List<TriasPtMode> modes = const <TriasPtMode>[],
      this.dist})
      : _modes = modes,
        super._();

  @override
  final String? stopPointName;
  @override
  final String? stopPointRef;
  @override
  final TriasGeoPosition geoPosition;
  @override
  final bool complete;
  @override
  final double? probability;
  final List<TriasPtMode> _modes;
  @override
  @JsonKey()
  List<TriasPtMode> get modes {
    if (_modes is EqualUnmodifiableListView) return _modes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modes);
  }

  @override
  final double? dist;

  @override
  String toString() {
    return 'TriasLocation(stopPointName: $stopPointName, stopPointRef: $stopPointRef, geoPosition: $geoPosition, complete: $complete, probability: $probability, modes: $modes, dist: $dist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriasLocationImpl &&
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
            const DeepCollectionEquality().equals(other._modes, _modes) &&
            (identical(other.dist, dist) || other.dist == dist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stopPointName,
      stopPointRef,
      geoPosition,
      complete,
      probability,
      const DeepCollectionEquality().hash(_modes),
      dist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TriasLocationImplCopyWith<_$TriasLocationImpl> get copyWith =>
      __$$TriasLocationImplCopyWithImpl<_$TriasLocationImpl>(this, _$identity);
}

abstract class _TriasLocation extends TriasLocation {
  const factory _TriasLocation(
      {required final String? stopPointName,
      required final String? stopPointRef,
      required final TriasGeoPosition geoPosition,
      required final bool complete,
      final double? probability,
      final List<TriasPtMode> modes,
      final double? dist}) = _$TriasLocationImpl;
  const _TriasLocation._() : super._();

  @override
  String? get stopPointName;
  @override
  String? get stopPointRef;
  @override
  TriasGeoPosition get geoPosition;
  @override
  bool get complete;
  @override
  double? get probability;
  @override
  List<TriasPtMode> get modes;
  @override
  double? get dist;
  @override
  @JsonKey(ignore: true)
  _$$TriasLocationImplCopyWith<_$TriasLocationImpl> get copyWith =>
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
abstract class _$$TriasPtModeImplCopyWith<$Res>
    implements $TriasPtModeCopyWith<$Res> {
  factory _$$TriasPtModeImplCopyWith(
          _$TriasPtModeImpl value, $Res Function(_$TriasPtModeImpl) then) =
      __$$TriasPtModeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, String? submode});
}

/// @nodoc
class __$$TriasPtModeImplCopyWithImpl<$Res>
    extends _$TriasPtModeCopyWithImpl<$Res, _$TriasPtModeImpl>
    implements _$$TriasPtModeImplCopyWith<$Res> {
  __$$TriasPtModeImplCopyWithImpl(
      _$TriasPtModeImpl _value, $Res Function(_$TriasPtModeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? submode = freezed,
  }) {
    return _then(_$TriasPtModeImpl(
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

class _$TriasPtModeImpl implements _TriasPtMode {
  const _$TriasPtModeImpl(this.mode, this.submode);

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
            other is _$TriasPtModeImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.submode, submode) || other.submode == submode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, submode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TriasPtModeImplCopyWith<_$TriasPtModeImpl> get copyWith =>
      __$$TriasPtModeImplCopyWithImpl<_$TriasPtModeImpl>(this, _$identity);
}

abstract class _TriasPtMode implements TriasPtMode {
  const factory _TriasPtMode(final String mode, final String? submode) =
      _$TriasPtModeImpl;

  @override
  String get mode;
  @override
  String? get submode;
  @override
  @JsonKey(ignore: true)
  _$$TriasPtModeImplCopyWith<_$TriasPtModeImpl> get copyWith =>
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
abstract class _$$TriasStationBoardImplCopyWith<$Res>
    implements $TriasStationBoardCopyWith<$Res> {
  factory _$$TriasStationBoardImplCopyWith(_$TriasStationBoardImpl value,
          $Res Function(_$TriasStationBoardImpl) then) =
      __$$TriasStationBoardImplCopyWithImpl<$Res>;
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
class __$$TriasStationBoardImplCopyWithImpl<$Res>
    extends _$TriasStationBoardCopyWithImpl<$Res, _$TriasStationBoardImpl>
    implements _$$TriasStationBoardImplCopyWith<$Res> {
  __$$TriasStationBoardImplCopyWithImpl(_$TriasStationBoardImpl _value,
      $Res Function(_$TriasStationBoardImpl) _then)
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
    return _then(_$TriasStationBoardImpl(
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

class _$TriasStationBoardImpl extends _TriasStationBoard {
  const _$TriasStationBoardImpl(
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
    if (_previousCalls is EqualUnmodifiableListView) return _previousCalls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousCalls);
  }

  @override
  final TriasThisCall thisCall;
  final List<TriasOnwardCall> _onwardCalls;
  @override
  List<TriasOnwardCall> get onwardCalls {
    if (_onwardCalls is EqualUnmodifiableListView) return _onwardCalls;
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
            other is _$TriasStationBoardImpl &&
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
  _$$TriasStationBoardImplCopyWith<_$TriasStationBoardImpl> get copyWith =>
      __$$TriasStationBoardImplCopyWithImpl<_$TriasStationBoardImpl>(
          this, _$identity);
}

abstract class _TriasStationBoard extends TriasStationBoard {
  const factory _TriasStationBoard(
          {required final Stop stop,
          required final TriasService service,
          required final List<TriasPreviousCall> previousCalls,
          required final TriasThisCall thisCall,
          required final List<TriasOnwardCall> onwardCalls}) =
      _$TriasStationBoardImpl;
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
  _$$TriasStationBoardImplCopyWith<_$TriasStationBoardImpl> get copyWith =>
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
abstract class _$$TriasServiceImplCopyWith<$Res>
    implements $TriasServiceCopyWith<$Res> {
  factory _$$TriasServiceImplCopyWith(
          _$TriasServiceImpl value, $Res Function(_$TriasServiceImpl) then) =
      __$$TriasServiceImplCopyWithImpl<$Res>;
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
class __$$TriasServiceImplCopyWithImpl<$Res>
    extends _$TriasServiceCopyWithImpl<$Res, _$TriasServiceImpl>
    implements _$$TriasServiceImplCopyWith<$Res> {
  __$$TriasServiceImplCopyWithImpl(
      _$TriasServiceImpl _value, $Res Function(_$TriasServiceImpl) _then)
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
    return _then(_$TriasServiceImpl(
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

class _$TriasServiceImpl implements _TriasService {
  const _$TriasServiceImpl(
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
    if (_modes is EqualUnmodifiableListView) return _modes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modes);
  }

  final List<TriasAttribute> _attributes;
  @override
  List<TriasAttribute> get attributes {
    if (_attributes is EqualUnmodifiableListView) return _attributes;
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
            other is _$TriasServiceImpl &&
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
  _$$TriasServiceImplCopyWith<_$TriasServiceImpl> get copyWith =>
      __$$TriasServiceImplCopyWithImpl<_$TriasServiceImpl>(this, _$identity);
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
      required final String destinationText}) = _$TriasServiceImpl;

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
  _$$TriasServiceImplCopyWith<_$TriasServiceImpl> get copyWith =>
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
abstract class _$$TriasModeImplCopyWith<$Res>
    implements $TriasModeCopyWith<$Res> {
  factory _$$TriasModeImplCopyWith(
          _$TriasModeImpl value, $Res Function(_$TriasModeImpl) then) =
      __$$TriasModeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, String? submode, String? name, String? language});
}

/// @nodoc
class __$$TriasModeImplCopyWithImpl<$Res>
    extends _$TriasModeCopyWithImpl<$Res, _$TriasModeImpl>
    implements _$$TriasModeImplCopyWith<$Res> {
  __$$TriasModeImplCopyWithImpl(
      _$TriasModeImpl _value, $Res Function(_$TriasModeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? submode = freezed,
    Object? name = freezed,
    Object? language = freezed,
  }) {
    return _then(_$TriasModeImpl(
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

class _$TriasModeImpl implements _TriasMode {
  const _$TriasModeImpl(this.mode, {this.submode, this.name, this.language});

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
            other is _$TriasModeImpl &&
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
  _$$TriasModeImplCopyWith<_$TriasModeImpl> get copyWith =>
      __$$TriasModeImplCopyWithImpl<_$TriasModeImpl>(this, _$identity);
}

abstract class _TriasMode implements TriasMode {
  const factory _TriasMode(final String mode,
      {final String? submode,
      final String? name,
      final String? language}) = _$TriasModeImpl;

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
  _$$TriasModeImplCopyWith<_$TriasModeImpl> get copyWith =>
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
abstract class _$$TriasAttributeImplCopyWith<$Res>
    implements $TriasAttributeCopyWith<$Res> {
  factory _$$TriasAttributeImplCopyWith(_$TriasAttributeImpl value,
          $Res Function(_$TriasAttributeImpl) then) =
      __$$TriasAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String text});
}

/// @nodoc
class __$$TriasAttributeImplCopyWithImpl<$Res>
    extends _$TriasAttributeCopyWithImpl<$Res, _$TriasAttributeImpl>
    implements _$$TriasAttributeImplCopyWith<$Res> {
  __$$TriasAttributeImplCopyWithImpl(
      _$TriasAttributeImpl _value, $Res Function(_$TriasAttributeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? text = null,
  }) {
    return _then(_$TriasAttributeImpl(
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

class _$TriasAttributeImpl implements _TriasAttribute {
  const _$TriasAttributeImpl({required this.code, required this.text});

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
            other is _$TriasAttributeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TriasAttributeImplCopyWith<_$TriasAttributeImpl> get copyWith =>
      __$$TriasAttributeImplCopyWithImpl<_$TriasAttributeImpl>(
          this, _$identity);
}

abstract class _TriasAttribute implements TriasAttribute {
  const factory _TriasAttribute(
      {required final String code,
      required final String text}) = _$TriasAttributeImpl;

  @override
  String get code;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$TriasAttributeImplCopyWith<_$TriasAttributeImpl> get copyWith =>
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
abstract class _$$TriasOnwardCallImplCopyWith<$Res>
    implements $TriasOnwardCallCopyWith<$Res> {
  factory _$$TriasOnwardCallImplCopyWith(_$TriasOnwardCallImpl value,
          $Res Function(_$TriasOnwardCallImpl) then) =
      __$$TriasOnwardCallImplCopyWithImpl<$Res>;
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
class __$$TriasOnwardCallImplCopyWithImpl<$Res>
    extends _$TriasOnwardCallCopyWithImpl<$Res, _$TriasOnwardCallImpl>
    implements _$$TriasOnwardCallImplCopyWith<$Res> {
  __$$TriasOnwardCallImplCopyWithImpl(
      _$TriasOnwardCallImpl _value, $Res Function(_$TriasOnwardCallImpl) _then)
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
    return _then(_$TriasOnwardCallImpl(
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

class _$TriasOnwardCallImpl extends _TriasOnwardCall {
  const _$TriasOnwardCallImpl(
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
            other is _$TriasOnwardCallImpl &&
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
  _$$TriasOnwardCallImplCopyWith<_$TriasOnwardCallImpl> get copyWith =>
      __$$TriasOnwardCallImplCopyWithImpl<_$TriasOnwardCallImpl>(
          this, _$identity);
}

abstract class _TriasOnwardCall extends TriasOnwardCall {
  const factory _TriasOnwardCall(
      {required final String stopPointRef,
      required final String stopPointName,
      required final String plannedBay,
      required final TriasServiceTime serviceArrival,
      required final String stopSeqNumber}) = _$TriasOnwardCallImpl;
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
  _$$TriasOnwardCallImplCopyWith<_$TriasOnwardCallImpl> get copyWith =>
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
abstract class _$$TriasServiceTimeImplCopyWith<$Res>
    implements $TriasServiceTimeCopyWith<$Res> {
  factory _$$TriasServiceTimeImplCopyWith(_$TriasServiceTimeImpl value,
          $Res Function(_$TriasServiceTimeImpl) then) =
      __$$TriasServiceTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timetabledTime, DateTime estimatedTime});
}

/// @nodoc
class __$$TriasServiceTimeImplCopyWithImpl<$Res>
    extends _$TriasServiceTimeCopyWithImpl<$Res, _$TriasServiceTimeImpl>
    implements _$$TriasServiceTimeImplCopyWith<$Res> {
  __$$TriasServiceTimeImplCopyWithImpl(_$TriasServiceTimeImpl _value,
      $Res Function(_$TriasServiceTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetabledTime = null,
    Object? estimatedTime = null,
  }) {
    return _then(_$TriasServiceTimeImpl(
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

class _$TriasServiceTimeImpl extends _TriasServiceTime {
  const _$TriasServiceTimeImpl(
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
            other is _$TriasServiceTimeImpl &&
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
  _$$TriasServiceTimeImplCopyWith<_$TriasServiceTimeImpl> get copyWith =>
      __$$TriasServiceTimeImplCopyWithImpl<_$TriasServiceTimeImpl>(
          this, _$identity);
}

abstract class _TriasServiceTime extends TriasServiceTime {
  const factory _TriasServiceTime(
      {required final DateTime timetabledTime,
      required final DateTime estimatedTime}) = _$TriasServiceTimeImpl;
  const _TriasServiceTime._() : super._();

  @override
  DateTime get timetabledTime;
  @override
  DateTime get estimatedTime;
  @override
  @JsonKey(ignore: true)
  _$$TriasServiceTimeImplCopyWith<_$TriasServiceTimeImpl> get copyWith =>
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
abstract class _$$TriasPreviousCallImplCopyWith<$Res>
    implements $TriasPreviousCallCopyWith<$Res> {
  factory _$$TriasPreviousCallImplCopyWith(_$TriasPreviousCallImpl value,
          $Res Function(_$TriasPreviousCallImpl) then) =
      __$$TriasPreviousCallImplCopyWithImpl<$Res>;
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
class __$$TriasPreviousCallImplCopyWithImpl<$Res>
    extends _$TriasPreviousCallCopyWithImpl<$Res, _$TriasPreviousCallImpl>
    implements _$$TriasPreviousCallImplCopyWith<$Res> {
  __$$TriasPreviousCallImplCopyWithImpl(_$TriasPreviousCallImpl _value,
      $Res Function(_$TriasPreviousCallImpl) _then)
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
    return _then(_$TriasPreviousCallImpl(
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

class _$TriasPreviousCallImpl extends _TriasPreviousCall {
  const _$TriasPreviousCallImpl(
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
            other is _$TriasPreviousCallImpl &&
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
  _$$TriasPreviousCallImplCopyWith<_$TriasPreviousCallImpl> get copyWith =>
      __$$TriasPreviousCallImplCopyWithImpl<_$TriasPreviousCallImpl>(
          this, _$identity);
}

abstract class _TriasPreviousCall extends TriasPreviousCall {
  const factory _TriasPreviousCall(
      {required final String stopPointRef,
      required final String stopPointName,
      required final String plannedBay,
      required final TriasServiceTime serviceArrival,
      required final TriasServiceTime serviceDeparture,
      required final String stopSeqNumber}) = _$TriasPreviousCallImpl;
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
  _$$TriasPreviousCallImplCopyWith<_$TriasPreviousCallImpl> get copyWith =>
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
abstract class _$$TriasThisCallImplCopyWith<$Res>
    implements $TriasThisCallCopyWith<$Res> {
  factory _$$TriasThisCallImplCopyWith(
          _$TriasThisCallImpl value, $Res Function(_$TriasThisCallImpl) then) =
      __$$TriasThisCallImplCopyWithImpl<$Res>;
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
class __$$TriasThisCallImplCopyWithImpl<$Res>
    extends _$TriasThisCallCopyWithImpl<$Res, _$TriasThisCallImpl>
    implements _$$TriasThisCallImplCopyWith<$Res> {
  __$$TriasThisCallImplCopyWithImpl(
      _$TriasThisCallImpl _value, $Res Function(_$TriasThisCallImpl) _then)
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
    return _then(_$TriasThisCallImpl(
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

class _$TriasThisCallImpl extends _TriasThisCall {
  const _$TriasThisCallImpl(
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
            other is _$TriasThisCallImpl &&
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
  _$$TriasThisCallImplCopyWith<_$TriasThisCallImpl> get copyWith =>
      __$$TriasThisCallImplCopyWithImpl<_$TriasThisCallImpl>(this, _$identity);
}

abstract class _TriasThisCall extends TriasThisCall {
  const factory _TriasThisCall(
      {required final String stopPointRef,
      required final String stopPointName,
      required final String plannedBay,
      required final String estimatedBay,
      required final TriasServiceTime serviceDeparture,
      required final String stopSeqNumber}) = _$TriasThisCallImpl;
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
  _$$TriasThisCallImplCopyWith<_$TriasThisCallImpl> get copyWith =>
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
abstract class _$$TriasGeoPositionImplCopyWith<$Res>
    implements $TriasGeoPositionCopyWith<$Res> {
  factory _$$TriasGeoPositionImplCopyWith(_$TriasGeoPositionImpl value,
          $Res Function(_$TriasGeoPositionImpl) then) =
      __$$TriasGeoPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$TriasGeoPositionImplCopyWithImpl<$Res>
    extends _$TriasGeoPositionCopyWithImpl<$Res, _$TriasGeoPositionImpl>
    implements _$$TriasGeoPositionImplCopyWith<$Res> {
  __$$TriasGeoPositionImplCopyWithImpl(_$TriasGeoPositionImpl _value,
      $Res Function(_$TriasGeoPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$TriasGeoPositionImpl(
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

class _$TriasGeoPositionImpl implements _TriasGeoPosition {
  const _$TriasGeoPositionImpl(
      {required this.latitude, required this.longitude});

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
            other is _$TriasGeoPositionImpl &&
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
  _$$TriasGeoPositionImplCopyWith<_$TriasGeoPositionImpl> get copyWith =>
      __$$TriasGeoPositionImplCopyWithImpl<_$TriasGeoPositionImpl>(
          this, _$identity);
}

abstract class _TriasGeoPosition implements TriasGeoPosition {
  const factory _TriasGeoPosition(
      {required final double latitude,
      required final double longitude}) = _$TriasGeoPositionImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$TriasGeoPositionImplCopyWith<_$TriasGeoPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
