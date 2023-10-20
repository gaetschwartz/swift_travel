// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatLon _$LatLonFromJson(Map<String, dynamic> json) {
  return _LatLon.fromJson(json);
}

/// @nodoc
mixin _$LatLon {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLonCopyWith<LatLon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLonCopyWith<$Res> {
  factory $LatLonCopyWith(LatLon value, $Res Function(LatLon) then) =
      _$LatLonCopyWithImpl<$Res, LatLon>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$LatLonCopyWithImpl<$Res, $Val extends LatLon>
    implements $LatLonCopyWith<$Res> {
  _$LatLonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LatLonImplCopyWith<$Res> implements $LatLonCopyWith<$Res> {
  factory _$$LatLonImplCopyWith(
          _$LatLonImpl value, $Res Function(_$LatLonImpl) then) =
      __$$LatLonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$LatLonImplCopyWithImpl<$Res>
    extends _$LatLonCopyWithImpl<$Res, _$LatLonImpl>
    implements _$$LatLonImplCopyWith<$Res> {
  __$$LatLonImplCopyWithImpl(
      _$LatLonImpl _value, $Res Function(_$LatLonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$LatLonImpl(
      null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatLonImpl extends _LatLon {
  const _$LatLonImpl(this.lat, this.lon) : super._();

  factory _$LatLonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatLonImplFromJson(json);

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'LatLon(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatLonImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LatLonImplCopyWith<_$LatLonImpl> get copyWith =>
      __$$LatLonImplCopyWithImpl<_$LatLonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatLonImplToJson(
      this,
    );
  }
}

abstract class _LatLon extends LatLon {
  const factory _LatLon(final double lat, final double lon) = _$LatLonImpl;
  const _LatLon._() : super._();

  factory _LatLon.fromJson(Map<String, dynamic> json) = _$LatLonImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$LatLonImplCopyWith<_$LatLonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LV03Coordinates {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LV03CoordinatesCopyWith<LV03Coordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LV03CoordinatesCopyWith<$Res> {
  factory $LV03CoordinatesCopyWith(
          LV03Coordinates value, $Res Function(LV03Coordinates) then) =
      _$LV03CoordinatesCopyWithImpl<$Res, LV03Coordinates>;
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class _$LV03CoordinatesCopyWithImpl<$Res, $Val extends LV03Coordinates>
    implements $LV03CoordinatesCopyWith<$Res> {
  _$LV03CoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LV03CoordinatesImplCopyWith<$Res>
    implements $LV03CoordinatesCopyWith<$Res> {
  factory _$$LV03CoordinatesImplCopyWith(_$LV03CoordinatesImpl value,
          $Res Function(_$LV03CoordinatesImpl) then) =
      __$$LV03CoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class __$$LV03CoordinatesImplCopyWithImpl<$Res>
    extends _$LV03CoordinatesCopyWithImpl<$Res, _$LV03CoordinatesImpl>
    implements _$$LV03CoordinatesImplCopyWith<$Res> {
  __$$LV03CoordinatesImplCopyWithImpl(
      _$LV03CoordinatesImpl _value, $Res Function(_$LV03CoordinatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$LV03CoordinatesImpl(
      null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LV03CoordinatesImpl extends _LV03Coordinates {
  const _$LV03CoordinatesImpl(this.x, this.y) : super._();

  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'LV03Coordinates(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LV03CoordinatesImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LV03CoordinatesImplCopyWith<_$LV03CoordinatesImpl> get copyWith =>
      __$$LV03CoordinatesImplCopyWithImpl<_$LV03CoordinatesImpl>(
          this, _$identity);
}

abstract class _LV03Coordinates extends LV03Coordinates {
  const factory _LV03Coordinates(final int x, final int y) =
      _$LV03CoordinatesImpl;
  const _LV03Coordinates._() : super._();

  @override
  int get x;
  @override
  int get y;
  @override
  @JsonKey(ignore: true)
  _$$LV03CoordinatesImplCopyWith<_$LV03CoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
