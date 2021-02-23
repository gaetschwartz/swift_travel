// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subsequent_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbSubsequentStop _$SbbSubsequentStopFromJson(Map<String, dynamic> json) {
  return _SbbSubsequentStop.fromJson(json);
}

/// @nodoc
class _$SbbSubsequentStopTearOff {
  const _$SbbSubsequentStopTearOff();

  _SbbSubsequentStop call(
      {required String name,
      String? id,
      DateTime? dep,
      DateTime? arr,
      double? lat,
      double? lon,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int arrDelay}) {
    return _SbbSubsequentStop(
      name: name,
      id: id,
      dep: dep,
      arr: arr,
      lat: lat,
      lon: lon,
      depDelay: depDelay,
      arrDelay: arrDelay,
    );
  }

  SbbSubsequentStop fromJson(Map<String, Object> json) {
    return SbbSubsequentStop.fromJson(json);
  }
}

/// @nodoc
const $SbbSubsequentStop = _$SbbSubsequentStopTearOff();

/// @nodoc
mixin _$SbbSubsequentStop {
  String get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  DateTime? get dep => throw _privateConstructorUsedError;
  DateTime? get arr => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbSubsequentStopCopyWith<SbbSubsequentStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbSubsequentStopCopyWith<$Res> {
  factory $SbbSubsequentStopCopyWith(
          SbbSubsequentStop value, $Res Function(SbbSubsequentStop) then) =
      _$SbbSubsequentStopCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? id,
      DateTime? dep,
      DateTime? arr,
      double? lat,
      double? lon,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});
}

/// @nodoc
class _$SbbSubsequentStopCopyWithImpl<$Res>
    implements $SbbSubsequentStopCopyWith<$Res> {
  _$SbbSubsequentStopCopyWithImpl(this._value, this._then);

  final SbbSubsequentStop _value;
  // ignore: unused_field
  final $Res Function(SbbSubsequentStop) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? dep = freezed,
    Object? arr = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String?,
      dep: dep == freezed ? _value.dep : dep as DateTime?,
      arr: arr == freezed ? _value.arr : arr as DateTime?,
      lat: lat == freezed ? _value.lat : lat as double?,
      lon: lon == freezed ? _value.lon : lon as double?,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
    ));
  }
}

/// @nodoc
abstract class _$SbbSubsequentStopCopyWith<$Res>
    implements $SbbSubsequentStopCopyWith<$Res> {
  factory _$SbbSubsequentStopCopyWith(
          _SbbSubsequentStop value, $Res Function(_SbbSubsequentStop) then) =
      __$SbbSubsequentStopCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? id,
      DateTime? dep,
      DateTime? arr,
      double? lat,
      double? lon,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});
}

/// @nodoc
class __$SbbSubsequentStopCopyWithImpl<$Res>
    extends _$SbbSubsequentStopCopyWithImpl<$Res>
    implements _$SbbSubsequentStopCopyWith<$Res> {
  __$SbbSubsequentStopCopyWithImpl(
      _SbbSubsequentStop _value, $Res Function(_SbbSubsequentStop) _then)
      : super(_value, (v) => _then(v as _SbbSubsequentStop));

  @override
  _SbbSubsequentStop get _value => super._value as _SbbSubsequentStop;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? dep = freezed,
    Object? arr = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
  }) {
    return _then(_SbbSubsequentStop(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String?,
      dep: dep == freezed ? _value.dep : dep as DateTime?,
      arr: arr == freezed ? _value.arr : arr as DateTime?,
      lat: lat == freezed ? _value.lat : lat as double?,
      lon: lon == freezed ? _value.lon : lon as double?,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SbbSubsequentStop implements _SbbSubsequentStop {
  const _$_SbbSubsequentStop(
      {required this.name,
      this.id,
      this.dep,
      this.arr,
      this.lat,
      this.lon,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required this.depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          required this.arrDelay});

  factory _$_SbbSubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbSubsequentStopFromJson(json);

  @override
  final String name;
  @override
  final String? id;
  @override
  final DateTime? dep;
  @override
  final DateTime? arr;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int depDelay;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int arrDelay;

  @override
  String toString() {
    return 'SbbSubsequentStop(name: $name, id: $id, dep: $dep, arr: $arr, lat: $lat, lon: $lon, depDelay: $depDelay, arrDelay: $arrDelay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbSubsequentStop &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.dep, dep) ||
                const DeepCollectionEquality().equals(other.dep, dep)) &&
            (identical(other.arr, arr) ||
                const DeepCollectionEquality().equals(other.arr, arr)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.depDelay, depDelay) ||
                const DeepCollectionEquality()
                    .equals(other.depDelay, depDelay)) &&
            (identical(other.arrDelay, arrDelay) ||
                const DeepCollectionEquality()
                    .equals(other.arrDelay, arrDelay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(dep) ^
      const DeepCollectionEquality().hash(arr) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(depDelay) ^
      const DeepCollectionEquality().hash(arrDelay);

  @JsonKey(ignore: true)
  @override
  _$SbbSubsequentStopCopyWith<_SbbSubsequentStop> get copyWith =>
      __$SbbSubsequentStopCopyWithImpl<_SbbSubsequentStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbSubsequentStopToJson(this);
  }
}

abstract class _SbbSubsequentStop implements SbbSubsequentStop {
  const factory _SbbSubsequentStop(
      {required String name,
      String? id,
      DateTime? dep,
      DateTime? arr,
      double? lat,
      double? lon,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int arrDelay}) = _$_SbbSubsequentStop;

  factory _SbbSubsequentStop.fromJson(Map<String, dynamic> json) =
      _$_SbbSubsequentStop.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  DateTime? get dep => throw _privateConstructorUsedError;
  @override
  DateTime? get arr => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lon => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbSubsequentStopCopyWith<_SbbSubsequentStop> get copyWith =>
      throw _privateConstructorUsedError;
}
