// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'favorite_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
FavoriteStop _$FavoriteStopFromJson(Map<String, dynamic> json) {
  return _FavoriteStop.fromJson(json);
}

/// @nodoc
class _$FavoriteStopTearOff {
  const _$FavoriteStopTearOff();

  _FavoriteStop call(
      {required String stop,
      required String name,
      NavigationApi api = NavigationApi.sbb}) {
    return _FavoriteStop(
      stop: stop,
      name: name,
      api: api,
    );
  }

  FavoriteStop fromJson(Map<String, Object> json) {
    return FavoriteStop.fromJson(json);
  }
}

/// @nodoc
const $FavoriteStop = _$FavoriteStopTearOff();

/// @nodoc
mixin _$FavoriteStop {
  String get stop => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  NavigationApi get api => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteStopCopyWith<FavoriteStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStopCopyWith<$Res> {
  factory $FavoriteStopCopyWith(
          FavoriteStop value, $Res Function(FavoriteStop) then) =
      _$FavoriteStopCopyWithImpl<$Res>;
  $Res call({String stop, String name, NavigationApi api});
}

/// @nodoc
class _$FavoriteStopCopyWithImpl<$Res> implements $FavoriteStopCopyWith<$Res> {
  _$FavoriteStopCopyWithImpl(this._value, this._then);

  final FavoriteStop _value;
  // ignore: unused_field
  final $Res Function(FavoriteStop) _then;

  @override
  $Res call({
    Object? stop = freezed,
    Object? name = freezed,
    Object? api = freezed,
  }) {
    return _then(_value.copyWith(
      stop: stop == freezed ? _value.stop : stop as String,
      name: name == freezed ? _value.name : name as String,
      api: api == freezed ? _value.api : api as NavigationApi,
    ));
  }
}

/// @nodoc
abstract class _$FavoriteStopCopyWith<$Res>
    implements $FavoriteStopCopyWith<$Res> {
  factory _$FavoriteStopCopyWith(
          _FavoriteStop value, $Res Function(_FavoriteStop) then) =
      __$FavoriteStopCopyWithImpl<$Res>;
  @override
  $Res call({String stop, String name, NavigationApi api});
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
    Object? stop = freezed,
    Object? name = freezed,
    Object? api = freezed,
  }) {
    return _then(_FavoriteStop(
      stop: stop == freezed ? _value.stop : stop as String,
      name: name == freezed ? _value.name : name as String,
      api: api == freezed ? _value.api : api as NavigationApi,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FavoriteStop implements _FavoriteStop {
  const _$_FavoriteStop(
      {required this.stop, required this.name, this.api = NavigationApi.sbb});

  factory _$_FavoriteStop.fromJson(Map<String, dynamic> json) =>
      _$_$_FavoriteStopFromJson(json);

  @override
  final String stop;
  @override
  final String name;
  @JsonKey(defaultValue: NavigationApi.sbb)
  @override
  final NavigationApi api;

  @override
  String toString() {
    return 'FavoriteStop(stop: $stop, name: $name, api: $api)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavoriteStop &&
            (identical(other.stop, stop) ||
                const DeepCollectionEquality().equals(other.stop, stop)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.api, api) ||
                const DeepCollectionEquality().equals(other.api, api)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stop) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(api);

  @JsonKey(ignore: true)
  @override
  _$FavoriteStopCopyWith<_FavoriteStop> get copyWith =>
      __$FavoriteStopCopyWithImpl<_FavoriteStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FavoriteStopToJson(this);
  }
}

abstract class _FavoriteStop implements FavoriteStop {
  const factory _FavoriteStop(
      {required String stop,
      required String name,
      NavigationApi api}) = _$_FavoriteStop;

  factory _FavoriteStop.fromJson(Map<String, dynamic> json) =
      _$_FavoriteStop.fromJson;

  @override
  String get stop => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  NavigationApi get api => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavoriteStopCopyWith<_FavoriteStop> get copyWith =>
      throw _privateConstructorUsedError;
}
