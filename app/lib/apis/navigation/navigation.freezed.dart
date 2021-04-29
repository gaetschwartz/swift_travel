// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationApiIdTearOff {
  const _$NavigationApiIdTearOff();

  _NavigationApiId call(String id) {
    return _NavigationApiId(
      id,
    );
  }
}

/// @nodoc
const $NavigationApiId = _$NavigationApiIdTearOff();

/// @nodoc
mixin _$NavigationApiId {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationApiIdCopyWith<NavigationApiId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationApiIdCopyWith<$Res> {
  factory $NavigationApiIdCopyWith(
          NavigationApiId value, $Res Function(NavigationApiId) then) =
      _$NavigationApiIdCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$NavigationApiIdCopyWithImpl<$Res>
    implements $NavigationApiIdCopyWith<$Res> {
  _$NavigationApiIdCopyWithImpl(this._value, this._then);

  final NavigationApiId _value;
  // ignore: unused_field
  final $Res Function(NavigationApiId) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NavigationApiIdCopyWith<$Res>
    implements $NavigationApiIdCopyWith<$Res> {
  factory _$NavigationApiIdCopyWith(
          _NavigationApiId value, $Res Function(_NavigationApiId) then) =
      __$NavigationApiIdCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$NavigationApiIdCopyWithImpl<$Res>
    extends _$NavigationApiIdCopyWithImpl<$Res>
    implements _$NavigationApiIdCopyWith<$Res> {
  __$NavigationApiIdCopyWithImpl(
      _NavigationApiId _value, $Res Function(_NavigationApiId) _then)
      : super(_value, (v) => _then(v as _NavigationApiId));

  @override
  _NavigationApiId get _value => super._value as _NavigationApiId;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_NavigationApiId(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NavigationApiId implements _NavigationApiId {
  const _$_NavigationApiId(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'NavigationApiId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NavigationApiId &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$NavigationApiIdCopyWith<_NavigationApiId> get copyWith =>
      __$NavigationApiIdCopyWithImpl<_NavigationApiId>(this, _$identity);
}

abstract class _NavigationApiId implements NavigationApiId {
  const factory _NavigationApiId(String id) = _$_NavigationApiId;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NavigationApiIdCopyWith<_NavigationApiId> get copyWith =>
      throw _privateConstructorUsedError;
}
