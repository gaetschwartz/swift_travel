// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Exit _$ExitFromJson(Map<String, dynamic> json) {
  return _Exit.fromJson(json);
}

/// @nodoc
class _$ExitTearOff {
  const _$ExitTearOff();

// ignore: unused_element
  _Exit call(
      {DateTime arrival,
      String name,
      String stopid,
      int waittime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon}) {
    return _Exit(
      arrival: arrival,
      name: name,
      stopid: stopid,
      waittime: waittime,
      isaddress: isaddress,
      sbbName: sbbName,
      lat: lat,
      lon: lon,
    );
  }

// ignore: unused_element
  Exit fromJson(Map<String, Object> json) {
    return Exit.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Exit = _$ExitTearOff();

/// @nodoc
mixin _$Exit {
  DateTime get arrival;
  String get name;
  String get stopid;
  int get waittime;
  bool get isaddress;
  String get sbbName;
  double get lat;
  double get lon;

  Map<String, dynamic> toJson();
  $ExitCopyWith<Exit> get copyWith;
}

/// @nodoc
abstract class $ExitCopyWith<$Res> {
  factory $ExitCopyWith(Exit value, $Res Function(Exit) then) =
      _$ExitCopyWithImpl<$Res>;
  $Res call(
      {DateTime arrival,
      String name,
      String stopid,
      int waittime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon});
}

/// @nodoc
class _$ExitCopyWithImpl<$Res> implements $ExitCopyWith<$Res> {
  _$ExitCopyWithImpl(this._value, this._then);

  final Exit _value;
  // ignore: unused_field
  final $Res Function(Exit) _then;

  @override
  $Res call({
    Object arrival = freezed,
    Object name = freezed,
    Object stopid = freezed,
    Object waittime = freezed,
    Object isaddress = freezed,
    Object sbbName = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_value.copyWith(
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      name: name == freezed ? _value.name : name as String,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      waittime: waittime == freezed ? _value.waittime : waittime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

/// @nodoc
abstract class _$ExitCopyWith<$Res> implements $ExitCopyWith<$Res> {
  factory _$ExitCopyWith(_Exit value, $Res Function(_Exit) then) =
      __$ExitCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime arrival,
      String name,
      String stopid,
      int waittime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon});
}

/// @nodoc
class __$ExitCopyWithImpl<$Res> extends _$ExitCopyWithImpl<$Res>
    implements _$ExitCopyWith<$Res> {
  __$ExitCopyWithImpl(_Exit _value, $Res Function(_Exit) _then)
      : super(_value, (v) => _then(v as _Exit));

  @override
  _Exit get _value => super._value as _Exit;

  @override
  $Res call({
    Object arrival = freezed,
    Object name = freezed,
    Object stopid = freezed,
    Object waittime = freezed,
    Object isaddress = freezed,
    Object sbbName = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_Exit(
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      name: name == freezed ? _value.name : name as String,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      waittime: waittime == freezed ? _value.waittime : waittime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Exit implements _Exit {
  _$_Exit(
      {this.arrival,
      this.name,
      this.stopid,
      this.waittime,
      this.isaddress,
      this.sbbName,
      this.lat,
      this.lon});

  factory _$_Exit.fromJson(Map<String, dynamic> json) =>
      _$_$_ExitFromJson(json);

  @override
  final DateTime arrival;
  @override
  final String name;
  @override
  final String stopid;
  @override
  final int waittime;
  @override
  final bool isaddress;
  @override
  final String sbbName;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'Exit(arrival: $arrival, name: $name, stopid: $stopid, waittime: $waittime, isaddress: $isaddress, sbbName: $sbbName, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exit &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.stopid, stopid) ||
                const DeepCollectionEquality().equals(other.stopid, stopid)) &&
            (identical(other.waittime, waittime) ||
                const DeepCollectionEquality()
                    .equals(other.waittime, waittime)) &&
            (identical(other.isaddress, isaddress) ||
                const DeepCollectionEquality()
                    .equals(other.isaddress, isaddress)) &&
            (identical(other.sbbName, sbbName) ||
                const DeepCollectionEquality()
                    .equals(other.sbbName, sbbName)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(waittime) ^
      const DeepCollectionEquality().hash(isaddress) ^
      const DeepCollectionEquality().hash(sbbName) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @override
  _$ExitCopyWith<_Exit> get copyWith =>
      __$ExitCopyWithImpl<_Exit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExitToJson(this);
  }
}

abstract class _Exit implements Exit {
  factory _Exit(
      {DateTime arrival,
      String name,
      String stopid,
      int waittime,
      bool isaddress,
      String sbbName,
      double lat,
      double lon}) = _$_Exit;

  factory _Exit.fromJson(Map<String, dynamic> json) = _$_Exit.fromJson;

  @override
  DateTime get arrival;
  @override
  String get name;
  @override
  String get stopid;
  @override
  int get waittime;
  @override
  bool get isaddress;
  @override
  String get sbbName;
  @override
  double get lat;
  @override
  double get lon;
  @override
  _$ExitCopyWith<_Exit> get copyWith;
}
