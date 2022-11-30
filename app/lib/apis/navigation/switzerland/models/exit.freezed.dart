// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbExit _$SbbExitFromJson(Map<String, dynamic> json) {
  return _Exit.fromJson(json);
}

/// @nodoc
mixin _$SbbExit {
  String get name => throw _privateConstructorUsedError;
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  int? get arrDelay => throw _privateConstructorUsedError;
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
      _$SbbExitCopyWithImpl<$Res, SbbExit>;
  @useResult
  $Res call(
      {String name,
      @DelayConverter() @JsonKey(name: 'arr_delay') int? arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress,
      @IntConverter() int? x,
      @IntConverter() int? y});
}

/// @nodoc
class _$SbbExitCopyWithImpl<$Res, $Val extends SbbExit>
    implements $SbbExitCopyWith<$Res> {
  _$SbbExitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? arrDelay = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? sbbName = freezed,
    Object? stopid = freezed,
    Object? track = freezed,
    Object? waittime = null,
    Object? isaddress = null,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arrDelay: freezed == arrDelay
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbName: freezed == sbbName
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: freezed == stopid
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      waittime: null == waittime
          ? _value.waittime
          : waittime // ignore: cast_nullable_to_non_nullable
              as int,
      isaddress: null == isaddress
          ? _value.isaddress
          : isaddress // ignore: cast_nullable_to_non_nullable
              as bool,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExitCopyWith<$Res> implements $SbbExitCopyWith<$Res> {
  factory _$$_ExitCopyWith(_$_Exit value, $Res Function(_$_Exit) then) =
      __$$_ExitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @DelayConverter() @JsonKey(name: 'arr_delay') int? arrDelay,
      DateTime? arrival,
      double? lat,
      double? lon,
      String? sbbName,
      String? stopid,
      String? track,
      int waittime,
      bool isaddress,
      @IntConverter() int? x,
      @IntConverter() int? y});
}

/// @nodoc
class __$$_ExitCopyWithImpl<$Res> extends _$SbbExitCopyWithImpl<$Res, _$_Exit>
    implements _$$_ExitCopyWith<$Res> {
  __$$_ExitCopyWithImpl(_$_Exit _value, $Res Function(_$_Exit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? arrDelay = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? sbbName = freezed,
    Object? stopid = freezed,
    Object? track = freezed,
    Object? waittime = null,
    Object? isaddress = null,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$_Exit(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arrDelay: freezed == arrDelay
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbName: freezed == sbbName
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: freezed == stopid
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      waittime: null == waittime
          ? _value.waittime
          : waittime // ignore: cast_nullable_to_non_nullable
              as int,
      isaddress: null == isaddress
          ? _value.isaddress
          : isaddress // ignore: cast_nullable_to_non_nullable
              as bool,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: freezed == y
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
      @DelayConverter() @JsonKey(name: 'arr_delay') this.arrDelay,
      this.arrival,
      this.lat,
      this.lon,
      this.sbbName,
      this.stopid,
      this.track,
      this.waittime = 0,
      this.isaddress = false,
      @IntConverter() this.x,
      @IntConverter() this.y})
      : super._();

  factory _$_Exit.fromJson(Map<String, dynamic> json) => _$$_ExitFromJson(json);

  @override
  final String name;
  @override
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  final int? arrDelay;
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
  @override
  @JsonKey()
  final int waittime;
  @override
  @JsonKey()
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
        (other.runtimeType == runtimeType &&
            other is _$_Exit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arrDelay, arrDelay) ||
                other.arrDelay == arrDelay) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.sbbName, sbbName) || other.sbbName == sbbName) &&
            (identical(other.stopid, stopid) || other.stopid == stopid) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.waittime, waittime) ||
                other.waittime == waittime) &&
            (identical(other.isaddress, isaddress) ||
                other.isaddress == isaddress) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, arrDelay, arrival, lat,
      lon, sbbName, stopid, track, waittime, isaddress, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExitCopyWith<_$_Exit> get copyWith =>
      __$$_ExitCopyWithImpl<_$_Exit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExitToJson(
      this,
    );
  }
}

abstract class _Exit extends SbbExit {
  factory _Exit(
      {required final String name,
      @DelayConverter() @JsonKey(name: 'arr_delay') final int? arrDelay,
      final DateTime? arrival,
      final double? lat,
      final double? lon,
      final String? sbbName,
      final String? stopid,
      final String? track,
      final int waittime,
      final bool isaddress,
      @IntConverter() final int? x,
      @IntConverter() final int? y}) = _$_Exit;
  _Exit._() : super._();

  factory _Exit.fromJson(Map<String, dynamic> json) = _$_Exit.fromJson;

  @override
  String get name;
  @override
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  int? get arrDelay;
  @override
  DateTime? get arrival;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  String? get sbbName;
  @override
  String? get stopid;
  @override
  String? get track;
  @override
  int get waittime;
  @override
  bool get isaddress;
  @override
  @IntConverter()
  int? get x;
  @override
  @IntConverter()
  int? get y;
  @override
  @JsonKey(ignore: true)
  _$$_ExitCopyWith<_$_Exit> get copyWith => throw _privateConstructorUsedError;
}
