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
      return FavoriteUnionStop.fromJson(json);
    case 'route':
      return FavoriteUnionRoute.fromJson(json);
    case 'stationTabsCurrentLocation':
      return FavoriteUnionStationTabsCurrentLocation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'QuickActionsItem',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$QuickActionsItem {
  int? get quickActionsIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int? quickActionsIndex)? stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int? quickActionsIndex)? stationTabsCurrentLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteUnionStop value) stop,
    required TResult Function(FavoriteUnionRoute value) route,
    required TResult Function(FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteUnionStop value)? stop,
    TResult? Function(FavoriteUnionRoute value)? route,
    TResult? Function(FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteUnionStop value)? stop,
    TResult Function(FavoriteUnionRoute value)? route,
    TResult Function(FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuickActionsItemCopyWith<QuickActionsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickActionsItemCopyWith<$Res> {
  factory $QuickActionsItemCopyWith(
          QuickActionsItem value, $Res Function(QuickActionsItem) then) =
      _$QuickActionsItemCopyWithImpl<$Res, QuickActionsItem>;
  @useResult
  $Res call({int? quickActionsIndex});
}

/// @nodoc
class _$QuickActionsItemCopyWithImpl<$Res, $Val extends QuickActionsItem>
    implements $QuickActionsItemCopyWith<$Res> {
  _$QuickActionsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_value.copyWith(
      quickActionsIndex: freezed == quickActionsIndex
          ? _value.quickActionsIndex
          : quickActionsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteUnionStopCopyWith<$Res>
    implements $QuickActionsItemCopyWith<$Res> {
  factory _$$FavoriteUnionStopCopyWith(
          _$FavoriteUnionStop value, $Res Function(_$FavoriteUnionStop) then) =
      __$$FavoriteUnionStopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FavoriteStop stop, int id, int? quickActionsIndex});

  $FavoriteStopCopyWith<$Res> get stop;
}

/// @nodoc
class __$$FavoriteUnionStopCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res, _$FavoriteUnionStop>
    implements _$$FavoriteUnionStopCopyWith<$Res> {
  __$$FavoriteUnionStopCopyWithImpl(
      _$FavoriteUnionStop _value, $Res Function(_$FavoriteUnionStop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? id = null,
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_$FavoriteUnionStop(
      null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as FavoriteStop,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quickActionsIndex: freezed == quickActionsIndex
          ? _value.quickActionsIndex
          : quickActionsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$FavoriteUnionStop extends FavoriteUnionStop {
  const _$FavoriteUnionStop(this.stop,
      {required this.id, this.quickActionsIndex, final String? $type})
      : $type = $type ?? 'stop',
        super._();

  factory _$FavoriteUnionStop.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteUnionStopFromJson(json);

  @override
  final FavoriteStop stop;
  @override
  final int id;
  @override
  final int? quickActionsIndex;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.stop(stop: $stop, id: $id, quickActionsIndex: $quickActionsIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteUnionStop &&
            (identical(other.stop, stop) || other.stop == stop) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quickActionsIndex, quickActionsIndex) ||
                other.quickActionsIndex == quickActionsIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stop, id, quickActionsIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteUnionStopCopyWith<_$FavoriteUnionStop> get copyWith =>
      __$$FavoriteUnionStopCopyWithImpl<_$FavoriteUnionStop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) {
    return stop(this.stop, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int? quickActionsIndex)? stationTabsCurrentLocation,
  }) {
    return stop?.call(this.stop, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int? quickActionsIndex)? stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this.stop, id, quickActionsIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteUnionStop value) stop,
    required TResult Function(FavoriteUnionRoute value) route,
    required TResult Function(FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteUnionStop value)? stop,
    TResult? Function(FavoriteUnionRoute value)? route,
    TResult? Function(FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteUnionStop value)? stop,
    TResult Function(FavoriteUnionRoute value)? route,
    TResult Function(FavoriteUnionStationTabsCurrentLocation value)?
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
    return _$$FavoriteUnionStopToJson(
      this,
    );
  }
}

abstract class FavoriteUnionStop extends QuickActionsItem {
  const factory FavoriteUnionStop(final FavoriteStop stop,
      {required final int id,
      final int? quickActionsIndex}) = _$FavoriteUnionStop;
  const FavoriteUnionStop._() : super._();

  factory FavoriteUnionStop.fromJson(Map<String, dynamic> json) =
      _$FavoriteUnionStop.fromJson;

  FavoriteStop get stop;
  int get id;
  @override
  int? get quickActionsIndex;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteUnionStopCopyWith<_$FavoriteUnionStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteUnionRouteCopyWith<$Res>
    implements $QuickActionsItemCopyWith<$Res> {
  factory _$$FavoriteUnionRouteCopyWith(_$FavoriteUnionRoute value,
          $Res Function(_$FavoriteUnionRoute) then) =
      __$$FavoriteUnionRouteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalRoute route, int id, int? quickActionsIndex});

  $LocalRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$$FavoriteUnionRouteCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res, _$FavoriteUnionRoute>
    implements _$$FavoriteUnionRouteCopyWith<$Res> {
  __$$FavoriteUnionRouteCopyWithImpl(
      _$FavoriteUnionRoute _value, $Res Function(_$FavoriteUnionRoute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? id = null,
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_$FavoriteUnionRoute(
      null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as LocalRoute,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quickActionsIndex: freezed == quickActionsIndex
          ? _value.quickActionsIndex
          : quickActionsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$FavoriteUnionRoute extends FavoriteUnionRoute {
  const _$FavoriteUnionRoute(this.route,
      {required this.id, this.quickActionsIndex, final String? $type})
      : $type = $type ?? 'route',
        super._();

  factory _$FavoriteUnionRoute.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteUnionRouteFromJson(json);

  @override
  final LocalRoute route;
  @override
  final int id;
  @override
  final int? quickActionsIndex;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.route(route: $route, id: $id, quickActionsIndex: $quickActionsIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteUnionRoute &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quickActionsIndex, quickActionsIndex) ||
                other.quickActionsIndex == quickActionsIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, route, id, quickActionsIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteUnionRouteCopyWith<_$FavoriteUnionRoute> get copyWith =>
      __$$FavoriteUnionRouteCopyWithImpl<_$FavoriteUnionRoute>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) {
    return route(this.route, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int? quickActionsIndex)? stationTabsCurrentLocation,
  }) {
    return route?.call(this.route, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int? quickActionsIndex)? stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (route != null) {
      return route(this.route, id, quickActionsIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteUnionStop value) stop,
    required TResult Function(FavoriteUnionRoute value) route,
    required TResult Function(FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) {
    return route(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteUnionStop value)? stop,
    TResult? Function(FavoriteUnionRoute value)? route,
    TResult? Function(FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) {
    return route?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteUnionStop value)? stop,
    TResult Function(FavoriteUnionRoute value)? route,
    TResult Function(FavoriteUnionStationTabsCurrentLocation value)?
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
    return _$$FavoriteUnionRouteToJson(
      this,
    );
  }
}

abstract class FavoriteUnionRoute extends QuickActionsItem {
  const factory FavoriteUnionRoute(final LocalRoute route,
      {required final int id,
      final int? quickActionsIndex}) = _$FavoriteUnionRoute;
  const FavoriteUnionRoute._() : super._();

  factory FavoriteUnionRoute.fromJson(Map<String, dynamic> json) =
      _$FavoriteUnionRoute.fromJson;

  LocalRoute get route;
  int get id;
  @override
  int? get quickActionsIndex;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteUnionRouteCopyWith<_$FavoriteUnionRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteUnionStationTabsCurrentLocationCopyWith<$Res>
    implements $QuickActionsItemCopyWith<$Res> {
  factory _$$FavoriteUnionStationTabsCurrentLocationCopyWith(
          _$FavoriteUnionStationTabsCurrentLocation value,
          $Res Function(_$FavoriteUnionStationTabsCurrentLocation) then) =
      __$$FavoriteUnionStationTabsCurrentLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? quickActionsIndex});
}

/// @nodoc
class __$$FavoriteUnionStationTabsCurrentLocationCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res,
        _$FavoriteUnionStationTabsCurrentLocation>
    implements _$$FavoriteUnionStationTabsCurrentLocationCopyWith<$Res> {
  __$$FavoriteUnionStationTabsCurrentLocationCopyWithImpl(
      _$FavoriteUnionStationTabsCurrentLocation _value,
      $Res Function(_$FavoriteUnionStationTabsCurrentLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_$FavoriteUnionStationTabsCurrentLocation(
      quickActionsIndex: freezed == quickActionsIndex
          ? _value.quickActionsIndex
          : quickActionsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteUnionStationTabsCurrentLocation
    extends FavoriteUnionStationTabsCurrentLocation {
  const _$FavoriteUnionStationTabsCurrentLocation(
      {this.quickActionsIndex, final String? $type})
      : $type = $type ?? 'stationTabsCurrentLocation',
        super._();

  factory _$FavoriteUnionStationTabsCurrentLocation.fromJson(
          Map<String, dynamic> json) =>
      _$$FavoriteUnionStationTabsCurrentLocationFromJson(json);

  @override
  final int? quickActionsIndex;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.stationTabsCurrentLocation(quickActionsIndex: $quickActionsIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteUnionStationTabsCurrentLocation &&
            (identical(other.quickActionsIndex, quickActionsIndex) ||
                other.quickActionsIndex == quickActionsIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quickActionsIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteUnionStationTabsCurrentLocationCopyWith<
          _$FavoriteUnionStationTabsCurrentLocation>
      get copyWith => __$$FavoriteUnionStationTabsCurrentLocationCopyWithImpl<
          _$FavoriteUnionStationTabsCurrentLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation(quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int? quickActionsIndex)? stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation?.call(quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int? quickActionsIndex)? stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stationTabsCurrentLocation != null) {
      return stationTabsCurrentLocation(quickActionsIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteUnionStop value) stop,
    required TResult Function(FavoriteUnionRoute value) route,
    required TResult Function(FavoriteUnionStationTabsCurrentLocation value)
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteUnionStop value)? stop,
    TResult? Function(FavoriteUnionRoute value)? route,
    TResult? Function(FavoriteUnionStationTabsCurrentLocation value)?
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteUnionStop value)? stop,
    TResult Function(FavoriteUnionRoute value)? route,
    TResult Function(FavoriteUnionStationTabsCurrentLocation value)?
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
    return _$$FavoriteUnionStationTabsCurrentLocationToJson(
      this,
    );
  }
}

abstract class FavoriteUnionStationTabsCurrentLocation
    extends QuickActionsItem {
  const factory FavoriteUnionStationTabsCurrentLocation(
          {final int? quickActionsIndex}) =
      _$FavoriteUnionStationTabsCurrentLocation;
  const FavoriteUnionStationTabsCurrentLocation._() : super._();

  factory FavoriteUnionStationTabsCurrentLocation.fromJson(
          Map<String, dynamic> json) =
      _$FavoriteUnionStationTabsCurrentLocation.fromJson;

  @override
  int? get quickActionsIndex;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteUnionStationTabsCurrentLocationCopyWith<
          _$FavoriteUnionStationTabsCurrentLocation>
      get copyWith => throw _privateConstructorUsedError;
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
    required TResult Function(QuickActionsItem item) item,
    required TResult Function() divider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsItem item)? item,
    TResult? Function()? divider,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuickActionsItem item)? item,
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
  $Res call({QuickActionsItem item});

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
  }) {
    return _then(_$QuickActionsFavoriteItem(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as QuickActionsItem,
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
  const _$QuickActionsFavoriteItem(this.item, {final String? $type})
      : $type = $type ?? 'item';

  factory _$QuickActionsFavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$$QuickActionsFavoriteItemFromJson(json);

  @override
  final QuickActionsItem item;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsReorderableItem.item(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickActionsFavoriteItem &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

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
    required TResult Function(QuickActionsItem item) item,
    required TResult Function() divider,
  }) {
    return item(this.item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsItem item)? item,
    TResult? Function()? divider,
  }) {
    return item?.call(this.item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuickActionsItem item)? item,
    TResult Function()? divider,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this.item);
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
  const factory QuickActionsFavoriteItem(final QuickActionsItem item) =
      _$QuickActionsFavoriteItem;

  factory QuickActionsFavoriteItem.fromJson(Map<String, dynamic> json) =
      _$QuickActionsFavoriteItem.fromJson;

  QuickActionsItem get item;
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
    required TResult Function(QuickActionsItem item) item,
    required TResult Function() divider,
  }) {
    return divider();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuickActionsItem item)? item,
    TResult? Function()? divider,
  }) {
    return divider?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuickActionsItem item)? item,
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
