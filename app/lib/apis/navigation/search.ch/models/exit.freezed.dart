// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbExit _$SbbExitFromJson(Map<String, dynamic> json) {
  return _Exit.fromJson(json);
}

/// @nodoc
class _$SbbExitTearOff {
  const _$SbbExitTearOff();

  _Exit call(
      {required String name,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay = 0,
      DateTime? arrival,
      double? lat,
      double? lon,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime = 0,
      bool isaddress = false,
      @IntConverter()
          int? x,
      @IntConverter()
          int? y}) {
    return _Exit(
      name: name,
      arrDelay: arrDelay,
      arrival: arrival,
      lat: lat,
      lon: lon,
      sbbName: sbbName,
      stopid: stopid,
      track: track,
      waittime: waittime,
      isaddress: isaddress,
      x: x,
      y: y,
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
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  DateTime? get arrival => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  String? get sbbName => throw _privateConstructorUsedError;
  String? get stopid => throw _privateConstructorUsedError;
  String? get track => throw _privateConstructorUsedError;
  int get waittime => throw _privateConstructorUsedError;
  bool get isaddress => throw _privateConstructorUsedError;
  @IntConverter()
  int? get x => throw _privateConstructorUsedError;
  @IntConverter()
  int? get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbExitCopyWith<SbbExit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbExitCopyWith<$Res> {
  factory $SbbExitCopyWith(SbbExit value, $Res Function(SbbExit) then) =
      _$SbbExitCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress,
      @IntConverter()
          int? x,
      @IntConverter()
          int? y});
}

/// @nodoc
class _$SbbExitCopyWithImpl<$Res> implements $SbbExitCopyWith<$Res> {
  _$SbbExitCopyWithImpl(this._value, this._then);

  final SbbExit _value;
  // ignore: unused_field
  final $Res Function(SbbExit) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? arrDelay = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? sbbName = freezed,
    Object? stopid = freezed,
    Object? track = freezed,
    Object? waittime = freezed,
    Object? isaddress = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arrDelay: arrDelay == freezed
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int,
      arrival: arrival == freezed
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbName: sbbName == freezed
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: stopid == freezed
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      waittime: waittime == freezed
          ? _value.waittime
          : waittime // ignore: cast_nullable_to_non_nullable
              as int,
      isaddress: isaddress == freezed
          ? _value.isaddress
          : isaddress // ignore: cast_nullable_to_non_nullable
              as bool,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ExitCopyWith<$Res> implements $SbbExitCopyWith<$Res> {
  factory _$ExitCopyWith(_Exit value, $Res Function(_Exit) then) =
      __$ExitCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress,
      @IntConverter()
          int? x,
      @IntConverter()
          int? y});
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
    Object? name = freezed,
    Object? arrDelay = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? sbbName = freezed,
    Object? stopid = freezed,
    Object? track = freezed,
    Object? waittime = freezed,
    Object? isaddress = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_Exit(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arrDelay: arrDelay == freezed
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int,
      arrival: arrival == freezed
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbName: sbbName == freezed
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: stopid == freezed
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      waittime: waittime == freezed
          ? _value.waittime
          : waittime // ignore: cast_nullable_to_non_nullable
              as int,
      isaddress: isaddress == freezed
          ? _value.isaddress
          : isaddress // ignore: cast_nullable_to_non_nullable
              as bool,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false, checked: true)
class _$_Exit extends _Exit {
  _$_Exit(
      {required this.name,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.arrDelay = 0,
      this.arrival,
      this.lat,
      this.lon,
      this.sbbName,
      this.stopid,
      this.track,
      this.waittime = 0,
      this.isaddress = false,
      @IntConverter()
          this.x,
      @IntConverter()
          this.y})
      : super._();

  factory _$_Exit.fromJson(Map<String, dynamic> json) =>
      _$_$_ExitFromJson(json);

  @override
  final String name;
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
  @IntConverter()
  final int? x;
  @override
  @IntConverter()
  final int? y;

  @override
  String toString() {
    return 'SbbExit(name: $name, arrDelay: $arrDelay, arrival: $arrival, lat: $lat, lon: $lon, sbbName: $sbbName, stopid: $stopid, track: $track, waittime: $waittime, isaddress: $isaddress, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exit &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
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
                    .equals(other.isaddress, isaddress)) &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(arrDelay) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(sbbName) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(track) ^
      const DeepCollectionEquality().hash(waittime) ^
      const DeepCollectionEquality().hash(isaddress) ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

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
  factory _Exit(
      {required String name,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress,
      @IntConverter()
          int? x,
      @IntConverter()
          int? y}) = _$_Exit;
  _Exit._() : super._();

  factory _Exit.fromJson(Map<String, dynamic> json) = _$_Exit.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
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
  @IntConverter()
  int? get x => throw _privateConstructorUsedError;
  @override
  @IntConverter()
  int? get y => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExitCopyWith<_Exit> get copyWith => throw _privateConstructorUsedError;
}
