// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
SbbExit _$SbbExitFromJson(Map<String, dynamic> json) {
  return _Exit.fromJson(json);
}

/// @nodoc
class _$SbbExitTearOff {
  const _$SbbExitTearOff();

  _Exit call(
      {@JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay = 0,
      DateTime? arrival,
      double? lat,
      double? lon,
      required String name,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime = 0,
      bool isaddress = false}) {
    return _Exit(
      arrDelay: arrDelay,
      arrival: arrival,
      lat: lat,
      lon: lon,
      name: name,
      sbbName: sbbName,
      stopid: stopid,
      track: track,
      waittime: waittime,
      isaddress: isaddress,
    );
  }

  SbbExit fromJson(Map<String, Object> json) {
    return SbbExit.fromJson(json);
  }
}

/// @nodoc
const $SbbExit = _$SbbExitTearOff();

/// @nodoc
mixin _$SbbExit {
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  DateTime? get arrival => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get sbbName => throw _privateConstructorUsedError;
  String? get stopid => throw _privateConstructorUsedError;
  String? get track => throw _privateConstructorUsedError;
  int get waittime => throw _privateConstructorUsedError;
  bool get isaddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbExitCopyWith<SbbExit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbExitCopyWith<$Res> {
  factory $SbbExitCopyWith(SbbExit value, $Res Function(SbbExit) then) =
      _$SbbExitCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String name,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress});
}

/// @nodoc
class _$SbbExitCopyWithImpl<$Res> implements $SbbExitCopyWith<$Res> {
  _$SbbExitCopyWithImpl(this._value, this._then);

  final SbbExit _value;
  // ignore: unused_field
  final $Res Function(SbbExit) _then;

  @override
  $Res call({
    Object? arrDelay = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? name = freezed,
    Object? sbbName = freezed,
    Object? stopid = freezed,
    Object? track = freezed,
    Object? waittime = freezed,
    Object? isaddress = freezed,
  }) {
    return _then(_value.copyWith(
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime?,
      lat: lat == freezed ? _value.lat : lat as double?,
      lon: lon == freezed ? _value.lon : lon as double?,
      name: name == freezed ? _value.name : name as String,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String?,
      stopid: stopid == freezed ? _value.stopid : stopid as String?,
      track: track == freezed ? _value.track : track as String?,
      waittime: waittime == freezed ? _value.waittime : waittime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
    ));
  }
}

/// @nodoc
abstract class _$ExitCopyWith<$Res> implements $SbbExitCopyWith<$Res> {
  factory _$ExitCopyWith(_Exit value, $Res Function(_Exit) then) =
      __$ExitCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String name,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress});
}

/// @nodoc
class __$ExitCopyWithImpl<$Res> extends _$SbbExitCopyWithImpl<$Res>
    implements _$ExitCopyWith<$Res> {
  __$ExitCopyWithImpl(_Exit _value, $Res Function(_Exit) _then)
      : super(_value, (v) => _then(v as _Exit));

  @override
  _Exit get _value => super._value as _Exit;

  @override
  $Res call({
    Object? arrDelay = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? name = freezed,
    Object? sbbName = freezed,
    Object? stopid = freezed,
    Object? track = freezed,
    Object? waittime = freezed,
    Object? isaddress = freezed,
  }) {
    return _then(_Exit(
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime?,
      lat: lat == freezed ? _value.lat : lat as double?,
      lon: lon == freezed ? _value.lon : lon as double?,
      name: name == freezed ? _value.name : name as String,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String?,
      stopid: stopid == freezed ? _value.stopid : stopid as String?,
      track: track == freezed ? _value.track : track as String?,
      waittime: waittime == freezed ? _value.waittime : waittime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
    ));
  }
}

@JsonSerializable(includeIfNull: false)

/// @nodoc
class _$_Exit extends _Exit {
  const _$_Exit(
      {@JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.arrDelay = 0,
      this.arrival,
      this.lat,
      this.lon,
      required this.name,
      this.sbbName,
      this.stopid,
      this.track,
      this.waittime = 0,
      this.isaddress = false})
      : super._();

  factory _$_Exit.fromJson(Map<String, dynamic> json) =>
      _$_$_ExitFromJson(json);

  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int arrDelay;
  @override
  final DateTime? arrival;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final String name;
  @override
  final String? sbbName;
  @override
  final String? stopid;
  @override
  final String? track;
  @JsonKey(defaultValue: 0)
  @override
  final int waittime;
  @JsonKey(defaultValue: false)
  @override
  final bool isaddress;

  @override
  String toString() {
    return 'SbbExit(arrDelay: $arrDelay, arrival: $arrival, lat: $lat, lon: $lon, name: $name, sbbName: $sbbName, stopid: $stopid, track: $track, waittime: $waittime, isaddress: $isaddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exit &&
            (identical(other.arrDelay, arrDelay) ||
                const DeepCollectionEquality()
                    .equals(other.arrDelay, arrDelay)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.sbbName, sbbName) ||
                const DeepCollectionEquality()
                    .equals(other.sbbName, sbbName)) &&
            (identical(other.stopid, stopid) ||
                const DeepCollectionEquality().equals(other.stopid, stopid)) &&
            (identical(other.track, track) ||
                const DeepCollectionEquality().equals(other.track, track)) &&
            (identical(other.waittime, waittime) ||
                const DeepCollectionEquality()
                    .equals(other.waittime, waittime)) &&
            (identical(other.isaddress, isaddress) ||
                const DeepCollectionEquality()
                    .equals(other.isaddress, isaddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(arrDelay) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(sbbName) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(track) ^
      const DeepCollectionEquality().hash(waittime) ^
      const DeepCollectionEquality().hash(isaddress);

  @JsonKey(ignore: true)
  @override
  _$ExitCopyWith<_Exit> get copyWith =>
      __$ExitCopyWithImpl<_Exit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExitToJson(this);
  }
}

abstract class _Exit extends SbbExit {
  const _Exit._() : super._();
  const factory _Exit(
      {@JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      required String name,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress}) = _$_Exit;

  factory _Exit.fromJson(Map<String, dynamic> json) = _$_Exit.fromJson;

  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  @override
  DateTime? get arrival => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lon => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get sbbName => throw _privateConstructorUsedError;
  @override
  String? get stopid => throw _privateConstructorUsedError;
  @override
  String? get track => throw _privateConstructorUsedError;
  @override
  int get waittime => throw _privateConstructorUsedError;
  @override
  bool get isaddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExitCopyWith<_Exit> get copyWith => throw _privateConstructorUsedError;
}
