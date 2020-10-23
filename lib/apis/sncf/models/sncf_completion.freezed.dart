// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sncf_completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SncfCompletion _$SncfCompletionFromJson(Map<String, dynamic> json) {
  return _SncfCompletion.fromJson(json);
}

/// @nodoc
class _$SncfCompletionTearOff {
  const _$SncfCompletionTearOff();

// ignore: unused_element
  _SncfCompletion call({List<SncfPlace> places = const []}) {
    return _SncfCompletion(
      places: places,
    );
  }

// ignore: unused_element
  SncfCompletion fromJson(Map<String, Object> json) {
    return SncfCompletion.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SncfCompletion = _$SncfCompletionTearOff();

/// @nodoc
mixin _$SncfCompletion {
  List<SncfPlace> get places;

  Map<String, dynamic> toJson();
  $SncfCompletionCopyWith<SncfCompletion> get copyWith;
}

/// @nodoc
abstract class $SncfCompletionCopyWith<$Res> {
  factory $SncfCompletionCopyWith(
          SncfCompletion value, $Res Function(SncfCompletion) then) =
      _$SncfCompletionCopyWithImpl<$Res>;
  $Res call({List<SncfPlace> places});
}

/// @nodoc
class _$SncfCompletionCopyWithImpl<$Res>
    implements $SncfCompletionCopyWith<$Res> {
  _$SncfCompletionCopyWithImpl(this._value, this._then);

  final SncfCompletion _value;
  // ignore: unused_field
  final $Res Function(SncfCompletion) _then;

  @override
  $Res call({
    Object places = freezed,
  }) {
    return _then(_value.copyWith(
      places: places == freezed ? _value.places : places as List<SncfPlace>,
    ));
  }
}

/// @nodoc
abstract class _$SncfCompletionCopyWith<$Res>
    implements $SncfCompletionCopyWith<$Res> {
  factory _$SncfCompletionCopyWith(
          _SncfCompletion value, $Res Function(_SncfCompletion) then) =
      __$SncfCompletionCopyWithImpl<$Res>;
  @override
  $Res call({List<SncfPlace> places});
}

/// @nodoc
class __$SncfCompletionCopyWithImpl<$Res>
    extends _$SncfCompletionCopyWithImpl<$Res>
    implements _$SncfCompletionCopyWith<$Res> {
  __$SncfCompletionCopyWithImpl(
      _SncfCompletion _value, $Res Function(_SncfCompletion) _then)
      : super(_value, (v) => _then(v as _SncfCompletion));

  @override
  _SncfCompletion get _value => super._value as _SncfCompletion;

  @override
  $Res call({
    Object places = freezed,
  }) {
    return _then(_SncfCompletion(
      places: places == freezed ? _value.places : places as List<SncfPlace>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_SncfCompletion implements _SncfCompletion {
  _$_SncfCompletion({this.places = const []}) : assert(places != null);

  factory _$_SncfCompletion.fromJson(Map<String, dynamic> json) =>
      _$_$_SncfCompletionFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<SncfPlace> places;

  @override
  String toString() {
    return 'SncfCompletion(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SncfCompletion &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(places);

  @override
  _$SncfCompletionCopyWith<_SncfCompletion> get copyWith =>
      __$SncfCompletionCopyWithImpl<_SncfCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SncfCompletionToJson(this);
  }
}

abstract class _SncfCompletion implements SncfCompletion {
  factory _SncfCompletion({List<SncfPlace> places}) = _$_SncfCompletion;

  factory _SncfCompletion.fromJson(Map<String, dynamic> json) =
      _$_SncfCompletion.fromJson;

  @override
  List<SncfPlace> get places;
  @override
  _$SncfCompletionCopyWith<_SncfCompletion> get copyWith;
}
