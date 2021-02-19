// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'local_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
LocalRoute _$LocalRouteFromJson(Map<String, dynamic> json) {
  return _LocalRoute.fromJson(json);
}

/// @nodoc
class _$LocalRouteTearOff {
  const _$LocalRouteTearOff();

  _LocalRoute call(String from, String to,
      {String? displayName, DateTime? timestamp}) {
    return _LocalRoute(
      from,
      to,
      displayName: displayName,
      timestamp: timestamp,
    );
  }

  LocalRoute fromJson(Map<String, Object> json) {
    return LocalRoute.fromJson(json);
  }
}

/// @nodoc
const $LocalRoute = _$LocalRouteTearOff();

/// @nodoc
mixin _$LocalRoute {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalRouteCopyWith<LocalRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalRouteCopyWith<$Res> {
  factory $LocalRouteCopyWith(
          LocalRoute value, $Res Function(LocalRoute) then) =
      _$LocalRouteCopyWithImpl<$Res>;
  $Res call({String from, String to, String? displayName, DateTime? timestamp});
}

/// @nodoc
class _$LocalRouteCopyWithImpl<$Res> implements $LocalRouteCopyWith<$Res> {
  _$LocalRouteCopyWithImpl(this._value, this._then);

  final LocalRoute _value;
  // ignore: unused_field
  final $Res Function(LocalRoute) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$LocalRouteCopyWith<$Res> implements $LocalRouteCopyWith<$Res> {
  factory _$LocalRouteCopyWith(
          _LocalRoute value, $Res Function(_LocalRoute) then) =
      __$LocalRouteCopyWithImpl<$Res>;
  @override
  $Res call({String from, String to, String? displayName, DateTime? timestamp});
}

/// @nodoc
class __$LocalRouteCopyWithImpl<$Res> extends _$LocalRouteCopyWithImpl<$Res>
    implements _$LocalRouteCopyWith<$Res> {
  __$LocalRouteCopyWithImpl(
      _LocalRoute _value, $Res Function(_LocalRoute) _then)
      : super(_value, (v) => _then(v as _LocalRoute));

  @override
  _LocalRoute get _value => super._value as _LocalRoute;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_LocalRoute(
      from == freezed ? _value.from : from as String,
      to == freezed ? _value.to : to as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime?,
    ));
  }
}

@JsonSerializable(includeIfNull: false)

/// @nodoc
class _$_LocalRoute implements _LocalRoute {
  const _$_LocalRoute(this.from, this.to, {this.displayName, this.timestamp});

  factory _$_LocalRoute.fromJson(Map<String, dynamic> json) =>
      _$_$_LocalRouteFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final String? displayName;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'LocalRoute(from: $from, to: $to, displayName: $displayName, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalRoute &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$LocalRouteCopyWith<_LocalRoute> get copyWith =>
      __$LocalRouteCopyWithImpl<_LocalRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocalRouteToJson(this);
  }
}

abstract class _LocalRoute implements LocalRoute {
  const factory _LocalRoute(String from, String to,
      {String? displayName, DateTime? timestamp}) = _$_LocalRoute;

  factory _LocalRoute.fromJson(Map<String, dynamic> json) =
      _$_LocalRoute.fromJson;

  @override
  String get from => throw _privateConstructorUsedError;
  @override
  String get to => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalRouteCopyWith<_LocalRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
