// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Stop _$StopFromJson(Map<String, dynamic> json) {
  return _Stop.fromJson(json);
}

class _$StopTearOff {
  const _$StopTearOff();

// ignore: unused_element
  _Stop call(String name,
      {String stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime departure}) {
    return _Stop(
      name,
      stopid: stopid,
      departure: departure,
    );
  }
}

// ignore: unused_element
const $Stop = _$StopTearOff();

mixin _$Stop {
  String get name;
  String get stopid;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime get departure;

  Map<String, dynamic> toJson();
  $StopCopyWith<Stop> get copyWith;
}

abstract class $StopCopyWith<$Res> {
  factory $StopCopyWith(Stop value, $Res Function(Stop) then) =
      _$StopCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime departure});
}

class _$StopCopyWithImpl<$Res> implements $StopCopyWith<$Res> {
  _$StopCopyWithImpl(this._value, this._then);

  final Stop _value;
  // ignore: unused_field
  final $Res Function(Stop) _then;

  @override
  $Res call({
    Object name = freezed,
    Object stopid = freezed,
    Object departure = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
    ));
  }
}

abstract class _$StopCopyWith<$Res> implements $StopCopyWith<$Res> {
  factory _$StopCopyWith(_Stop value, $Res Function(_Stop) then) =
      __$StopCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime departure});
}

class __$StopCopyWithImpl<$Res> extends _$StopCopyWithImpl<$Res>
    implements _$StopCopyWith<$Res> {
  __$StopCopyWithImpl(_Stop _value, $Res Function(_Stop) _then)
      : super(_value, (v) => _then(v as _Stop));

  @override
  _Stop get _value => super._value as _Stop;

  @override
  $Res call({
    Object name = freezed,
    Object stopid = freezed,
    Object departure = freezed,
  }) {
    return _then(_Stop(
      name == freezed ? _value.name : name as String,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_Stop implements _Stop {
  _$_Stop(this.name,
      {this.stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.departure})
      : assert(name != null);

  factory _$_Stop.fromJson(Map<String, dynamic> json) =>
      _$_$_StopFromJson(json);

  @override
  final String name;
  @override
  final String stopid;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime departure;

  @override
  String toString() {
    return 'Stop(name: $name, stopid: $stopid, departure: $departure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Stop &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.stopid, stopid) ||
                const DeepCollectionEquality().equals(other.stopid, stopid)) &&
            (identical(other.departure, departure) ||
                const DeepCollectionEquality()
                    .equals(other.departure, departure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(departure);

  @override
  _$StopCopyWith<_Stop> get copyWith =>
      __$StopCopyWithImpl<_Stop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StopToJson(this);
  }
}

abstract class _Stop implements Stop {
  factory _Stop(String name,
          {String stopid,
          @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime departure}) =
      _$_Stop;

  factory _Stop.fromJson(Map<String, dynamic> json) = _$_Stop.fromJson;

  @override
  String get name;
  @override
  String get stopid;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime get departure;
  @override
  _$StopCopyWith<_Stop> get copyWith;
}
