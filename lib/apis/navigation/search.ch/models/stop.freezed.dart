// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbStop _$SbbStopFromJson(Map<String, dynamic> json) {
  return _SbbStop.fromJson(json);
}

/// @nodoc
class _$SbbStopTearOff {
  const _$SbbStopTearOff();

  _SbbStop call(String name,
      {String? id,
      String? stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y}) {
    return _SbbStop(
      name,
      id: id,
      stopid: stopid,
      departure: departure,
      arrival: arrival,
      lat: lat,
      lon: lon,
      x: x,
      y: y,
    );
  }

  SbbStop fromJson(Map<String, Object> json) {
    return SbbStop.fromJson(json);
  }
}

/// @nodoc
const $SbbStop = _$SbbStopTearOff();

/// @nodoc
mixin _$SbbStop {
  String get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get stopid => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? get departure => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? get arrival => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  @IntConverter()
  int? get x => throw _privateConstructorUsedError;
  @IntConverter()
  int? get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbStopCopyWith<SbbStop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbStopCopyWith<$Res> {
  factory $SbbStopCopyWith(SbbStop value, $Res Function(SbbStop) then) =
      _$SbbStopCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? id,
      String? stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y});
}

/// @nodoc
class _$SbbStopCopyWithImpl<$Res> implements $SbbStopCopyWith<$Res> {
  _$SbbStopCopyWithImpl(this._value, this._then);

  final SbbStop _value;
  // ignore: unused_field
  final $Res Function(SbbStop) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? stopid = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String?,
      stopid: stopid == freezed ? _value.stopid : stopid as String?,
      departure:
          departure == freezed ? _value.departure : departure as DateTime?,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime?,
      lat: lat == freezed ? _value.lat : lat as double?,
      lon: lon == freezed ? _value.lon : lon as double?,
      x: x == freezed ? _value.x : x as int?,
      y: y == freezed ? _value.y : y as int?,
    ));
  }
}

/// @nodoc
abstract class _$SbbStopCopyWith<$Res> implements $SbbStopCopyWith<$Res> {
  factory _$SbbStopCopyWith(_SbbStop value, $Res Function(_SbbStop) then) =
      __$SbbStopCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? id,
      String? stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y});
}

/// @nodoc
class __$SbbStopCopyWithImpl<$Res> extends _$SbbStopCopyWithImpl<$Res>
    implements _$SbbStopCopyWith<$Res> {
  __$SbbStopCopyWithImpl(_SbbStop _value, $Res Function(_SbbStop) _then)
      : super(_value, (v) => _then(v as _SbbStop));

  @override
  _SbbStop get _value => super._value as _SbbStop;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? stopid = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_SbbStop(
      name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as String?,
      stopid: stopid == freezed ? _value.stopid : stopid as String?,
      departure:
          departure == freezed ? _value.departure : departure as DateTime?,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime?,
      lat: lat == freezed ? _value.lat : lat as double?,
      lon: lon == freezed ? _value.lon : lon as double?,
      x: x == freezed ? _value.x : x as int?,
      y: y == freezed ? _value.y : y as int?,
    ));
  }
}

@JsonSerializable(includeIfNull: false, checked: true)

/// @nodoc
class _$_SbbStop extends _SbbStop {
  const _$_SbbStop(this.name,
      {this.id,
      this.stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.arrival,
      this.lat,
      this.lon,
      @IntConverter() this.x,
      @IntConverter() this.y})
      : super._();

  factory _$_SbbStop.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbStopFromJson(json);

  @override
  final String name;
  @override
  final String? id;
  @override
  final String? stopid;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? departure;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? arrival;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  @IntConverter()
  final int? x;
  @override
  @IntConverter()
  final int? y;

  @override
  String toString() {
    return 'SbbStop(name: $name, id: $id, stopid: $stopid, departure: $departure, arrival: $arrival, lat: $lat, lon: $lon, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbStop &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.stopid, stopid) ||
                const DeepCollectionEquality().equals(other.stopid, stopid)) &&
            (identical(other.departure, departure) ||
                const DeepCollectionEquality()
                    .equals(other.departure, departure)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(departure) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

  @JsonKey(ignore: true)
  @override
  _$SbbStopCopyWith<_SbbStop> get copyWith =>
      __$SbbStopCopyWithImpl<_SbbStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbStopToJson(this);
  }
}

abstract class _SbbStop extends SbbStop {
  const _SbbStop._() : super._();
  const factory _SbbStop(String name,
      {String? id,
      String? stopid,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y}) = _$_SbbStop;

  factory _SbbStop.fromJson(Map<String, dynamic> json) = _$_SbbStop.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get stopid => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? get departure => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? get arrival => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lon => throw _privateConstructorUsedError;
  @override
  @IntConverter()
  int? get x => throw _privateConstructorUsedError;
  @override
  @IntConverter()
  int? get y => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbStopCopyWith<_SbbStop> get copyWith =>
      throw _privateConstructorUsedError;
}
