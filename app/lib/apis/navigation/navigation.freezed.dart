// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationApiId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationApiIdCopyWith<NavigationApiId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationApiIdCopyWith<$Res> {
  factory $NavigationApiIdCopyWith(
          NavigationApiId value, $Res Function(NavigationApiId) then) =
      _$NavigationApiIdCopyWithImpl<$Res, NavigationApiId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$NavigationApiIdCopyWithImpl<$Res, $Val extends NavigationApiId>
    implements $NavigationApiIdCopyWith<$Res> {
  _$NavigationApiIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationApiIdCopyWith<$Res>
    implements $NavigationApiIdCopyWith<$Res> {
  factory _$$_NavigationApiIdCopyWith(
          _$_NavigationApiId value, $Res Function(_$_NavigationApiId) then) =
      __$$_NavigationApiIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_NavigationApiIdCopyWithImpl<$Res>
    extends _$NavigationApiIdCopyWithImpl<$Res, _$_NavigationApiId>
    implements _$$_NavigationApiIdCopyWith<$Res> {
  __$$_NavigationApiIdCopyWithImpl(
      _$_NavigationApiId _value, $Res Function(_$_NavigationApiId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_NavigationApiId(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NavigationApiId implements _NavigationApiId {
  const _$_NavigationApiId(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'NavigationApiId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationApiId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationApiIdCopyWith<_$_NavigationApiId> get copyWith =>
      __$$_NavigationApiIdCopyWithImpl<_$_NavigationApiId>(this, _$identity);
}

abstract class _NavigationApiId implements NavigationApiId {
  const factory _NavigationApiId(final String value) = _$_NavigationApiId;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationApiIdCopyWith<_$_NavigationApiId> get copyWith =>
      throw _privateConstructorUsedError;
}
