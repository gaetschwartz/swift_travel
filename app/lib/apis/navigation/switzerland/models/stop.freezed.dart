// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'name')
  String? get sbbName => throw _privateConstructorUsedError;
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
      _$SbbStopCopyWithImpl<$Res, SbbStop>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? sbbName,
      String? id,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y});
}

/// @nodoc
class _$SbbStopCopyWithImpl<$Res, $Val extends SbbStop>
    implements $SbbStopCopyWith<$Res> {
  _$SbbStopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sbbName = freezed,
    Object? id = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      sbbName: freezed == sbbName
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_SbbStopCopyWith<$Res> implements $SbbStopCopyWith<$Res> {
  factory _$$_SbbStopCopyWith(
          _$_SbbStop value, $Res Function(_$_SbbStop) then) =
      __$$_SbbStopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? sbbName,
      String? id,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? arrival,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y});
}

/// @nodoc
class __$$_SbbStopCopyWithImpl<$Res>
    extends _$SbbStopCopyWithImpl<$Res, _$_SbbStop>
    implements _$$_SbbStopCopyWith<$Res> {
  __$$_SbbStopCopyWithImpl(_$_SbbStop _value, $Res Function(_$_SbbStop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sbbName = freezed,
    Object? id = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$_SbbStop(
      sbbName: freezed == sbbName
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

@JsonSerializable(includeIfNull: false, checked: true, explicitToJson: true)
class _$_SbbStop extends _SbbStop {
  const _$_SbbStop(
      {@JsonKey(name: 'name') required this.sbbName,
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
  @JsonKey(name: 'name')
  final String? sbbName;
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
    return 'SbbStop(sbbName: $sbbName, id: $id, departure: $departure, arrival: $arrival, lat: $lat, lon: $lon, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SbbStop &&
            (identical(other.sbbName, sbbName) || other.sbbName == sbbName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sbbName, id, departure, arrival, lat, lon, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SbbStopCopyWith<_$_SbbStop> get copyWith =>
      __$$_SbbStopCopyWithImpl<_$_SbbStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbStopToJson(
      this,
    );
  }
}

abstract class _SbbStop extends SbbStop {
  const factory _SbbStop(
      {@JsonKey(name: 'name') required final String? sbbName,
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
  @JsonKey(name: 'name')
  String? get sbbName;
  @override
  String? get id;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? get departure;
  @override
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime? get arrival;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @IntConverter()
  int? get x;
  @override
  @IntConverter()
  int? get y;
  @override
  @JsonKey(ignore: true)
  _$$_SbbStopCopyWith<_$_SbbStop> get copyWith =>
      throw _privateConstructorUsedError;
}
