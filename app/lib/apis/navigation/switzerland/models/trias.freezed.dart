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
      _$TriasLocationCopyWithImpl<$Res>;
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
class _$TriasLocationCopyWithImpl<$Res>
    implements $TriasLocationCopyWith<$Res> {
  _$TriasLocationCopyWithImpl(this._value, this._then);

  final TriasLocation _value;
  // ignore: unused_field
  final $Res Function(TriasLocation) _then;

  @override
  $Res call({
    Object? stopPointName = freezed,
    Object? stopPointRef = freezed,
    Object? geoPosition = freezed,
    Object? complete = freezed,
    Object? probability = freezed,
    Object? modes = freezed,
  }) {
    return _then(_value.copyWith(
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      geoPosition: geoPosition == freezed
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as TriasGeoPosition,
      complete: complete == freezed
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      probability: probability == freezed
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
      modes: modes == freezed
          ? _value.modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasPtMode>,
    ));
  }

  @override
  $TriasGeoPositionCopyWith<$Res> get geoPosition {
    return $TriasGeoPositionCopyWith<$Res>(_value.geoPosition, (value) {
      return _then(_value.copyWith(geoPosition: value));
    });
  }
}

/// @nodoc
abstract class _$TriasLocationCopyWith<$Res>
    implements $TriasLocationCopyWith<$Res> {
  factory _$TriasLocationCopyWith(
          _TriasLocation value, $Res Function(_TriasLocation) then) =
      __$TriasLocationCopyWithImpl<$Res>;
  @override
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
class __$TriasLocationCopyWithImpl<$Res>
    extends _$TriasLocationCopyWithImpl<$Res>
    implements _$TriasLocationCopyWith<$Res> {
  __$TriasLocationCopyWithImpl(
      _TriasLocation _value, $Res Function(_TriasLocation) _then)
      : super(_value, (v) => _then(v as _TriasLocation));

  @override
  _TriasLocation get _value => super._value as _TriasLocation;

  @override
  $Res call({
    Object? stopPointName = freezed,
    Object? stopPointRef = freezed,
    Object? geoPosition = freezed,
    Object? complete = freezed,
    Object? probability = freezed,
    Object? modes = freezed,
  }) {
    return _then(_TriasLocation(
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      geoPosition: geoPosition == freezed
          ? _value.geoPosition
          : geoPosition // ignore: cast_nullable_to_non_nullable
              as TriasGeoPosition,
      complete: complete == freezed
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      probability: probability == freezed
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double,
      modes: modes == freezed
          ? _value.modes
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
            other is _TriasLocation &&
            const DeepCollectionEquality()
                .equals(other.stopPointName, stopPointName) &&
            const DeepCollectionEquality()
                .equals(other.stopPointRef, stopPointRef) &&
            const DeepCollectionEquality()
                .equals(other.geoPosition, geoPosition) &&
            const DeepCollectionEquality().equals(other.complete, complete) &&
            const DeepCollectionEquality()
                .equals(other.probability, probability) &&
            const DeepCollectionEquality().equals(other.modes, modes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stopPointName),
      const DeepCollectionEquality().hash(stopPointRef),
      const DeepCollectionEquality().hash(geoPosition),
      const DeepCollectionEquality().hash(complete),
      const DeepCollectionEquality().hash(probability),
      const DeepCollectionEquality().hash(modes));

  @JsonKey(ignore: true)
  @override
  _$TriasLocationCopyWith<_TriasLocation> get copyWith =>
      __$TriasLocationCopyWithImpl<_TriasLocation>(this, _$identity);
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
  String get stopPointName => throw _privateConstructorUsedError;
  @override
  String get stopPointRef => throw _privateConstructorUsedError;
  @override
  TriasGeoPosition get geoPosition => throw _privateConstructorUsedError;
  @override
  bool get complete => throw _privateConstructorUsedError;
  @override
  double get probability => throw _privateConstructorUsedError;
  @override
  List<TriasPtMode> get modes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasLocationCopyWith<_TriasLocation> get copyWith =>
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
      _$TriasPtModeCopyWithImpl<$Res>;
  $Res call({String mode, String? submode});
}

/// @nodoc
class _$TriasPtModeCopyWithImpl<$Res> implements $TriasPtModeCopyWith<$Res> {
  _$TriasPtModeCopyWithImpl(this._value, this._then);

  final TriasPtMode _value;
  // ignore: unused_field
  final $Res Function(TriasPtMode) _then;

  @override
  $Res call({
    Object? mode = freezed,
    Object? submode = freezed,
  }) {
    return _then(_value.copyWith(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode: submode == freezed
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TriasPtModeCopyWith<$Res>
    implements $TriasPtModeCopyWith<$Res> {
  factory _$TriasPtModeCopyWith(
          _TriasPtMode value, $Res Function(_TriasPtMode) then) =
      __$TriasPtModeCopyWithImpl<$Res>;
  @override
  $Res call({String mode, String? submode});
}

/// @nodoc
class __$TriasPtModeCopyWithImpl<$Res> extends _$TriasPtModeCopyWithImpl<$Res>
    implements _$TriasPtModeCopyWith<$Res> {
  __$TriasPtModeCopyWithImpl(
      _TriasPtMode _value, $Res Function(_TriasPtMode) _then)
      : super(_value, (v) => _then(v as _TriasPtMode));

  @override
  _TriasPtMode get _value => super._value as _TriasPtMode;

  @override
  $Res call({
    Object? mode = freezed,
    Object? submode = freezed,
  }) {
    return _then(_TriasPtMode(
      mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode == freezed
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
            other is _TriasPtMode &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality().equals(other.submode, submode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mode),
      const DeepCollectionEquality().hash(submode));

  @JsonKey(ignore: true)
  @override
  _$TriasPtModeCopyWith<_TriasPtMode> get copyWith =>
      __$TriasPtModeCopyWithImpl<_TriasPtMode>(this, _$identity);
}

abstract class _TriasPtMode implements TriasPtMode {
  const factory _TriasPtMode(final String mode, final String? submode) =
      _$_TriasPtMode;

  @override
  String get mode => throw _privateConstructorUsedError;
  @override
  String? get submode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasPtModeCopyWith<_TriasPtMode> get copyWith =>
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
      _$TriasStationBoardCopyWithImpl<$Res>;
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
class _$TriasStationBoardCopyWithImpl<$Res>
    implements $TriasStationBoardCopyWith<$Res> {
  _$TriasStationBoardCopyWithImpl(this._value, this._then);

  final TriasStationBoard _value;
  // ignore: unused_field
  final $Res Function(TriasStationBoard) _then;

  @override
  $Res call({
    Object? stop = freezed,
    Object? service = freezed,
    Object? previousCalls = freezed,
    Object? thisCall = freezed,
    Object? onwardCalls = freezed,
  }) {
    return _then(_value.copyWith(
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as TriasService,
      previousCalls: previousCalls == freezed
          ? _value.previousCalls
          : previousCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasPreviousCall>,
      thisCall: thisCall == freezed
          ? _value.thisCall
          : thisCall // ignore: cast_nullable_to_non_nullable
              as TriasThisCall,
      onwardCalls: onwardCalls == freezed
          ? _value.onwardCalls
          : onwardCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasOnwardCall>,
    ));
  }

  @override
  $TriasServiceCopyWith<$Res> get service {
    return $TriasServiceCopyWith<$Res>(_value.service, (value) {
      return _then(_value.copyWith(service: value));
    });
  }

  @override
  $TriasThisCallCopyWith<$Res> get thisCall {
    return $TriasThisCallCopyWith<$Res>(_value.thisCall, (value) {
      return _then(_value.copyWith(thisCall: value));
    });
  }
}

/// @nodoc
abstract class _$TriasStationBoardCopyWith<$Res>
    implements $TriasStationBoardCopyWith<$Res> {
  factory _$TriasStationBoardCopyWith(
          _TriasStationBoard value, $Res Function(_TriasStationBoard) then) =
      __$TriasStationBoardCopyWithImpl<$Res>;
  @override
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
class __$TriasStationBoardCopyWithImpl<$Res>
    extends _$TriasStationBoardCopyWithImpl<$Res>
    implements _$TriasStationBoardCopyWith<$Res> {
  __$TriasStationBoardCopyWithImpl(
      _TriasStationBoard _value, $Res Function(_TriasStationBoard) _then)
      : super(_value, (v) => _then(v as _TriasStationBoard));

  @override
  _TriasStationBoard get _value => super._value as _TriasStationBoard;

  @override
  $Res call({
    Object? stop = freezed,
    Object? service = freezed,
    Object? previousCalls = freezed,
    Object? thisCall = freezed,
    Object? onwardCalls = freezed,
  }) {
    return _then(_TriasStationBoard(
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as Stop,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as TriasService,
      previousCalls: previousCalls == freezed
          ? _value.previousCalls
          : previousCalls // ignore: cast_nullable_to_non_nullable
              as List<TriasPreviousCall>,
      thisCall: thisCall == freezed
          ? _value.thisCall
          : thisCall // ignore: cast_nullable_to_non_nullable
              as TriasThisCall,
      onwardCalls: onwardCalls == freezed
          ? _value.onwardCalls
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
            other is _TriasStationBoard &&
            const DeepCollectionEquality().equals(other.stop, stop) &&
            const DeepCollectionEquality().equals(other.service, service) &&
            const DeepCollectionEquality()
                .equals(other.previousCalls, previousCalls) &&
            const DeepCollectionEquality().equals(other.thisCall, thisCall) &&
            const DeepCollectionEquality()
                .equals(other.onwardCalls, onwardCalls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stop),
      const DeepCollectionEquality().hash(service),
      const DeepCollectionEquality().hash(previousCalls),
      const DeepCollectionEquality().hash(thisCall),
      const DeepCollectionEquality().hash(onwardCalls));

  @JsonKey(ignore: true)
  @override
  _$TriasStationBoardCopyWith<_TriasStationBoard> get copyWith =>
      __$TriasStationBoardCopyWithImpl<_TriasStationBoard>(this, _$identity);
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
  Stop get stop => throw _privateConstructorUsedError;
  @override
  TriasService get service => throw _privateConstructorUsedError;
  @override
  List<TriasPreviousCall> get previousCalls =>
      throw _privateConstructorUsedError;
  @override
  TriasThisCall get thisCall => throw _privateConstructorUsedError;
  @override
  List<TriasOnwardCall> get onwardCalls => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasStationBoardCopyWith<_TriasStationBoard> get copyWith =>
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
      _$TriasServiceCopyWithImpl<$Res>;
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
class _$TriasServiceCopyWithImpl<$Res> implements $TriasServiceCopyWith<$Res> {
  _$TriasServiceCopyWithImpl(this._value, this._then);

  final TriasService _value;
  // ignore: unused_field
  final $Res Function(TriasService) _then;

  @override
  $Res call({
    Object? operatingDayRef = freezed,
    Object? journeyRef = freezed,
    Object? lineRef = freezed,
    Object? directionRef = freezed,
    Object? modes = freezed,
    Object? attributes = freezed,
    Object? publishedLineName = freezed,
    Object? operatorRef = freezed,
    Object? originStopPointRef = freezed,
    Object? originText = freezed,
    Object? destinationStopPointRef = freezed,
    Object? destinationText = freezed,
  }) {
    return _then(_value.copyWith(
      operatingDayRef: operatingDayRef == freezed
          ? _value.operatingDayRef
          : operatingDayRef // ignore: cast_nullable_to_non_nullable
              as String,
      journeyRef: journeyRef == freezed
          ? _value.journeyRef
          : journeyRef // ignore: cast_nullable_to_non_nullable
              as String,
      lineRef: lineRef == freezed
          ? _value.lineRef
          : lineRef // ignore: cast_nullable_to_non_nullable
              as String,
      directionRef: directionRef == freezed
          ? _value.directionRef
          : directionRef // ignore: cast_nullable_to_non_nullable
              as String,
      modes: modes == freezed
          ? _value.modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasMode>,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<TriasAttribute>,
      publishedLineName: publishedLineName == freezed
          ? _value.publishedLineName
          : publishedLineName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorRef: operatorRef == freezed
          ? _value.operatorRef
          : operatorRef // ignore: cast_nullable_to_non_nullable
              as String,
      originStopPointRef: originStopPointRef == freezed
          ? _value.originStopPointRef
          : originStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      originText: originText == freezed
          ? _value.originText
          : originText // ignore: cast_nullable_to_non_nullable
              as String,
      destinationStopPointRef: destinationStopPointRef == freezed
          ? _value.destinationStopPointRef
          : destinationStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      destinationText: destinationText == freezed
          ? _value.destinationText
          : destinationText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TriasServiceCopyWith<$Res>
    implements $TriasServiceCopyWith<$Res> {
  factory _$TriasServiceCopyWith(
          _TriasService value, $Res Function(_TriasService) then) =
      __$TriasServiceCopyWithImpl<$Res>;
  @override
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
class __$TriasServiceCopyWithImpl<$Res> extends _$TriasServiceCopyWithImpl<$Res>
    implements _$TriasServiceCopyWith<$Res> {
  __$TriasServiceCopyWithImpl(
      _TriasService _value, $Res Function(_TriasService) _then)
      : super(_value, (v) => _then(v as _TriasService));

  @override
  _TriasService get _value => super._value as _TriasService;

  @override
  $Res call({
    Object? operatingDayRef = freezed,
    Object? journeyRef = freezed,
    Object? lineRef = freezed,
    Object? directionRef = freezed,
    Object? modes = freezed,
    Object? attributes = freezed,
    Object? publishedLineName = freezed,
    Object? operatorRef = freezed,
    Object? originStopPointRef = freezed,
    Object? originText = freezed,
    Object? destinationStopPointRef = freezed,
    Object? destinationText = freezed,
  }) {
    return _then(_TriasService(
      operatingDayRef: operatingDayRef == freezed
          ? _value.operatingDayRef
          : operatingDayRef // ignore: cast_nullable_to_non_nullable
              as String,
      journeyRef: journeyRef == freezed
          ? _value.journeyRef
          : journeyRef // ignore: cast_nullable_to_non_nullable
              as String,
      lineRef: lineRef == freezed
          ? _value.lineRef
          : lineRef // ignore: cast_nullable_to_non_nullable
              as String,
      directionRef: directionRef == freezed
          ? _value.directionRef
          : directionRef // ignore: cast_nullable_to_non_nullable
              as String,
      modes: modes == freezed
          ? _value.modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<TriasMode>,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<TriasAttribute>,
      publishedLineName: publishedLineName == freezed
          ? _value.publishedLineName
          : publishedLineName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorRef: operatorRef == freezed
          ? _value.operatorRef
          : operatorRef // ignore: cast_nullable_to_non_nullable
              as String,
      originStopPointRef: originStopPointRef == freezed
          ? _value.originStopPointRef
          : originStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      originText: originText == freezed
          ? _value.originText
          : originText // ignore: cast_nullable_to_non_nullable
              as String,
      destinationStopPointRef: destinationStopPointRef == freezed
          ? _value.destinationStopPointRef
          : destinationStopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      destinationText: destinationText == freezed
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
            other is _TriasService &&
            const DeepCollectionEquality()
                .equals(other.operatingDayRef, operatingDayRef) &&
            const DeepCollectionEquality()
                .equals(other.journeyRef, journeyRef) &&
            const DeepCollectionEquality().equals(other.lineRef, lineRef) &&
            const DeepCollectionEquality()
                .equals(other.directionRef, directionRef) &&
            const DeepCollectionEquality().equals(other.modes, modes) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes) &&
            const DeepCollectionEquality()
                .equals(other.publishedLineName, publishedLineName) &&
            const DeepCollectionEquality()
                .equals(other.operatorRef, operatorRef) &&
            const DeepCollectionEquality()
                .equals(other.originStopPointRef, originStopPointRef) &&
            const DeepCollectionEquality()
                .equals(other.originText, originText) &&
            const DeepCollectionEquality().equals(
                other.destinationStopPointRef, destinationStopPointRef) &&
            const DeepCollectionEquality()
                .equals(other.destinationText, destinationText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(operatingDayRef),
      const DeepCollectionEquality().hash(journeyRef),
      const DeepCollectionEquality().hash(lineRef),
      const DeepCollectionEquality().hash(directionRef),
      const DeepCollectionEquality().hash(modes),
      const DeepCollectionEquality().hash(attributes),
      const DeepCollectionEquality().hash(publishedLineName),
      const DeepCollectionEquality().hash(operatorRef),
      const DeepCollectionEquality().hash(originStopPointRef),
      const DeepCollectionEquality().hash(originText),
      const DeepCollectionEquality().hash(destinationStopPointRef),
      const DeepCollectionEquality().hash(destinationText));

  @JsonKey(ignore: true)
  @override
  _$TriasServiceCopyWith<_TriasService> get copyWith =>
      __$TriasServiceCopyWithImpl<_TriasService>(this, _$identity);
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
  String get operatingDayRef => throw _privateConstructorUsedError;
  @override
  String get journeyRef => throw _privateConstructorUsedError;
  @override
  String get lineRef => throw _privateConstructorUsedError;
  @override
  String get directionRef => throw _privateConstructorUsedError;
  @override
  List<TriasMode> get modes => throw _privateConstructorUsedError;
  @override
  List<TriasAttribute> get attributes => throw _privateConstructorUsedError;
  @override
  String get publishedLineName => throw _privateConstructorUsedError;
  @override
  String get operatorRef => throw _privateConstructorUsedError;
  @override
  String get originStopPointRef => throw _privateConstructorUsedError;
  @override
  String get originText => throw _privateConstructorUsedError;
  @override
  String get destinationStopPointRef => throw _privateConstructorUsedError;
  @override
  String get destinationText => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasServiceCopyWith<_TriasService> get copyWith =>
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
      _$TriasModeCopyWithImpl<$Res>;
  $Res call({String mode, String? submode, String? name, String? language});
}

/// @nodoc
class _$TriasModeCopyWithImpl<$Res> implements $TriasModeCopyWith<$Res> {
  _$TriasModeCopyWithImpl(this._value, this._then);

  final TriasMode _value;
  // ignore: unused_field
  final $Res Function(TriasMode) _then;

  @override
  $Res call({
    Object? mode = freezed,
    Object? submode = freezed,
    Object? name = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode: submode == freezed
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TriasModeCopyWith<$Res> implements $TriasModeCopyWith<$Res> {
  factory _$TriasModeCopyWith(
          _TriasMode value, $Res Function(_TriasMode) then) =
      __$TriasModeCopyWithImpl<$Res>;
  @override
  $Res call({String mode, String? submode, String? name, String? language});
}

/// @nodoc
class __$TriasModeCopyWithImpl<$Res> extends _$TriasModeCopyWithImpl<$Res>
    implements _$TriasModeCopyWith<$Res> {
  __$TriasModeCopyWithImpl(_TriasMode _value, $Res Function(_TriasMode) _then)
      : super(_value, (v) => _then(v as _TriasMode));

  @override
  _TriasMode get _value => super._value as _TriasMode;

  @override
  $Res call({
    Object? mode = freezed,
    Object? submode = freezed,
    Object? name = freezed,
    Object? language = freezed,
  }) {
    return _then(_TriasMode(
      mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      submode: submode == freezed
          ? _value.submode
          : submode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
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
            other is _TriasMode &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality().equals(other.submode, submode) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.language, language));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mode),
      const DeepCollectionEquality().hash(submode),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(language));

  @JsonKey(ignore: true)
  @override
  _$TriasModeCopyWith<_TriasMode> get copyWith =>
      __$TriasModeCopyWithImpl<_TriasMode>(this, _$identity);
}

abstract class _TriasMode implements TriasMode {
  const factory _TriasMode(final String mode,
      {final String? submode,
      final String? name,
      final String? language}) = _$_TriasMode;

  @override
  String get mode => throw _privateConstructorUsedError;
  @override
  String? get submode => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get language => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasModeCopyWith<_TriasMode> get copyWith =>
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
      _$TriasAttributeCopyWithImpl<$Res>;
  $Res call({String code, String text});
}

/// @nodoc
class _$TriasAttributeCopyWithImpl<$Res>
    implements $TriasAttributeCopyWith<$Res> {
  _$TriasAttributeCopyWithImpl(this._value, this._then);

  final TriasAttribute _value;
  // ignore: unused_field
  final $Res Function(TriasAttribute) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TriasAttributeCopyWith<$Res>
    implements $TriasAttributeCopyWith<$Res> {
  factory _$TriasAttributeCopyWith(
          _TriasAttribute value, $Res Function(_TriasAttribute) then) =
      __$TriasAttributeCopyWithImpl<$Res>;
  @override
  $Res call({String code, String text});
}

/// @nodoc
class __$TriasAttributeCopyWithImpl<$Res>
    extends _$TriasAttributeCopyWithImpl<$Res>
    implements _$TriasAttributeCopyWith<$Res> {
  __$TriasAttributeCopyWithImpl(
      _TriasAttribute _value, $Res Function(_TriasAttribute) _then)
      : super(_value, (v) => _then(v as _TriasAttribute));

  @override
  _TriasAttribute get _value => super._value as _TriasAttribute;

  @override
  $Res call({
    Object? code = freezed,
    Object? text = freezed,
  }) {
    return _then(_TriasAttribute(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
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
            other is _TriasAttribute &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$TriasAttributeCopyWith<_TriasAttribute> get copyWith =>
      __$TriasAttributeCopyWithImpl<_TriasAttribute>(this, _$identity);
}

abstract class _TriasAttribute implements TriasAttribute {
  const factory _TriasAttribute(
      {required final String code,
      required final String text}) = _$_TriasAttribute;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasAttributeCopyWith<_TriasAttribute> get copyWith =>
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
      _$TriasOnwardCallCopyWithImpl<$Res>;
  $Res call(
      {String stopPointRef,
      String stopPointName,
      String plannedBay,
      TriasServiceTime serviceArrival,
      String stopSeqNumber});

  $TriasServiceTimeCopyWith<$Res> get serviceArrival;
}

/// @nodoc
class _$TriasOnwardCallCopyWithImpl<$Res>
    implements $TriasOnwardCallCopyWith<$Res> {
  _$TriasOnwardCallCopyWithImpl(this._value, this._then);

  final TriasOnwardCall _value;
  // ignore: unused_field
  final $Res Function(TriasOnwardCall) _then;

  @override
  $Res call({
    Object? stopPointRef = freezed,
    Object? stopPointName = freezed,
    Object? plannedBay = freezed,
    Object? serviceArrival = freezed,
    Object? stopSeqNumber = freezed,
  }) {
    return _then(_value.copyWith(
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: plannedBay == freezed
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: serviceArrival == freezed
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: stopSeqNumber == freezed
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceArrival {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceArrival, (value) {
      return _then(_value.copyWith(serviceArrival: value));
    });
  }
}

/// @nodoc
abstract class _$TriasOnwardCallCopyWith<$Res>
    implements $TriasOnwardCallCopyWith<$Res> {
  factory _$TriasOnwardCallCopyWith(
          _TriasOnwardCall value, $Res Function(_TriasOnwardCall) then) =
      __$TriasOnwardCallCopyWithImpl<$Res>;
  @override
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
class __$TriasOnwardCallCopyWithImpl<$Res>
    extends _$TriasOnwardCallCopyWithImpl<$Res>
    implements _$TriasOnwardCallCopyWith<$Res> {
  __$TriasOnwardCallCopyWithImpl(
      _TriasOnwardCall _value, $Res Function(_TriasOnwardCall) _then)
      : super(_value, (v) => _then(v as _TriasOnwardCall));

  @override
  _TriasOnwardCall get _value => super._value as _TriasOnwardCall;

  @override
  $Res call({
    Object? stopPointRef = freezed,
    Object? stopPointName = freezed,
    Object? plannedBay = freezed,
    Object? serviceArrival = freezed,
    Object? stopSeqNumber = freezed,
  }) {
    return _then(_TriasOnwardCall(
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: plannedBay == freezed
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: serviceArrival == freezed
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: stopSeqNumber == freezed
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
            other is _TriasOnwardCall &&
            const DeepCollectionEquality()
                .equals(other.stopPointRef, stopPointRef) &&
            const DeepCollectionEquality()
                .equals(other.stopPointName, stopPointName) &&
            const DeepCollectionEquality()
                .equals(other.plannedBay, plannedBay) &&
            const DeepCollectionEquality()
                .equals(other.serviceArrival, serviceArrival) &&
            const DeepCollectionEquality()
                .equals(other.stopSeqNumber, stopSeqNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stopPointRef),
      const DeepCollectionEquality().hash(stopPointName),
      const DeepCollectionEquality().hash(plannedBay),
      const DeepCollectionEquality().hash(serviceArrival),
      const DeepCollectionEquality().hash(stopSeqNumber));

  @JsonKey(ignore: true)
  @override
  _$TriasOnwardCallCopyWith<_TriasOnwardCall> get copyWith =>
      __$TriasOnwardCallCopyWithImpl<_TriasOnwardCall>(this, _$identity);
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
  String get stopPointRef => throw _privateConstructorUsedError;
  @override
  String get stopPointName => throw _privateConstructorUsedError;
  @override
  String get plannedBay => throw _privateConstructorUsedError;
  @override
  TriasServiceTime get serviceArrival => throw _privateConstructorUsedError;
  @override
  String get stopSeqNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasOnwardCallCopyWith<_TriasOnwardCall> get copyWith =>
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
      _$TriasServiceTimeCopyWithImpl<$Res>;
  $Res call({DateTime timetabledTime, DateTime estimatedTime});
}

/// @nodoc
class _$TriasServiceTimeCopyWithImpl<$Res>
    implements $TriasServiceTimeCopyWith<$Res> {
  _$TriasServiceTimeCopyWithImpl(this._value, this._then);

  final TriasServiceTime _value;
  // ignore: unused_field
  final $Res Function(TriasServiceTime) _then;

  @override
  $Res call({
    Object? timetabledTime = freezed,
    Object? estimatedTime = freezed,
  }) {
    return _then(_value.copyWith(
      timetabledTime: timetabledTime == freezed
          ? _value.timetabledTime
          : timetabledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedTime: estimatedTime == freezed
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TriasServiceTimeCopyWith<$Res>
    implements $TriasServiceTimeCopyWith<$Res> {
  factory _$TriasServiceTimeCopyWith(
          _TriasServiceTime value, $Res Function(_TriasServiceTime) then) =
      __$TriasServiceTimeCopyWithImpl<$Res>;
  @override
  $Res call({DateTime timetabledTime, DateTime estimatedTime});
}

/// @nodoc
class __$TriasServiceTimeCopyWithImpl<$Res>
    extends _$TriasServiceTimeCopyWithImpl<$Res>
    implements _$TriasServiceTimeCopyWith<$Res> {
  __$TriasServiceTimeCopyWithImpl(
      _TriasServiceTime _value, $Res Function(_TriasServiceTime) _then)
      : super(_value, (v) => _then(v as _TriasServiceTime));

  @override
  _TriasServiceTime get _value => super._value as _TriasServiceTime;

  @override
  $Res call({
    Object? timetabledTime = freezed,
    Object? estimatedTime = freezed,
  }) {
    return _then(_TriasServiceTime(
      timetabledTime: timetabledTime == freezed
          ? _value.timetabledTime
          : timetabledTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedTime: estimatedTime == freezed
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
            other is _TriasServiceTime &&
            const DeepCollectionEquality()
                .equals(other.timetabledTime, timetabledTime) &&
            const DeepCollectionEquality()
                .equals(other.estimatedTime, estimatedTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timetabledTime),
      const DeepCollectionEquality().hash(estimatedTime));

  @JsonKey(ignore: true)
  @override
  _$TriasServiceTimeCopyWith<_TriasServiceTime> get copyWith =>
      __$TriasServiceTimeCopyWithImpl<_TriasServiceTime>(this, _$identity);
}

abstract class _TriasServiceTime extends TriasServiceTime {
  const factory _TriasServiceTime(
      {required final DateTime timetabledTime,
      required final DateTime estimatedTime}) = _$_TriasServiceTime;
  const _TriasServiceTime._() : super._();

  @override
  DateTime get timetabledTime => throw _privateConstructorUsedError;
  @override
  DateTime get estimatedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasServiceTimeCopyWith<_TriasServiceTime> get copyWith =>
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
      _$TriasPreviousCallCopyWithImpl<$Res>;
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
class _$TriasPreviousCallCopyWithImpl<$Res>
    implements $TriasPreviousCallCopyWith<$Res> {
  _$TriasPreviousCallCopyWithImpl(this._value, this._then);

  final TriasPreviousCall _value;
  // ignore: unused_field
  final $Res Function(TriasPreviousCall) _then;

  @override
  $Res call({
    Object? stopPointRef = freezed,
    Object? stopPointName = freezed,
    Object? plannedBay = freezed,
    Object? serviceArrival = freezed,
    Object? serviceDeparture = freezed,
    Object? stopSeqNumber = freezed,
  }) {
    return _then(_value.copyWith(
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: plannedBay == freezed
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: serviceArrival == freezed
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      serviceDeparture: serviceDeparture == freezed
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: stopSeqNumber == freezed
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceArrival {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceArrival, (value) {
      return _then(_value.copyWith(serviceArrival: value));
    });
  }

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceDeparture, (value) {
      return _then(_value.copyWith(serviceDeparture: value));
    });
  }
}

/// @nodoc
abstract class _$TriasPreviousCallCopyWith<$Res>
    implements $TriasPreviousCallCopyWith<$Res> {
  factory _$TriasPreviousCallCopyWith(
          _TriasPreviousCall value, $Res Function(_TriasPreviousCall) then) =
      __$TriasPreviousCallCopyWithImpl<$Res>;
  @override
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
class __$TriasPreviousCallCopyWithImpl<$Res>
    extends _$TriasPreviousCallCopyWithImpl<$Res>
    implements _$TriasPreviousCallCopyWith<$Res> {
  __$TriasPreviousCallCopyWithImpl(
      _TriasPreviousCall _value, $Res Function(_TriasPreviousCall) _then)
      : super(_value, (v) => _then(v as _TriasPreviousCall));

  @override
  _TriasPreviousCall get _value => super._value as _TriasPreviousCall;

  @override
  $Res call({
    Object? stopPointRef = freezed,
    Object? stopPointName = freezed,
    Object? plannedBay = freezed,
    Object? serviceArrival = freezed,
    Object? serviceDeparture = freezed,
    Object? stopSeqNumber = freezed,
  }) {
    return _then(_TriasPreviousCall(
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: plannedBay == freezed
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceArrival: serviceArrival == freezed
          ? _value.serviceArrival
          : serviceArrival // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      serviceDeparture: serviceDeparture == freezed
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: stopSeqNumber == freezed
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
            other is _TriasPreviousCall &&
            const DeepCollectionEquality()
                .equals(other.stopPointRef, stopPointRef) &&
            const DeepCollectionEquality()
                .equals(other.stopPointName, stopPointName) &&
            const DeepCollectionEquality()
                .equals(other.plannedBay, plannedBay) &&
            const DeepCollectionEquality()
                .equals(other.serviceArrival, serviceArrival) &&
            const DeepCollectionEquality()
                .equals(other.serviceDeparture, serviceDeparture) &&
            const DeepCollectionEquality()
                .equals(other.stopSeqNumber, stopSeqNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stopPointRef),
      const DeepCollectionEquality().hash(stopPointName),
      const DeepCollectionEquality().hash(plannedBay),
      const DeepCollectionEquality().hash(serviceArrival),
      const DeepCollectionEquality().hash(serviceDeparture),
      const DeepCollectionEquality().hash(stopSeqNumber));

  @JsonKey(ignore: true)
  @override
  _$TriasPreviousCallCopyWith<_TriasPreviousCall> get copyWith =>
      __$TriasPreviousCallCopyWithImpl<_TriasPreviousCall>(this, _$identity);
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
  String get stopPointRef => throw _privateConstructorUsedError;
  @override
  String get stopPointName => throw _privateConstructorUsedError;
  @override
  String get plannedBay => throw _privateConstructorUsedError;
  @override
  TriasServiceTime get serviceArrival => throw _privateConstructorUsedError;
  @override
  TriasServiceTime get serviceDeparture => throw _privateConstructorUsedError;
  @override
  String get stopSeqNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasPreviousCallCopyWith<_TriasPreviousCall> get copyWith =>
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
      _$TriasThisCallCopyWithImpl<$Res>;
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
class _$TriasThisCallCopyWithImpl<$Res>
    implements $TriasThisCallCopyWith<$Res> {
  _$TriasThisCallCopyWithImpl(this._value, this._then);

  final TriasThisCall _value;
  // ignore: unused_field
  final $Res Function(TriasThisCall) _then;

  @override
  $Res call({
    Object? stopPointRef = freezed,
    Object? stopPointName = freezed,
    Object? plannedBay = freezed,
    Object? estimatedBay = freezed,
    Object? serviceDeparture = freezed,
    Object? stopSeqNumber = freezed,
  }) {
    return _then(_value.copyWith(
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: plannedBay == freezed
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedBay: estimatedBay == freezed
          ? _value.estimatedBay
          : estimatedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDeparture: serviceDeparture == freezed
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: stopSeqNumber == freezed
          ? _value.stopSeqNumber
          : stopSeqNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $TriasServiceTimeCopyWith<$Res> get serviceDeparture {
    return $TriasServiceTimeCopyWith<$Res>(_value.serviceDeparture, (value) {
      return _then(_value.copyWith(serviceDeparture: value));
    });
  }
}

/// @nodoc
abstract class _$TriasThisCallCopyWith<$Res>
    implements $TriasThisCallCopyWith<$Res> {
  factory _$TriasThisCallCopyWith(
          _TriasThisCall value, $Res Function(_TriasThisCall) then) =
      __$TriasThisCallCopyWithImpl<$Res>;
  @override
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
class __$TriasThisCallCopyWithImpl<$Res>
    extends _$TriasThisCallCopyWithImpl<$Res>
    implements _$TriasThisCallCopyWith<$Res> {
  __$TriasThisCallCopyWithImpl(
      _TriasThisCall _value, $Res Function(_TriasThisCall) _then)
      : super(_value, (v) => _then(v as _TriasThisCall));

  @override
  _TriasThisCall get _value => super._value as _TriasThisCall;

  @override
  $Res call({
    Object? stopPointRef = freezed,
    Object? stopPointName = freezed,
    Object? plannedBay = freezed,
    Object? estimatedBay = freezed,
    Object? serviceDeparture = freezed,
    Object? stopSeqNumber = freezed,
  }) {
    return _then(_TriasThisCall(
      stopPointRef: stopPointRef == freezed
          ? _value.stopPointRef
          : stopPointRef // ignore: cast_nullable_to_non_nullable
              as String,
      stopPointName: stopPointName == freezed
          ? _value.stopPointName
          : stopPointName // ignore: cast_nullable_to_non_nullable
              as String,
      plannedBay: plannedBay == freezed
          ? _value.plannedBay
          : plannedBay // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedBay: estimatedBay == freezed
          ? _value.estimatedBay
          : estimatedBay // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDeparture: serviceDeparture == freezed
          ? _value.serviceDeparture
          : serviceDeparture // ignore: cast_nullable_to_non_nullable
              as TriasServiceTime,
      stopSeqNumber: stopSeqNumber == freezed
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
            other is _TriasThisCall &&
            const DeepCollectionEquality()
                .equals(other.stopPointRef, stopPointRef) &&
            const DeepCollectionEquality()
                .equals(other.stopPointName, stopPointName) &&
            const DeepCollectionEquality()
                .equals(other.plannedBay, plannedBay) &&
            const DeepCollectionEquality()
                .equals(other.estimatedBay, estimatedBay) &&
            const DeepCollectionEquality()
                .equals(other.serviceDeparture, serviceDeparture) &&
            const DeepCollectionEquality()
                .equals(other.stopSeqNumber, stopSeqNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stopPointRef),
      const DeepCollectionEquality().hash(stopPointName),
      const DeepCollectionEquality().hash(plannedBay),
      const DeepCollectionEquality().hash(estimatedBay),
      const DeepCollectionEquality().hash(serviceDeparture),
      const DeepCollectionEquality().hash(stopSeqNumber));

  @JsonKey(ignore: true)
  @override
  _$TriasThisCallCopyWith<_TriasThisCall> get copyWith =>
      __$TriasThisCallCopyWithImpl<_TriasThisCall>(this, _$identity);
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
  String get stopPointRef => throw _privateConstructorUsedError;
  @override
  String get stopPointName => throw _privateConstructorUsedError;
  @override
  String get plannedBay => throw _privateConstructorUsedError;
  @override
  String get estimatedBay => throw _privateConstructorUsedError;
  @override
  TriasServiceTime get serviceDeparture => throw _privateConstructorUsedError;
  @override
  String get stopSeqNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasThisCallCopyWith<_TriasThisCall> get copyWith =>
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
      _$TriasGeoPositionCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$TriasGeoPositionCopyWithImpl<$Res>
    implements $TriasGeoPositionCopyWith<$Res> {
  _$TriasGeoPositionCopyWithImpl(this._value, this._then);

  final TriasGeoPosition _value;
  // ignore: unused_field
  final $Res Function(TriasGeoPosition) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$TriasGeoPositionCopyWith<$Res>
    implements $TriasGeoPositionCopyWith<$Res> {
  factory _$TriasGeoPositionCopyWith(
          _TriasGeoPosition value, $Res Function(_TriasGeoPosition) then) =
      __$TriasGeoPositionCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$TriasGeoPositionCopyWithImpl<$Res>
    extends _$TriasGeoPositionCopyWithImpl<$Res>
    implements _$TriasGeoPositionCopyWith<$Res> {
  __$TriasGeoPositionCopyWithImpl(
      _TriasGeoPosition _value, $Res Function(_TriasGeoPosition) _then)
      : super(_value, (v) => _then(v as _TriasGeoPosition));

  @override
  _TriasGeoPosition get _value => super._value as _TriasGeoPosition;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_TriasGeoPosition(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
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
            other is _TriasGeoPosition &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$TriasGeoPositionCopyWith<_TriasGeoPosition> get copyWith =>
      __$TriasGeoPositionCopyWithImpl<_TriasGeoPosition>(this, _$identity);
}

abstract class _TriasGeoPosition implements TriasGeoPosition {
  const factory _TriasGeoPosition(
      {required final double latitude,
      required final double longitude}) = _$_TriasGeoPosition;

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TriasGeoPositionCopyWith<_TriasGeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
