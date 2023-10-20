// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
abstract class _$$NavigationApiIdImplCopyWith<$Res>
    implements $NavigationApiIdCopyWith<$Res> {
  factory _$$NavigationApiIdImplCopyWith(_$NavigationApiIdImpl value,
          $Res Function(_$NavigationApiIdImpl) then) =
      __$$NavigationApiIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$NavigationApiIdImplCopyWithImpl<$Res>
    extends _$NavigationApiIdCopyWithImpl<$Res, _$NavigationApiIdImpl>
    implements _$$NavigationApiIdImplCopyWith<$Res> {
  __$$NavigationApiIdImplCopyWithImpl(
      _$NavigationApiIdImpl _value, $Res Function(_$NavigationApiIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$NavigationApiIdImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NavigationApiIdImpl implements _NavigationApiId {
  const _$NavigationApiIdImpl(this.value);

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
            other is _$NavigationApiIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationApiIdImplCopyWith<_$NavigationApiIdImpl> get copyWith =>
      __$$NavigationApiIdImplCopyWithImpl<_$NavigationApiIdImpl>(
          this, _$identity);
}

abstract class _NavigationApiId implements NavigationApiId {
  const factory _NavigationApiId(final String value) = _$NavigationApiIdImpl;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$NavigationApiIdImplCopyWith<_$NavigationApiIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
