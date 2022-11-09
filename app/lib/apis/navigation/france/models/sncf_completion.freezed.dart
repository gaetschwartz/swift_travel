// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sncf_completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SncfCompletion _$SncfCompletionFromJson(Map<String, dynamic> json) {
  return _SncfCompletion.fromJson(json);
}

/// @nodoc
mixin _$SncfCompletion {
  List<SncfPlace> get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SncfCompletionCopyWith<SncfCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SncfCompletionCopyWith<$Res> {
  factory $SncfCompletionCopyWith(
          SncfCompletion value, $Res Function(SncfCompletion) then) =
      _$SncfCompletionCopyWithImpl<$Res, SncfCompletion>;
  @useResult
  $Res call({List<SncfPlace> places});
}

/// @nodoc
class _$SncfCompletionCopyWithImpl<$Res, $Val extends SncfCompletion>
    implements $SncfCompletionCopyWith<$Res> {
  _$SncfCompletionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<SncfPlace>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SncfCompletionCopyWith<$Res>
    implements $SncfCompletionCopyWith<$Res> {
  factory _$$_SncfCompletionCopyWith(
          _$_SncfCompletion value, $Res Function(_$_SncfCompletion) then) =
      __$$_SncfCompletionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SncfPlace> places});
}

/// @nodoc
class __$$_SncfCompletionCopyWithImpl<$Res>
    extends _$SncfCompletionCopyWithImpl<$Res, _$_SncfCompletion>
    implements _$$_SncfCompletionCopyWith<$Res> {
  __$$_SncfCompletionCopyWithImpl(
      _$_SncfCompletion _value, $Res Function(_$_SncfCompletion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_$_SncfCompletion(
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<SncfPlace>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SncfCompletion implements _SncfCompletion {
  _$_SncfCompletion({final List<SncfPlace> places = const <SncfPlace>[]})
      : _places = places;

  factory _$_SncfCompletion.fromJson(Map<String, dynamic> json) =>
      _$$_SncfCompletionFromJson(json);

  final List<SncfPlace> _places;
  @override
  @JsonKey()
  List<SncfPlace> get places {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'SncfCompletion(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SncfCompletion &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SncfCompletionCopyWith<_$_SncfCompletion> get copyWith =>
      __$$_SncfCompletionCopyWithImpl<_$_SncfCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SncfCompletionToJson(
      this,
    );
  }
}

abstract class _SncfCompletion implements SncfCompletion {
  factory _SncfCompletion({final List<SncfPlace> places}) = _$_SncfCompletion;

  factory _SncfCompletion.fromJson(Map<String, dynamic> json) =
      _$_SncfCompletion.fromJson;

  @override
  List<SncfPlace> get places;
  @override
  @JsonKey(ignore: true)
  _$$_SncfCompletionCopyWith<_$_SncfCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}
