// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalRoute _$LocalRouteFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'v1':
      return LocalRouteV1.fromJson(json);
    case 'v2':
      return LocalRouteV2.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'LocalRoute',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$LocalRouteTearOff {
  const _$LocalRouteTearOff();

  LocalRouteV1 v1(String from, String to,
      {String? displayName, DateTime? timestamp}) {
    return LocalRouteV1(
      from,
      to,
      displayName: displayName,
      timestamp: timestamp,
    );
  }

  LocalRouteV2 v2(SbbStop from, SbbStop to,
      {String? displayName, DateTime? timestamp}) {
    return LocalRouteV2(
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
  String? get displayName => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)
        v1,
    required TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)
        v2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)?
        v2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)?
        v2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalRouteV1 value) v1,
    required TResult Function(LocalRouteV2 value) v2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocalRouteV1 value)? v1,
    TResult Function(LocalRouteV2 value)? v2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalRouteV1 value)? v1,
    TResult Function(LocalRouteV2 value)? v2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  $Res call({String? displayName, DateTime? timestamp});
}

/// @nodoc
class _$LocalRouteCopyWithImpl<$Res> implements $LocalRouteCopyWith<$Res> {
  _$LocalRouteCopyWithImpl(this._value, this._then);

  final LocalRoute _value;
  // ignore: unused_field
  final $Res Function(LocalRoute) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class $LocalRouteV1CopyWith<$Res>
    implements $LocalRouteCopyWith<$Res> {
  factory $LocalRouteV1CopyWith(
          LocalRouteV1 value, $Res Function(LocalRouteV1) then) =
      _$LocalRouteV1CopyWithImpl<$Res>;
  @override
  $Res call({String from, String to, String? displayName, DateTime? timestamp});
}

/// @nodoc
class _$LocalRouteV1CopyWithImpl<$Res> extends _$LocalRouteCopyWithImpl<$Res>
    implements $LocalRouteV1CopyWith<$Res> {
  _$LocalRouteV1CopyWithImpl(
      LocalRouteV1 _value, $Res Function(LocalRouteV1) _then)
      : super(_value, (v) => _then(v as LocalRouteV1));

  @override
  LocalRouteV1 get _value => super._value as LocalRouteV1;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(LocalRouteV1(
      from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
@Deprecated("Use v2")
class _$LocalRouteV1 extends LocalRouteV1 {
  const _$LocalRouteV1(this.from, this.to, {this.displayName, this.timestamp})
      : super._();

  factory _$LocalRouteV1.fromJson(Map<String, dynamic> json) =>
      _$$LocalRouteV1FromJson(json);

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
    return 'LocalRoute.v1(from: $from, to: $to, displayName: $displayName, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocalRouteV1 &&
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
  $LocalRouteV1CopyWith<LocalRouteV1> get copyWith =>
      _$LocalRouteV1CopyWithImpl<LocalRouteV1>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)
        v1,
    required TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)
        v2,
  }) {
    return v1(from, to, displayName, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)?
        v2,
  }) {
    return v1?.call(from, to, displayName, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)?
        v2,
    required TResult orElse(),
  }) {
    if (v1 != null) {
      return v1(from, to, displayName, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalRouteV1 value) v1,
    required TResult Function(LocalRouteV2 value) v2,
  }) {
    return v1(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocalRouteV1 value)? v1,
    TResult Function(LocalRouteV2 value)? v2,
  }) {
    return v1?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalRouteV1 value)? v1,
    TResult Function(LocalRouteV2 value)? v2,
    required TResult orElse(),
  }) {
    if (v1 != null) {
      return v1(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalRouteV1ToJson(this)..['runtimeType'] = 'v1';
  }
}

abstract class LocalRouteV1 extends LocalRoute {
  const factory LocalRouteV1(String from, String to,
      {String? displayName, DateTime? timestamp}) = _$LocalRouteV1;
  const LocalRouteV1._() : super._();

  factory LocalRouteV1.fromJson(Map<String, dynamic> json) =
      _$LocalRouteV1.fromJson;

  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LocalRouteV1CopyWith<LocalRouteV1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalRouteV2CopyWith<$Res>
    implements $LocalRouteCopyWith<$Res> {
  factory $LocalRouteV2CopyWith(
          LocalRouteV2 value, $Res Function(LocalRouteV2) then) =
      _$LocalRouteV2CopyWithImpl<$Res>;
  @override
  $Res call(
      {SbbStop from, SbbStop to, String? displayName, DateTime? timestamp});

  $SbbStopCopyWith<$Res> get from;
  $SbbStopCopyWith<$Res> get to;
}

/// @nodoc
class _$LocalRouteV2CopyWithImpl<$Res> extends _$LocalRouteCopyWithImpl<$Res>
    implements $LocalRouteV2CopyWith<$Res> {
  _$LocalRouteV2CopyWithImpl(
      LocalRouteV2 _value, $Res Function(LocalRouteV2) _then)
      : super(_value, (v) => _then(v as LocalRouteV2));

  @override
  LocalRouteV2 get _value => super._value as LocalRouteV2;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(LocalRouteV2(
      from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as SbbStop,
      to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as SbbStop,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $SbbStopCopyWith<$Res> get from {
    return $SbbStopCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  $SbbStopCopyWith<$Res> get to {
    return $SbbStopCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$LocalRouteV2 extends LocalRouteV2 {
  const _$LocalRouteV2(this.from, this.to, {this.displayName, this.timestamp})
      : super._();

  factory _$LocalRouteV2.fromJson(Map<String, dynamic> json) =>
      _$$LocalRouteV2FromJson(json);

  @override
  final SbbStop from;
  @override
  final SbbStop to;
  @override
  final String? displayName;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'LocalRoute.v2(from: $from, to: $to, displayName: $displayName, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocalRouteV2 &&
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
  $LocalRouteV2CopyWith<LocalRouteV2> get copyWith =>
      _$LocalRouteV2CopyWithImpl<LocalRouteV2>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)
        v1,
    required TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)
        v2,
  }) {
    return v2(from, to, displayName, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)?
        v2,
  }) {
    return v2?.call(from, to, displayName, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SbbStop from, SbbStop to, String? displayName, DateTime? timestamp)?
        v2,
    required TResult orElse(),
  }) {
    if (v2 != null) {
      return v2(from, to, displayName, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalRouteV1 value) v1,
    required TResult Function(LocalRouteV2 value) v2,
  }) {
    return v2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocalRouteV1 value)? v1,
    TResult Function(LocalRouteV2 value)? v2,
  }) {
    return v2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalRouteV1 value)? v1,
    TResult Function(LocalRouteV2 value)? v2,
    required TResult orElse(),
  }) {
    if (v2 != null) {
      return v2(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalRouteV2ToJson(this)..['runtimeType'] = 'v2';
  }
}

abstract class LocalRouteV2 extends LocalRoute {
  const factory LocalRouteV2(SbbStop from, SbbStop to,
      {String? displayName, DateTime? timestamp}) = _$LocalRouteV2;
  const LocalRouteV2._() : super._();

  factory LocalRouteV2.fromJson(Map<String, dynamic> json) =
      _$LocalRouteV2.fromJson;

  SbbStop get from => throw _privateConstructorUsedError;
  SbbStop get to => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LocalRouteV2CopyWith<LocalRouteV2> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteStop _$FavoriteStopFromJson(Map<String, dynamic> json) {
  return _FavoriteStop.fromJson(json);
}

/// @nodoc
class _$FavoriteStopTearOff {
  const _$FavoriteStopTearOff();

  _FavoriteStop call(
      {required String stop, required String name, String? api, String? id}) {
    return _FavoriteStop(
      stop: stop,
      name: name,
      api: api,
      id: id,
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
  String? get api => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

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
  $Res call({String stop, String name, String? api, String? id});
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
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      api: api == freezed
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String stop, String name, String? api, String? id});
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
    Object? id = freezed,
  }) {
    return _then(_FavoriteStop(
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      api: api == freezed
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_FavoriteStop extends _FavoriteStop {
  const _$_FavoriteStop(
      {required this.stop, required this.name, this.api, this.id})
      : super._();

  factory _$_FavoriteStop.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteStopFromJson(json);

  @override
  final String stop;
  @override
  final String name;
  @override
  final String? api;
  @override
  final String? id;

  @override
  String toString() {
    return 'FavoriteStop(stop: $stop, name: $name, api: $api, id: $id)';
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
                const DeepCollectionEquality().equals(other.api, api)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stop) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(api) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$FavoriteStopCopyWith<_FavoriteStop> get copyWith =>
      __$FavoriteStopCopyWithImpl<_FavoriteStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteStopToJson(this);
  }
}

abstract class _FavoriteStop extends FavoriteStop {
  const factory _FavoriteStop(
      {required String stop,
      required String name,
      String? api,
      String? id}) = _$_FavoriteStop;
  const _FavoriteStop._() : super._();

  factory _FavoriteStop.fromJson(Map<String, dynamic> json) =
      _$_FavoriteStop.fromJson;

  @override
  String get stop => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get api => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavoriteStopCopyWith<_FavoriteStop> get copyWith =>
      throw _privateConstructorUsedError;
}
