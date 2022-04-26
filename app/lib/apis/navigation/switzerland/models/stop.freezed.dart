// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbStop _$SbbStopFromJson(Map<String, dynamic> json) {
  return _SbbStop.fromJson(json);
}

/// @nodoc
mixin _$SbbStop {
  String get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
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
abstract class _$SbbStopCopyWith<$Res> implements $SbbStopCopyWith<$Res> {
  factory _$SbbStopCopyWith(_SbbStop value, $Res Function(_SbbStop) then) =
      __$SbbStopCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? id,
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
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_SbbStop(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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

@JsonSerializable(includeIfNull: false, checked: true, explicitToJson: true)
class _$_SbbStop extends _SbbStop {
  const _$_SbbStop(
      {required this.name,
      this.id,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.arrival,
      this.lat,
      this.lon,
      @IntConverter() this.x,
      @IntConverter() this.y})
      : super._();

  factory _$_SbbStop.fromJson(Map<String, dynamic> json) =>
      _$$_SbbStopFromJson(json);

  @override
  final String name;
  @override
  final String? id;
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
    return 'SbbStop(name: $name, id: $id, departure: $departure, arrival: $arrival, lat: $lat, lon: $lon, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SbbStop &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.departure, departure) &&
            const DeepCollectionEquality().equals(other.arrival, arrival) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lon, lon) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(departure),
      const DeepCollectionEquality().hash(arrival),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lon),
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y));

  @JsonKey(ignore: true)
  @override
  _$SbbStopCopyWith<_SbbStop> get copyWith =>
      __$SbbStopCopyWithImpl<_SbbStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbStopToJson(this);
  }
}

abstract class _SbbStop extends SbbStop {
  const factory _SbbStop(
      {required final String name,
      final String? id,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) final DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) final DateTime? arrival,
      final double? lat,
      final double? lon,
      @IntConverter() final int? x,
      @IntConverter() final int? y}) = _$_SbbStop;
  const _SbbStop._() : super._();

  factory _SbbStop.fromJson(Map<String, dynamic> json) = _$_SbbStop.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
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
