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

SchStop _$SchStopFromJson(Map<String, dynamic> json) {
  return _SchStop.fromJson(json);
}

/// @nodoc
mixin _$SchStop {
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
  $SchStopCopyWith<SchStop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchStopCopyWith<$Res> {
  factory $SchStopCopyWith(SchStop value, $Res Function(SchStop) then) =
      _$SchStopCopyWithImpl<$Res, SchStop>;
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
class _$SchStopCopyWithImpl<$Res, $Val extends SchStop>
    implements $SchStopCopyWith<$Res> {
  _$SchStopCopyWithImpl(this._value, this._then);

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
abstract class _$$_SchStopCopyWith<$Res> implements $SchStopCopyWith<$Res> {
  factory _$$_SchStopCopyWith(
          _$_SchStop value, $Res Function(_$_SchStop) then) =
      __$$_SchStopCopyWithImpl<$Res>;
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
class __$$_SchStopCopyWithImpl<$Res>
    extends _$SchStopCopyWithImpl<$Res, _$_SchStop>
    implements _$$_SchStopCopyWith<$Res> {
  __$$_SchStopCopyWithImpl(_$_SchStop _value, $Res Function(_$_SchStop) _then)
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
    return _then(_$_SchStop(
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
class _$_SchStop extends _SchStop {
  const _$_SchStop(
      {@JsonKey(name: 'name') required this.sbbName,
      this.id,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) this.arrival,
      this.lat,
      this.lon,
      @IntConverter() this.x,
      @IntConverter() this.y})
      : super._();

  factory _$_SchStop.fromJson(Map<String, dynamic> json) =>
      _$$_SchStopFromJson(json);

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
    return 'SchStop(sbbName: $sbbName, id: $id, departure: $departure, arrival: $arrival, lat: $lat, lon: $lon, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchStop &&
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
  _$$_SchStopCopyWith<_$_SchStop> get copyWith =>
      __$$_SchStopCopyWithImpl<_$_SchStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchStopToJson(
      this,
    );
  }
}

abstract class _SchStop extends SchStop {
  const factory _SchStop(
      {@JsonKey(name: 'name') required final String? sbbName,
      final String? id,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) final DateTime? departure,
      @JsonKey(fromJson: _fromJson, toJson: _toJson) final DateTime? arrival,
      final double? lat,
      final double? lon,
      @IntConverter() final int? x,
      @IntConverter() final int? y}) = _$_SchStop;
  const _SchStop._() : super._();

  factory _SchStop.fromJson(Map<String, dynamic> json) = _$_SchStop.fromJson;

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
  _$$_SchStopCopyWith<_$_SchStop> get copyWith =>
      throw _privateConstructorUsedError;
}
