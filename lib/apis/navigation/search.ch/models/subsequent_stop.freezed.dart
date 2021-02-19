// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subsequent_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
SubsequentStop _$SubsequentStopFromJson(Map<String, dynamic> json) {
  return _SubsequentStop.fromJson(json);
}

/// @nodoc
class _$SubsequentStopTearOff {
  const _$SubsequentStopTearOff();

  _SubsequentStop call(
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
    return _SubsequentStop(
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

  SubsequentStop fromJson(Map<String, Object> json) {
    return SubsequentStop.fromJson(json);
  }
}

/// @nodoc
const $SubsequentStop = _$SubsequentStopTearOff();

/// @nodoc
mixin _$SubsequentStop {
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
  $SubsequentStopCopyWith<SubsequentStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubsequentStopCopyWith<$Res> {
  factory $SubsequentStopCopyWith(
          SubsequentStop value, $Res Function(SubsequentStop) then) =
      _$SubsequentStopCopyWithImpl<$Res>;
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
class _$SubsequentStopCopyWithImpl<$Res>
    implements $SubsequentStopCopyWith<$Res> {
  _$SubsequentStopCopyWithImpl(this._value, this._then);

  final SubsequentStop _value;
  // ignore: unused_field
  final $Res Function(SubsequentStop) _then;

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
abstract class _$SubsequentStopCopyWith<$Res>
    implements $SubsequentStopCopyWith<$Res> {
  factory _$SubsequentStopCopyWith(
          _SubsequentStop value, $Res Function(_SubsequentStop) then) =
      __$SubsequentStopCopyWithImpl<$Res>;
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
class __$SubsequentStopCopyWithImpl<$Res>
    extends _$SubsequentStopCopyWithImpl<$Res>
    implements _$SubsequentStopCopyWith<$Res> {
  __$SubsequentStopCopyWithImpl(
      _SubsequentStop _value, $Res Function(_SubsequentStop) _then)
      : super(_value, (v) => _then(v as _SubsequentStop));

  @override
  _SubsequentStop get _value => super._value as _SubsequentStop;

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
    return _then(_SubsequentStop(
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
class _$_SubsequentStop implements _SubsequentStop {
  const _$_SubsequentStop(
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

  factory _$_SubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$_$_SubsequentStopFromJson(json);

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
    return 'SubsequentStop(name: $name, id: $id, dep: $dep, arr: $arr, lat: $lat, lon: $lon, depDelay: $depDelay, arrDelay: $arrDelay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubsequentStop &&
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
  _$SubsequentStopCopyWith<_SubsequentStop> get copyWith =>
      __$SubsequentStopCopyWithImpl<_SubsequentStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubsequentStopToJson(this);
  }
}

abstract class _SubsequentStop implements SubsequentStop {
  const factory _SubsequentStop(
      {required String name,
      String? id,
      DateTime? dep,
      DateTime? arr,
      double? lat,
      double? lon,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int arrDelay}) = _$_SubsequentStop;

  factory _SubsequentStop.fromJson(Map<String, dynamic> json) =
      _$_SubsequentStop.fromJson;

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
  _$SubsequentStopCopyWith<_SubsequentStop> get copyWith =>
      throw _privateConstructorUsedError;
}
