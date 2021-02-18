// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

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

  Exit fromJson(Map<String, Object> json) {
    return Exit.fromJson(json);
  }
}

/// @nodoc
const $Exit = _$ExitTearOff();

/// @nodoc
mixin _$Exit {
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay;
  DateTime? get arrival;
  double? get lat;
  double? get lon;
  String get name;
  String? get sbbName;
  String? get stopid;
  String? get track;
  int get waittime;
  bool get isaddress;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ExitCopyWith<Exit> get copyWith;
}

/// @nodoc
abstract class $ExitCopyWith<$Res> {
  factory $ExitCopyWith(Exit value, $Res Function(Exit) then) =
      _$ExitCopyWithImpl<$Res>;
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
class _$ExitCopyWithImpl<$Res> implements $ExitCopyWith<$Res> {
  _$ExitCopyWithImpl(this._value, this._then);

  final Exit _value;
  // ignore: unused_field
  final $Res Function(Exit) _then;

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
abstract class _$ExitCopyWith<$Res> implements $ExitCopyWith<$Res> {
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
class __$ExitCopyWithImpl<$Res> extends _$ExitCopyWithImpl<$Res>
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
class _$_Exit implements _Exit {
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
      this.isaddress = false});

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
    return 'Exit(arrDelay: $arrDelay, arrival: $arrival, lat: $lat, lon: $lon, name: $name, sbbName: $sbbName, stopid: $stopid, track: $track, waittime: $waittime, isaddress: $isaddress)';
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

abstract class _Exit implements Exit {
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
  int get arrDelay;
  @override
  DateTime? get arrival;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  String get name;
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
  @JsonKey(ignore: true)
  _$ExitCopyWith<_Exit> get copyWith;
}
