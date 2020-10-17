// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subsequent_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SubsequentStop _$SubsequentStopFromJson(Map<String, dynamic> json) {
  return _SubsequentStop.fromJson(json);
}

/// @nodoc
class _$SubsequentStopTearOff {
  const _$SubsequentStopTearOff();

// ignore: unused_element
  _SubsequentStop call(String name,
      {String id, DateTime dep, DateTime arr, double lat, double lon}) {
    return _SubsequentStop(
      name,
      id: id,
      dep: dep,
      arr: arr,
      lat: lat,
      lon: lon,
    );
  }

// ignore: unused_element
  SubsequentStop fromJson(Map<String, Object> json) {
    return SubsequentStop.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SubsequentStop = _$SubsequentStopTearOff();

/// @nodoc
mixin _$SubsequentStop {
  String get name;
  String get id;
  DateTime get dep;
  DateTime get arr;
  double get lat;
  double get lon;

  Map<String, dynamic> toJson();
  $SubsequentStopCopyWith<SubsequentStop> get copyWith;
}

/// @nodoc
abstract class $SubsequentStopCopyWith<$Res> {
  factory $SubsequentStopCopyWith(
          SubsequentStop value, $Res Function(SubsequentStop) then) =
      _$SubsequentStopCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String id,
      DateTime dep,
      DateTime arr,
      double lat,
      double lon});
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
    Object name = freezed,
    Object id = freezed,
    Object dep = freezed,
    Object arr = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String,
      dep: dep == freezed ? _value.dep : dep as DateTime,
      arr: arr == freezed ? _value.arr : arr as DateTime,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
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
      String id,
      DateTime dep,
      DateTime arr,
      double lat,
      double lon});
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
    Object name = freezed,
    Object id = freezed,
    Object dep = freezed,
    Object arr = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_SubsequentStop(
      name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String,
      dep: dep == freezed ? _value.dep : dep as DateTime,
      arr: arr == freezed ? _value.arr : arr as DateTime,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SubsequentStop implements _SubsequentStop {
  _$_SubsequentStop(this.name,
      {this.id, this.dep, this.arr, this.lat, this.lon})
      : assert(name != null);

  factory _$_SubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$_$_SubsequentStopFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final DateTime dep;
  @override
  final DateTime arr;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'SubsequentStop(name: $name, id: $id, dep: $dep, arr: $arr, lat: $lat, lon: $lon)';
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
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(dep) ^
      const DeepCollectionEquality().hash(arr) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @override
  _$SubsequentStopCopyWith<_SubsequentStop> get copyWith =>
      __$SubsequentStopCopyWithImpl<_SubsequentStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubsequentStopToJson(this);
  }
}

abstract class _SubsequentStop implements SubsequentStop {
  factory _SubsequentStop(String name,
      {String id,
      DateTime dep,
      DateTime arr,
      double lat,
      double lon}) = _$_SubsequentStop;

  factory _SubsequentStop.fromJson(Map<String, dynamic> json) =
      _$_SubsequentStop.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  DateTime get dep;
  @override
  DateTime get arr;
  @override
  double get lat;
  @override
  double get lon;
  @override
  _$SubsequentStopCopyWith<_SubsequentStop> get copyWith;
}
