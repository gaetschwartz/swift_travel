// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'geo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GeoResponse _$GeoResponseFromJson(Map<String, dynamic> json) {
  return _GeoResponse.fromJson(json);
}

/// @nodoc
class _$GeoResponseTearOff {
  const _$GeoResponseTearOff();

// ignore: unused_element
  _GeoResponse call(List<GeoResult> results) {
    return _GeoResponse(
      results,
    );
  }

// ignore: unused_element
  GeoResponse fromJson(Map<String, Object> json) {
    return GeoResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GeoResponse = _$GeoResponseTearOff();

/// @nodoc
mixin _$GeoResponse {
  List<GeoResult> get results;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GeoResponseCopyWith<GeoResponse> get copyWith;
}

/// @nodoc
abstract class $GeoResponseCopyWith<$Res> {
  factory $GeoResponseCopyWith(
          GeoResponse value, $Res Function(GeoResponse) then) =
      _$GeoResponseCopyWithImpl<$Res>;
  $Res call({List<GeoResult> results});
}

/// @nodoc
class _$GeoResponseCopyWithImpl<$Res> implements $GeoResponseCopyWith<$Res> {
  _$GeoResponseCopyWithImpl(this._value, this._then);

  final GeoResponse _value;
  // ignore: unused_field
  final $Res Function(GeoResponse) _then;

  @override
  $Res call({
    Object results = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed ? _value.results : results as List<GeoResult>,
    ));
  }
}

/// @nodoc
abstract class _$GeoResponseCopyWith<$Res>
    implements $GeoResponseCopyWith<$Res> {
  factory _$GeoResponseCopyWith(
          _GeoResponse value, $Res Function(_GeoResponse) then) =
      __$GeoResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<GeoResult> results});
}

/// @nodoc
class __$GeoResponseCopyWithImpl<$Res> extends _$GeoResponseCopyWithImpl<$Res>
    implements _$GeoResponseCopyWith<$Res> {
  __$GeoResponseCopyWithImpl(
      _GeoResponse _value, $Res Function(_GeoResponse) _then)
      : super(_value, (v) => _then(v as _GeoResponse));

  @override
  _GeoResponse get _value => super._value as _GeoResponse;

  @override
  $Res call({
    Object results = freezed,
  }) {
    return _then(_GeoResponse(
      results == freezed ? _value.results : results as List<GeoResult>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_GeoResponse implements _GeoResponse {
  _$_GeoResponse(this.results) : assert(results != null);

  factory _$_GeoResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoResponseFromJson(json);

  @override
  final List<GeoResult> results;

  @override
  String toString() {
    return 'GeoResponse(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoResponse &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$GeoResponseCopyWith<_GeoResponse> get copyWith =>
      __$GeoResponseCopyWithImpl<_GeoResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoResponseToJson(this);
  }
}

abstract class _GeoResponse implements GeoResponse {
  factory _GeoResponse(List<GeoResult> results) = _$_GeoResponse;

  factory _GeoResponse.fromJson(Map<String, dynamic> json) =
      _$_GeoResponse.fromJson;

  @override
  List<GeoResult> get results;
  @override
  @JsonKey(ignore: true)
  _$GeoResponseCopyWith<_GeoResponse> get copyWith;
}
