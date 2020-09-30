// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorite_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FavoriteStop _$FavoriteStopFromJson(Map<String, dynamic> json) {
  return _FavoriteStop.fromJson(json);
}

/// @nodoc
class _$FavoriteStopTearOff {
  const _$FavoriteStopTearOff();

// ignore: unused_element
  _FavoriteStop call(String stop, {String name, CffCompletion completion}) {
    return _FavoriteStop(
      stop,
      name: name,
      completion: completion,
    );
  }

// ignore: unused_element
  FavoriteStop fromJson(Map<String, Object> json) {
    return FavoriteStop.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FavoriteStop = _$FavoriteStopTearOff();

/// @nodoc
mixin _$FavoriteStop {
  String get stop;
  String get name;
  CffCompletion get completion;

  Map<String, dynamic> toJson();
  $FavoriteStopCopyWith<FavoriteStop> get copyWith;
}

/// @nodoc
abstract class $FavoriteStopCopyWith<$Res> {
  factory $FavoriteStopCopyWith(
          FavoriteStop value, $Res Function(FavoriteStop) then) =
      _$FavoriteStopCopyWithImpl<$Res>;
  $Res call({String stop, String name, CffCompletion completion});

  $CffCompletionCopyWith<$Res> get completion;
}

/// @nodoc
class _$FavoriteStopCopyWithImpl<$Res> implements $FavoriteStopCopyWith<$Res> {
  _$FavoriteStopCopyWithImpl(this._value, this._then);

  final FavoriteStop _value;
  // ignore: unused_field
  final $Res Function(FavoriteStop) _then;

  @override
  $Res call({
    Object stop = freezed,
    Object name = freezed,
    Object completion = freezed,
  }) {
    return _then(_value.copyWith(
      stop: stop == freezed ? _value.stop : stop as String,
      name: name == freezed ? _value.name : name as String,
      completion: completion == freezed
          ? _value.completion
          : completion as CffCompletion,
    ));
  }

  @override
  $CffCompletionCopyWith<$Res> get completion {
    if (_value.completion == null) {
      return null;
    }
    return $CffCompletionCopyWith<$Res>(_value.completion, (value) {
      return _then(_value.copyWith(completion: value));
    });
  }
}

/// @nodoc
abstract class _$FavoriteStopCopyWith<$Res>
    implements $FavoriteStopCopyWith<$Res> {
  factory _$FavoriteStopCopyWith(
          _FavoriteStop value, $Res Function(_FavoriteStop) then) =
      __$FavoriteStopCopyWithImpl<$Res>;
  @override
  $Res call({String stop, String name, CffCompletion completion});

  @override
  $CffCompletionCopyWith<$Res> get completion;
}

/// @nodoc
class __$FavoriteStopCopyWithImpl<$Res> extends _$FavoriteStopCopyWithImpl<$Res>
    implements _$FavoriteStopCopyWith<$Res> {
  __$FavoriteStopCopyWithImpl(
      _FavoriteStop _value, $Res Function(_FavoriteStop) _then)
      : super(_value, (v) => _then(v as _FavoriteStop));

  @override
  _FavoriteStop get _value => super._value as _FavoriteStop;

  @override
  $Res call({
    Object stop = freezed,
    Object name = freezed,
    Object completion = freezed,
  }) {
    return _then(_FavoriteStop(
      stop == freezed ? _value.stop : stop as String,
      name: name == freezed ? _value.name : name as String,
      completion: completion == freezed
          ? _value.completion
          : completion as CffCompletion,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FavoriteStop implements _FavoriteStop {
  _$_FavoriteStop(this.stop, {this.name, this.completion})
      : assert(stop != null);

  factory _$_FavoriteStop.fromJson(Map<String, dynamic> json) =>
      _$_$_FavoriteStopFromJson(json);

  @override
  final String stop;
  @override
  final String name;
  @override
  final CffCompletion completion;

  @override
  String toString() {
    return 'FavoriteStop(stop: $stop, name: $name, completion: $completion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavoriteStop &&
            (identical(other.stop, stop) ||
                const DeepCollectionEquality().equals(other.stop, stop)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.completion, completion) ||
                const DeepCollectionEquality()
                    .equals(other.completion, completion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stop) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(completion);

  @override
  _$FavoriteStopCopyWith<_FavoriteStop> get copyWith =>
      __$FavoriteStopCopyWithImpl<_FavoriteStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FavoriteStopToJson(this);
  }
}

abstract class _FavoriteStop implements FavoriteStop {
  factory _FavoriteStop(String stop, {String name, CffCompletion completion}) =
      _$_FavoriteStop;

  factory _FavoriteStop.fromJson(Map<String, dynamic> json) =
      _$_FavoriteStop.fromJson;

  @override
  String get stop;
  @override
  String get name;
  @override
  CffCompletion get completion;
  @override
  _$FavoriteStopCopyWith<_FavoriteStop> get copyWith;
}
