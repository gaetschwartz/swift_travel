// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalRoute _$LocalRouteFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
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
mixin _$LocalRoute {
  Object get from => throw _privateConstructorUsedError;
  Object get to => throw _privateConstructorUsedError;
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
    TResult? Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult? Function(
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
    TResult? Function(LocalRouteV1 value)? v1,
    TResult? Function(LocalRouteV2 value)? v2,
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
      _$LocalRouteCopyWithImpl<$Res, LocalRoute>;
  @useResult
  $Res call({String? displayName, DateTime? timestamp});
}

/// @nodoc
class _$LocalRouteCopyWithImpl<$Res, $Val extends LocalRoute>
    implements $LocalRouteCopyWith<$Res> {
  _$LocalRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalRouteV1CopyWith<$Res>
    implements $LocalRouteCopyWith<$Res> {
  factory _$$LocalRouteV1CopyWith(
          _$LocalRouteV1 value, $Res Function(_$LocalRouteV1) then) =
      __$$LocalRouteV1CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, String? displayName, DateTime? timestamp});
}

/// @nodoc
class __$$LocalRouteV1CopyWithImpl<$Res>
    extends _$LocalRouteCopyWithImpl<$Res, _$LocalRouteV1>
    implements _$$LocalRouteV1CopyWith<$Res> {
  __$$LocalRouteV1CopyWithImpl(
      _$LocalRouteV1 _value, $Res Function(_$LocalRouteV1) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$LocalRouteV1(
      null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
@Deprecated('Use v2')
class _$LocalRouteV1 extends LocalRouteV1 {
  const _$LocalRouteV1(this.from, this.to,
      {this.displayName, this.timestamp, final String? $type})
      : $type = $type ?? 'v1',
        super._();

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LocalRoute.v1(from: $from, to: $to, displayName: $displayName, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalRouteV1 &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, from, to, displayName, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalRouteV1CopyWith<_$LocalRouteV1> get copyWith =>
      __$$LocalRouteV1CopyWithImpl<_$LocalRouteV1>(this, _$identity);

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
    TResult? Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult? Function(
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
    TResult? Function(LocalRouteV1 value)? v1,
    TResult? Function(LocalRouteV2 value)? v2,
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
    return _$$LocalRouteV1ToJson(
      this,
    );
  }
}

abstract class LocalRouteV1 extends LocalRoute {
  const factory LocalRouteV1(final String from, final String to,
      {final String? displayName, final DateTime? timestamp}) = _$LocalRouteV1;
  const LocalRouteV1._() : super._();

  factory LocalRouteV1.fromJson(Map<String, dynamic> json) =
      _$LocalRouteV1.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  String? get displayName;
  @override
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$LocalRouteV1CopyWith<_$LocalRouteV1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalRouteV2CopyWith<$Res>
    implements $LocalRouteCopyWith<$Res> {
  factory _$$LocalRouteV2CopyWith(
          _$LocalRouteV2 value, $Res Function(_$LocalRouteV2) then) =
      __$$LocalRouteV2CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SbbStop from, SbbStop to, String? displayName, DateTime? timestamp});

  $SbbStopCopyWith<$Res> get from;
  $SbbStopCopyWith<$Res> get to;
}

/// @nodoc
class __$$LocalRouteV2CopyWithImpl<$Res>
    extends _$LocalRouteCopyWithImpl<$Res, _$LocalRouteV2>
    implements _$$LocalRouteV2CopyWith<$Res> {
  __$$LocalRouteV2CopyWithImpl(
      _$LocalRouteV2 _value, $Res Function(_$LocalRouteV2) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$LocalRouteV2(
      null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as SbbStop,
      null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as SbbStop,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SbbStopCopyWith<$Res> get from {
    return $SbbStopCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SbbStopCopyWith<$Res> get to {
    return $SbbStopCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$LocalRouteV2 extends LocalRouteV2 {
  const _$LocalRouteV2(this.from, this.to,
      {this.displayName, this.timestamp, final String? $type})
      : $type = $type ?? 'v2',
        super._();

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LocalRoute.v2(from: $from, to: $to, displayName: $displayName, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalRouteV2 &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, from, to, displayName, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalRouteV2CopyWith<_$LocalRouteV2> get copyWith =>
      __$$LocalRouteV2CopyWithImpl<_$LocalRouteV2>(this, _$identity);

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
    TResult? Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult? Function(
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
    TResult? Function(LocalRouteV1 value)? v1,
    TResult? Function(LocalRouteV2 value)? v2,
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
    return _$$LocalRouteV2ToJson(
      this,
    );
  }
}

abstract class LocalRouteV2 extends LocalRoute {
  const factory LocalRouteV2(final SbbStop from, final SbbStop to,
      {final String? displayName, final DateTime? timestamp}) = _$LocalRouteV2;
  const LocalRouteV2._() : super._();

  factory LocalRouteV2.fromJson(Map<String, dynamic> json) =
      _$LocalRouteV2.fromJson;

  @override
  SbbStop get from;
  @override
  SbbStop get to;
  @override
  String? get displayName;
  @override
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$LocalRouteV2CopyWith<_$LocalRouteV2> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteStop _$FavoriteStopFromJson(Map<String, dynamic> json) {
  return _FavoriteStop.fromJson(json);
}

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
      _$FavoriteStopCopyWithImpl<$Res, FavoriteStop>;
  @useResult
  $Res call({String stop, String name, String? api, String? id});
}

/// @nodoc
class _$FavoriteStopCopyWithImpl<$Res, $Val extends FavoriteStop>
    implements $FavoriteStopCopyWith<$Res> {
  _$FavoriteStopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? name = null,
    Object? api = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      api: freezed == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteStopCopyWith<$Res>
    implements $FavoriteStopCopyWith<$Res> {
  factory _$$_FavoriteStopCopyWith(
          _$_FavoriteStop value, $Res Function(_$_FavoriteStop) then) =
      __$$_FavoriteStopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stop, String name, String? api, String? id});
}

/// @nodoc
class __$$_FavoriteStopCopyWithImpl<$Res>
    extends _$FavoriteStopCopyWithImpl<$Res, _$_FavoriteStop>
    implements _$$_FavoriteStopCopyWith<$Res> {
  __$$_FavoriteStopCopyWithImpl(
      _$_FavoriteStop _value, $Res Function(_$_FavoriteStop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? name = null,
    Object? api = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_FavoriteStop(
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      api: freezed == api
          ? _value.api
          : api // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
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
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteStop &&
            (identical(other.stop, stop) || other.stop == stop) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.api, api) || other.api == api) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stop, name, api, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteStopCopyWith<_$_FavoriteStop> get copyWith =>
      __$$_FavoriteStopCopyWithImpl<_$_FavoriteStop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteStopToJson(
      this,
    );
  }
}

abstract class _FavoriteStop extends FavoriteStop {
  const factory _FavoriteStop(
      {required final String stop,
      required final String name,
      final String? api,
      final String? id}) = _$_FavoriteStop;
  const _FavoriteStop._() : super._();

  factory _FavoriteStop.fromJson(Map<String, dynamic> json) =
      _$_FavoriteStop.fromJson;

  @override
  String get stop;
  @override
  String get name;
  @override
  String? get api;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteStopCopyWith<_$_FavoriteStop> get copyWith =>
      throw _privateConstructorUsedError;
}

QuickActionsItem _$QuickActionsItemFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'stop':
      return _FavoriteUnionStop.fromJson(json);
    case 'route':
      return _FavoriteUnionRoute.fromJson(json);
    case 'stationTabsCurrentLocation':
      return _FavoriteUnionStationTabsCurrentLocation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QuickActionsItem',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$QuickActionsItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id) stop,
    required TResult Function(LocalRoute route, int id) route,
    required TResult Function() stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id)? stop,
    TResult? Function(LocalRoute route, int id)? route,
    TResult? Function()? stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id)? stop,
    TResult Function(LocalRoute route, int id)? route,
    TResult Function()? stationTabsCurrentLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavoriteUnionStop value) stop,
    required TResult Function(_FavoriteUnionRoute value) route,
    required TResult Function(_FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavoriteUnionStop value)? stop,
    TResult? Function(_FavoriteUnionRoute value)? route,
    TResult? Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavoriteUnionStop value)? stop,
    TResult Function(_FavoriteUnionRoute value)? route,
    TResult Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickActionsItemCopyWith<$Res> {
  factory $QuickActionsItemCopyWith(
          QuickActionsItem value, $Res Function(QuickActionsItem) then) =
      _$QuickActionsItemCopyWithImpl<$Res, QuickActionsItem>;
}

/// @nodoc
class _$QuickActionsItemCopyWithImpl<$Res, $Val extends QuickActionsItem>
    implements $QuickActionsItemCopyWith<$Res> {
  _$QuickActionsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FavoriteUnionStopCopyWith<$Res> {
  factory _$$_FavoriteUnionStopCopyWith(_$_FavoriteUnionStop value,
          $Res Function(_$_FavoriteUnionStop) then) =
      __$$_FavoriteUnionStopCopyWithImpl<$Res>;
  @useResult
  $Res call({FavoriteStop stop, int id});

  $FavoriteStopCopyWith<$Res> get stop;
}

/// @nodoc
class __$$_FavoriteUnionStopCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res, _$_FavoriteUnionStop>
    implements _$$_FavoriteUnionStopCopyWith<$Res> {
  __$$_FavoriteUnionStopCopyWithImpl(
      _$_FavoriteUnionStop _value, $Res Function(_$_FavoriteUnionStop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? id = null,
  }) {
    return _then(_$_FavoriteUnionStop(
      null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as FavoriteStop,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FavoriteStopCopyWith<$Res> get stop {
    return $FavoriteStopCopyWith<$Res>(_value.stop, (value) {
      return _then(_value.copyWith(stop: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteUnionStop implements _FavoriteUnionStop {
  const _$_FavoriteUnionStop(this.stop, this.id, {final String? $type})
      : $type = $type ?? 'stop';

  factory _$_FavoriteUnionStop.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteUnionStopFromJson(json);

  @override
  final FavoriteStop stop;
  @override
  final int id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.stop(stop: $stop, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteUnionStop &&
            (identical(other.stop, stop) || other.stop == stop) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stop, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteUnionStopCopyWith<_$_FavoriteUnionStop> get copyWith =>
      __$$_FavoriteUnionStopCopyWithImpl<_$_FavoriteUnionStop>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id) stop,
    required TResult Function(LocalRoute route, int id) route,
    required TResult Function() stationTabsCurrentLocation,
  }) {
    return stop(this.stop, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id)? stop,
    TResult? Function(LocalRoute route, int id)? route,
    TResult? Function()? stationTabsCurrentLocation,
  }) {
    return stop?.call(this.stop, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id)? stop,
    TResult Function(LocalRoute route, int id)? route,
    TResult Function()? stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this.stop, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavoriteUnionStop value) stop,
    required TResult Function(_FavoriteUnionRoute value) route,
    required TResult Function(_FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavoriteUnionStop value)? stop,
    TResult? Function(_FavoriteUnionRoute value)? route,
    TResult? Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavoriteUnionStop value)? stop,
    TResult Function(_FavoriteUnionRoute value)? route,
    TResult Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteUnionStopToJson(
      this,
    );
  }
}

abstract class _FavoriteUnionStop implements QuickActionsItem {
  const factory _FavoriteUnionStop(final FavoriteStop stop, final int id) =
      _$_FavoriteUnionStop;

  factory _FavoriteUnionStop.fromJson(Map<String, dynamic> json) =
      _$_FavoriteUnionStop.fromJson;

  FavoriteStop get stop;
  int get id;
  @JsonKey(ignore: true)
  _$$_FavoriteUnionStopCopyWith<_$_FavoriteUnionStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FavoriteUnionRouteCopyWith<$Res> {
  factory _$$_FavoriteUnionRouteCopyWith(_$_FavoriteUnionRoute value,
          $Res Function(_$_FavoriteUnionRoute) then) =
      __$$_FavoriteUnionRouteCopyWithImpl<$Res>;
  @useResult
  $Res call({LocalRoute route, int id});

  $LocalRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$$_FavoriteUnionRouteCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res, _$_FavoriteUnionRoute>
    implements _$$_FavoriteUnionRouteCopyWith<$Res> {
  __$$_FavoriteUnionRouteCopyWithImpl(
      _$_FavoriteUnionRoute _value, $Res Function(_$_FavoriteUnionRoute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? id = null,
  }) {
    return _then(_$_FavoriteUnionRoute(
      null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as LocalRoute,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalRouteCopyWith<$Res> get route {
    return $LocalRouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteUnionRoute implements _FavoriteUnionRoute {
  const _$_FavoriteUnionRoute(this.route, this.id, {final String? $type})
      : $type = $type ?? 'route';

  factory _$_FavoriteUnionRoute.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteUnionRouteFromJson(json);

  @override
  final LocalRoute route;
  @override
  final int id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.route(route: $route, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteUnionRoute &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, route, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteUnionRouteCopyWith<_$_FavoriteUnionRoute> get copyWith =>
      __$$_FavoriteUnionRouteCopyWithImpl<_$_FavoriteUnionRoute>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id) stop,
    required TResult Function(LocalRoute route, int id) route,
    required TResult Function() stationTabsCurrentLocation,
  }) {
    return route(this.route, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id)? stop,
    TResult? Function(LocalRoute route, int id)? route,
    TResult? Function()? stationTabsCurrentLocation,
  }) {
    return route?.call(this.route, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id)? stop,
    TResult Function(LocalRoute route, int id)? route,
    TResult Function()? stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (route != null) {
      return route(this.route, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavoriteUnionStop value) stop,
    required TResult Function(_FavoriteUnionRoute value) route,
    required TResult Function(_FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) {
    return route(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavoriteUnionStop value)? stop,
    TResult? Function(_FavoriteUnionRoute value)? route,
    TResult? Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) {
    return route?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavoriteUnionStop value)? stop,
    TResult Function(_FavoriteUnionRoute value)? route,
    TResult Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (route != null) {
      return route(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteUnionRouteToJson(
      this,
    );
  }
}

abstract class _FavoriteUnionRoute implements QuickActionsItem {
  const factory _FavoriteUnionRoute(final LocalRoute route, final int id) =
      _$_FavoriteUnionRoute;

  factory _FavoriteUnionRoute.fromJson(Map<String, dynamic> json) =
      _$_FavoriteUnionRoute.fromJson;

  LocalRoute get route;
  int get id;
  @JsonKey(ignore: true)
  _$$_FavoriteUnionRouteCopyWith<_$_FavoriteUnionRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FavoriteUnionStationTabsCurrentLocationCopyWith<$Res> {
  factory _$$_FavoriteUnionStationTabsCurrentLocationCopyWith(
          _$_FavoriteUnionStationTabsCurrentLocation value,
          $Res Function(_$_FavoriteUnionStationTabsCurrentLocation) then) =
      __$$_FavoriteUnionStationTabsCurrentLocationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FavoriteUnionStationTabsCurrentLocationCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res,
        _$_FavoriteUnionStationTabsCurrentLocation>
    implements _$$_FavoriteUnionStationTabsCurrentLocationCopyWith<$Res> {
  __$$_FavoriteUnionStationTabsCurrentLocationCopyWithImpl(
      _$_FavoriteUnionStationTabsCurrentLocation _value,
      $Res Function(_$_FavoriteUnionStationTabsCurrentLocation) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteUnionStationTabsCurrentLocation
    implements _FavoriteUnionStationTabsCurrentLocation {
  const _$_FavoriteUnionStationTabsCurrentLocation({final String? $type})
      : $type = $type ?? 'stationTabsCurrentLocation';

  factory _$_FavoriteUnionStationTabsCurrentLocation.fromJson(
          Map<String, dynamic> json) =>
      _$$_FavoriteUnionStationTabsCurrentLocationFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.stationTabsCurrentLocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteUnionStationTabsCurrentLocation);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id) stop,
    required TResult Function(LocalRoute route, int id) route,
    required TResult Function() stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id)? stop,
    TResult? Function(LocalRoute route, int id)? route,
    TResult? Function()? stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id)? stop,
    TResult Function(LocalRoute route, int id)? route,
    TResult Function()? stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stationTabsCurrentLocation != null) {
      return stationTabsCurrentLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavoriteUnionStop value) stop,
    required TResult Function(_FavoriteUnionRoute value) route,
    required TResult Function(_FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FavoriteUnionStop value)? stop,
    TResult? Function(_FavoriteUnionRoute value)? route,
    TResult? Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavoriteUnionStop value)? stop,
    TResult Function(_FavoriteUnionRoute value)? route,
    TResult Function(_FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stationTabsCurrentLocation != null) {
      return stationTabsCurrentLocation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteUnionStationTabsCurrentLocationToJson(
      this,
    );
  }
}

abstract class _FavoriteUnionStationTabsCurrentLocation
    implements QuickActionsItem {
  const factory _FavoriteUnionStationTabsCurrentLocation() =
      _$_FavoriteUnionStationTabsCurrentLocation;

  factory _FavoriteUnionStationTabsCurrentLocation.fromJson(
          Map<String, dynamic> json) =
      _$_FavoriteUnionStationTabsCurrentLocation.fromJson;
}

QuickActionsReorderableItem _$QuickActionsReorderableItemFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'item':
      return QuickActionsFavoriteItem.fromJson(json);
    case 'divider':
      return QuickActionsFavoriteDivider.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'QuickActionsReorderableItem',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$QuickActionsReorderableItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuickActionsItem item, bool present) item,
    required TResult Function() divider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsItem item, bool present)? item,
    TResult? Function()? divider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuickActionsItem item, bool present)? item,
    TResult Function()? divider,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuickActionsFavoriteItem value) item,
    required TResult Function(QuickActionsFavoriteDivider value) divider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsFavoriteItem value)? item,
    TResult? Function(QuickActionsFavoriteDivider value)? divider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuickActionsFavoriteItem value)? item,
    TResult Function(QuickActionsFavoriteDivider value)? divider,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickActionsReorderableItemCopyWith<$Res> {
  factory $QuickActionsReorderableItemCopyWith(
          QuickActionsReorderableItem value,
          $Res Function(QuickActionsReorderableItem) then) =
      _$QuickActionsReorderableItemCopyWithImpl<$Res,
          QuickActionsReorderableItem>;
}

/// @nodoc
class _$QuickActionsReorderableItemCopyWithImpl<$Res,
        $Val extends QuickActionsReorderableItem>
    implements $QuickActionsReorderableItemCopyWith<$Res> {
  _$QuickActionsReorderableItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$QuickActionsFavoriteItemCopyWith<$Res> {
  factory _$$QuickActionsFavoriteItemCopyWith(_$QuickActionsFavoriteItem value,
          $Res Function(_$QuickActionsFavoriteItem) then) =
      __$$QuickActionsFavoriteItemCopyWithImpl<$Res>;
  @useResult
  $Res call({QuickActionsItem item, bool present});

  $QuickActionsItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$QuickActionsFavoriteItemCopyWithImpl<$Res>
    extends _$QuickActionsReorderableItemCopyWithImpl<$Res,
        _$QuickActionsFavoriteItem>
    implements _$$QuickActionsFavoriteItemCopyWith<$Res> {
  __$$QuickActionsFavoriteItemCopyWithImpl(_$QuickActionsFavoriteItem _value,
      $Res Function(_$QuickActionsFavoriteItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? present = null,
  }) {
    return _then(_$QuickActionsFavoriteItem(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as QuickActionsItem,
      null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuickActionsItemCopyWith<$Res> get item {
    return $QuickActionsItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickActionsFavoriteItem implements QuickActionsFavoriteItem {
  const _$QuickActionsFavoriteItem(this.item, this.present,
      {final String? $type})
      : $type = $type ?? 'item';

  factory _$QuickActionsFavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$$QuickActionsFavoriteItemFromJson(json);

  @override
  final QuickActionsItem item;
  @override
  final bool present;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsReorderableItem.item(item: $item, present: $present)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickActionsFavoriteItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.present, present) || other.present == present));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item, present);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickActionsFavoriteItemCopyWith<_$QuickActionsFavoriteItem>
      get copyWith =>
          __$$QuickActionsFavoriteItemCopyWithImpl<_$QuickActionsFavoriteItem>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuickActionsItem item, bool present) item,
    required TResult Function() divider,
  }) {
    return item(this.item, present);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsItem item, bool present)? item,
    TResult? Function()? divider,
  }) {
    return item?.call(this.item, present);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuickActionsItem item, bool present)? item,
    TResult Function()? divider,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this.item, present);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuickActionsFavoriteItem value) item,
    required TResult Function(QuickActionsFavoriteDivider value) divider,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsFavoriteItem value)? item,
    TResult? Function(QuickActionsFavoriteDivider value)? divider,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuickActionsFavoriteItem value)? item,
    TResult Function(QuickActionsFavoriteDivider value)? divider,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickActionsFavoriteItemToJson(
      this,
    );
  }
}

abstract class QuickActionsFavoriteItem implements QuickActionsReorderableItem {
  const factory QuickActionsFavoriteItem(
          final QuickActionsItem item, final bool present) =
      _$QuickActionsFavoriteItem;

  factory QuickActionsFavoriteItem.fromJson(Map<String, dynamic> json) =
      _$QuickActionsFavoriteItem.fromJson;

  QuickActionsItem get item;
  bool get present;
  @JsonKey(ignore: true)
  _$$QuickActionsFavoriteItemCopyWith<_$QuickActionsFavoriteItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuickActionsFavoriteDividerCopyWith<$Res> {
  factory _$$QuickActionsFavoriteDividerCopyWith(
          _$QuickActionsFavoriteDivider value,
          $Res Function(_$QuickActionsFavoriteDivider) then) =
      __$$QuickActionsFavoriteDividerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuickActionsFavoriteDividerCopyWithImpl<$Res>
    extends _$QuickActionsReorderableItemCopyWithImpl<$Res,
        _$QuickActionsFavoriteDivider>
    implements _$$QuickActionsFavoriteDividerCopyWith<$Res> {
  __$$QuickActionsFavoriteDividerCopyWithImpl(
      _$QuickActionsFavoriteDivider _value,
      $Res Function(_$QuickActionsFavoriteDivider) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$QuickActionsFavoriteDivider implements QuickActionsFavoriteDivider {
  const _$QuickActionsFavoriteDivider({final String? $type})
      : $type = $type ?? 'divider';

  factory _$QuickActionsFavoriteDivider.fromJson(Map<String, dynamic> json) =>
      _$$QuickActionsFavoriteDividerFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsReorderableItem.divider()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickActionsFavoriteDivider);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuickActionsItem item, bool present) item,
    required TResult Function() divider,
  }) {
    return divider();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsItem item, bool present)? item,
    TResult? Function()? divider,
  }) {
    return divider?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuickActionsItem item, bool present)? item,
    TResult Function()? divider,
    required TResult orElse(),
  }) {
    if (divider != null) {
      return divider();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuickActionsFavoriteItem value) item,
    required TResult Function(QuickActionsFavoriteDivider value) divider,
  }) {
    return divider(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsFavoriteItem value)? item,
    TResult? Function(QuickActionsFavoriteDivider value)? divider,
  }) {
    return divider?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuickActionsFavoriteItem value)? item,
    TResult Function(QuickActionsFavoriteDivider value)? divider,
    required TResult orElse(),
  }) {
    if (divider != null) {
      return divider(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickActionsFavoriteDividerToJson(
      this,
    );
  }
}

abstract class QuickActionsFavoriteDivider
    implements QuickActionsReorderableItem {
  const factory QuickActionsFavoriteDivider() = _$QuickActionsFavoriteDivider;

  factory QuickActionsFavoriteDivider.fromJson(Map<String, dynamic> json) =
      _$QuickActionsFavoriteDivider.fromJson;
}
