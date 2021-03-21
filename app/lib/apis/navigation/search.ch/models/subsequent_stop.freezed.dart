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
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay = 0,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay = 0,
      String? id,
      @JsonKey(name: 'dep')
          DateTime? departure,
      @JsonKey(name: 'arr')
          DateTime? arrival,
      double? lat,
      double? lon,
      int? x,
      int? y}) {
    return _SbbSubsequentStop(
      name: name,
      depDelay: depDelay,
      arrDelay: arrDelay,
      id: id,
      departure: departure,
      arrival: arrival,
      lat: lat,
      lon: lon,
      x: x,
      y: y,
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
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'dep')
  DateTime? get departure => throw _privateConstructorUsedError;
  @JsonKey(name: 'arr')
  DateTime? get arrival => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  int? get x => throw _privateConstructorUsedError;
  int? get y => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      String? id,
      @JsonKey(name: 'dep')
          DateTime? departure,
      @JsonKey(name: 'arr')
          DateTime? arrival,
      double? lat,
      double? lon,
      int? x,
      int? y});
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
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
    Object? id = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      depDelay: depDelay == freezed
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int,
      arrDelay: arrDelay == freezed
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: departure == freezed
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$SbbSubsequentStopCopyWith<$Res>
    implements $SbbSubsequentStopCopyWith<$Res> {
  factory _$SbbSubsequentStopCopyWith(
          _SbbSubsequentStop value, $Res Function(_SbbSubsequentStop) then) =
      __$SbbSubsequentStopCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      String? id,
      @JsonKey(name: 'dep')
          DateTime? departure,
      @JsonKey(name: 'arr')
          DateTime? arrival,
      double? lat,
      double? lon,
      int? x,
      int? y});
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
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
    Object? id = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_SbbSubsequentStop(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      depDelay: depDelay == freezed
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int,
      arrDelay: arrDelay == freezed
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: departure == freezed
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

@JsonSerializable()

/// @nodoc
class _$_SbbSubsequentStop extends _SbbSubsequentStop {
  _$_SbbSubsequentStop(
      {required this.name,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.depDelay = 0,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.arrDelay = 0,
      this.id,
      @JsonKey(name: 'dep')
          this.departure,
      @JsonKey(name: 'arr')
          this.arrival,
      this.lat,
      this.lon,
      this.x,
      this.y})
      : super._();

  factory _$_SbbSubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbSubsequentStopFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int depDelay;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int arrDelay;
  @override
  final String? id;
  @override
  @JsonKey(name: 'dep')
  final DateTime? departure;
  @override
  @JsonKey(name: 'arr')
  final DateTime? arrival;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final int? x;
  @override
  final int? y;

  @override
  String toString() {
    return 'SbbSubsequentStop(name: $name, depDelay: $depDelay, arrDelay: $arrDelay, id: $id, departure: $departure, arrival: $arrival, lat: $lat, lon: $lon, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbSubsequentStop &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.depDelay, depDelay) ||
                const DeepCollectionEquality()
                    .equals(other.depDelay, depDelay)) &&
            (identical(other.arrDelay, arrDelay) ||
                const DeepCollectionEquality()
                    .equals(other.arrDelay, arrDelay)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
      const DeepCollectionEquality().hash(depDelay) ^
      const DeepCollectionEquality().hash(arrDelay) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(departure) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

  @JsonKey(ignore: true)
  @override
  _$SbbSubsequentStopCopyWith<_SbbSubsequentStop> get copyWith =>
      __$SbbSubsequentStopCopyWithImpl<_SbbSubsequentStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbSubsequentStopToJson(this);
  }
}

abstract class _SbbSubsequentStop extends SbbSubsequentStop {
  factory _SbbSubsequentStop(
      {required String name,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay,
      String? id,
      @JsonKey(name: 'dep')
          DateTime? departure,
      @JsonKey(name: 'arr')
          DateTime? arrival,
      double? lat,
      double? lon,
      int? x,
      int? y}) = _$_SbbSubsequentStop;
  _SbbSubsequentStop._() : super._();

  factory _SbbSubsequentStop.fromJson(Map<String, dynamic> json) =
      _$_SbbSubsequentStop.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dep')
  DateTime? get departure => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'arr')
  DateTime? get arrival => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lon => throw _privateConstructorUsedError;
  @override
  int? get x => throw _privateConstructorUsedError;
  @override
  int? get y => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbSubsequentStopCopyWith<_SbbSubsequentStop> get copyWith =>
      throw _privateConstructorUsedError;
}
