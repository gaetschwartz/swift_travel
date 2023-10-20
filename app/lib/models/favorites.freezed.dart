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
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)
        v2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult? Function(
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)?
        v2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)?
        v1,
    TResult Function(
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)?
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
abstract class _$$LocalRouteV1ImplCopyWith<$Res>
    implements $LocalRouteCopyWith<$Res> {
  factory _$$LocalRouteV1ImplCopyWith(
          _$LocalRouteV1Impl value, $Res Function(_$LocalRouteV1Impl) then) =
      __$$LocalRouteV1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, String? displayName, DateTime? timestamp});
}

/// @nodoc
class __$$LocalRouteV1ImplCopyWithImpl<$Res>
    extends _$LocalRouteCopyWithImpl<$Res, _$LocalRouteV1Impl>
    implements _$$LocalRouteV1ImplCopyWith<$Res> {
  __$$LocalRouteV1ImplCopyWithImpl(
      _$LocalRouteV1Impl _value, $Res Function(_$LocalRouteV1Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$LocalRouteV1Impl(
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
class _$LocalRouteV1Impl extends LocalRouteV1 {
  const _$LocalRouteV1Impl(this.from, this.to,
      {this.displayName, this.timestamp, final String? $type})
      : $type = $type ?? 'v1',
        super._();

  factory _$LocalRouteV1Impl.fromJson(Map<String, dynamic> json) =>
      _$$LocalRouteV1ImplFromJson(json);

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
            other is _$LocalRouteV1Impl &&
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
  _$$LocalRouteV1ImplCopyWith<_$LocalRouteV1Impl> get copyWith =>
      __$$LocalRouteV1ImplCopyWithImpl<_$LocalRouteV1Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)
        v1,
    required TResult Function(
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)
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
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)?
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
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)?
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
    return _$$LocalRouteV1ImplToJson(
      this,
    );
  }
}

abstract class LocalRouteV1 extends LocalRoute {
  const factory LocalRouteV1(final String from, final String to,
      {final String? displayName,
      final DateTime? timestamp}) = _$LocalRouteV1Impl;
  const LocalRouteV1._() : super._();

  factory LocalRouteV1.fromJson(Map<String, dynamic> json) =
      _$LocalRouteV1Impl.fromJson;

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
  _$$LocalRouteV1ImplCopyWith<_$LocalRouteV1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalRouteV2ImplCopyWith<$Res>
    implements $LocalRouteCopyWith<$Res> {
  factory _$$LocalRouteV2ImplCopyWith(
          _$LocalRouteV2Impl value, $Res Function(_$LocalRouteV2Impl) then) =
      __$$LocalRouteV2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SchStop from, SchStop to, String? displayName, DateTime? timestamp});

  $SchStopCopyWith<$Res> get from;
  $SchStopCopyWith<$Res> get to;
}

/// @nodoc
class __$$LocalRouteV2ImplCopyWithImpl<$Res>
    extends _$LocalRouteCopyWithImpl<$Res, _$LocalRouteV2Impl>
    implements _$$LocalRouteV2ImplCopyWith<$Res> {
  __$$LocalRouteV2ImplCopyWithImpl(
      _$LocalRouteV2Impl _value, $Res Function(_$LocalRouteV2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? displayName = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$LocalRouteV2Impl(
      null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as SchStop,
      null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as SchStop,
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
  $SchStopCopyWith<$Res> get from {
    return $SchStopCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SchStopCopyWith<$Res> get to {
    return $SchStopCopyWith<$Res>(_value.to, (value) {
      return _then(_value.copyWith(to: value));
    });
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$LocalRouteV2Impl extends LocalRouteV2 {
  const _$LocalRouteV2Impl(this.from, this.to,
      {this.displayName, this.timestamp, final String? $type})
      : $type = $type ?? 'v2',
        super._();

  factory _$LocalRouteV2Impl.fromJson(Map<String, dynamic> json) =>
      _$$LocalRouteV2ImplFromJson(json);

  @override
  final SchStop from;
  @override
  final SchStop to;
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
            other is _$LocalRouteV2Impl &&
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
  _$$LocalRouteV2ImplCopyWith<_$LocalRouteV2Impl> get copyWith =>
      __$$LocalRouteV2ImplCopyWithImpl<_$LocalRouteV2Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String from, String to, String? displayName, DateTime? timestamp)
        v1,
    required TResult Function(
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)
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
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)?
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
            SchStop from, SchStop to, String? displayName, DateTime? timestamp)?
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
    return _$$LocalRouteV2ImplToJson(
      this,
    );
  }
}

abstract class LocalRouteV2 extends LocalRoute {
  const factory LocalRouteV2(final SchStop from, final SchStop to,
      {final String? displayName,
      final DateTime? timestamp}) = _$LocalRouteV2Impl;
  const LocalRouteV2._() : super._();

  factory LocalRouteV2.fromJson(Map<String, dynamic> json) =
      _$LocalRouteV2Impl.fromJson;

  @override
  SchStop get from;
  @override
  SchStop get to;
  @override
  String? get displayName;
  @override
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$LocalRouteV2ImplCopyWith<_$LocalRouteV2Impl> get copyWith =>
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
abstract class _$$FavoriteStopImplCopyWith<$Res>
    implements $FavoriteStopCopyWith<$Res> {
  factory _$$FavoriteStopImplCopyWith(
          _$FavoriteStopImpl value, $Res Function(_$FavoriteStopImpl) then) =
      __$$FavoriteStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stop, String name, String? api, String? id});
}

/// @nodoc
class __$$FavoriteStopImplCopyWithImpl<$Res>
    extends _$FavoriteStopCopyWithImpl<$Res, _$FavoriteStopImpl>
    implements _$$FavoriteStopImplCopyWith<$Res> {
  __$$FavoriteStopImplCopyWithImpl(
      _$FavoriteStopImpl _value, $Res Function(_$FavoriteStopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? name = null,
    Object? api = freezed,
    Object? id = freezed,
  }) {
    return _then(_$FavoriteStopImpl(
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
class _$FavoriteStopImpl extends _FavoriteStop {
  const _$FavoriteStopImpl(
      {required this.stop, required this.name, this.api, this.id})
      : super._();

  factory _$FavoriteStopImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteStopImplFromJson(json);

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
            other is _$FavoriteStopImpl &&
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
  _$$FavoriteStopImplCopyWith<_$FavoriteStopImpl> get copyWith =>
      __$$FavoriteStopImplCopyWithImpl<_$FavoriteStopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteStopImplToJson(
      this,
    );
  }
}

abstract class _FavoriteStop extends FavoriteStop {
  const factory _FavoriteStop(
      {required final String stop,
      required final String name,
      final String? api,
      final String? id}) = _$FavoriteStopImpl;
  const _FavoriteStop._() : super._();

  factory _FavoriteStop.fromJson(Map<String, dynamic> json) =
      _$FavoriteStopImpl.fromJson;

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
  _$$FavoriteStopImplCopyWith<_$FavoriteStopImpl> get copyWith =>
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
  int get id => throw _privateConstructorUsedError;
  int? get quickActionsIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int id, int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
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
  $Res call({int id, int? quickActionsIndex});
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
    Object? id = null,
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quickActionsIndex: freezed == quickActionsIndex
          ? _value.quickActionsIndex
          : quickActionsIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteUnionStopImplCopyWith<$Res>
    implements $QuickActionsItemCopyWith<$Res> {
  factory _$$FavoriteUnionStopImplCopyWith(_$FavoriteUnionStopImpl value,
          $Res Function(_$FavoriteUnionStopImpl) then) =
      __$$FavoriteUnionStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FavoriteStop stop, int id, int? quickActionsIndex});

  $FavoriteStopCopyWith<$Res> get stop;
}

/// @nodoc
class __$$FavoriteUnionStopImplCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res, _$FavoriteUnionStopImpl>
    implements _$$FavoriteUnionStopImplCopyWith<$Res> {
  __$$FavoriteUnionStopImplCopyWithImpl(_$FavoriteUnionStopImpl _value,
      $Res Function(_$FavoriteUnionStopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stop = null,
    Object? id = null,
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_$FavoriteUnionStopImpl(
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
class _$FavoriteUnionStopImpl extends FavoriteUnionStop {
  const _$FavoriteUnionStopImpl(this.stop,
      {required this.id, this.quickActionsIndex, final String? $type})
      : $type = $type ?? 'stop',
        super._();

  factory _$FavoriteUnionStopImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteUnionStopImplFromJson(json);

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
            other is _$FavoriteUnionStopImpl &&
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
  _$$FavoriteUnionStopImplCopyWith<_$FavoriteUnionStopImpl> get copyWith =>
      __$$FavoriteUnionStopImplCopyWithImpl<_$FavoriteUnionStopImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int id, int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) {
    return stop(this.stop, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
  }) {
    return stop?.call(this.stop, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
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
    return _$$FavoriteUnionStopImplToJson(
      this,
    );
  }
}

abstract class FavoriteUnionStop extends QuickActionsItem {
  const factory FavoriteUnionStop(final FavoriteStop stop,
      {required final int id,
      final int? quickActionsIndex}) = _$FavoriteUnionStopImpl;
  const FavoriteUnionStop._() : super._();

  factory FavoriteUnionStop.fromJson(Map<String, dynamic> json) =
      _$FavoriteUnionStopImpl.fromJson;

  FavoriteStop get stop;
  @override
  int get id;
  @override
  int? get quickActionsIndex;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteUnionStopImplCopyWith<_$FavoriteUnionStopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteUnionRouteImplCopyWith<$Res>
    implements $QuickActionsItemCopyWith<$Res> {
  factory _$$FavoriteUnionRouteImplCopyWith(_$FavoriteUnionRouteImpl value,
          $Res Function(_$FavoriteUnionRouteImpl) then) =
      __$$FavoriteUnionRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalRoute route, int id, int? quickActionsIndex});

  $LocalRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$$FavoriteUnionRouteImplCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res, _$FavoriteUnionRouteImpl>
    implements _$$FavoriteUnionRouteImplCopyWith<$Res> {
  __$$FavoriteUnionRouteImplCopyWithImpl(_$FavoriteUnionRouteImpl _value,
      $Res Function(_$FavoriteUnionRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? id = null,
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_$FavoriteUnionRouteImpl(
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
class _$FavoriteUnionRouteImpl extends FavoriteUnionRoute {
  const _$FavoriteUnionRouteImpl(this.route,
      {required this.id, this.quickActionsIndex, final String? $type})
      : $type = $type ?? 'route',
        super._();

  factory _$FavoriteUnionRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteUnionRouteImplFromJson(json);

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
            other is _$FavoriteUnionRouteImpl &&
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
  _$$FavoriteUnionRouteImplCopyWith<_$FavoriteUnionRouteImpl> get copyWith =>
      __$$FavoriteUnionRouteImplCopyWithImpl<_$FavoriteUnionRouteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int id, int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) {
    return route(this.route, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
  }) {
    return route?.call(this.route, id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
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
    return _$$FavoriteUnionRouteImplToJson(
      this,
    );
  }
}

abstract class FavoriteUnionRoute extends QuickActionsItem {
  const factory FavoriteUnionRoute(final LocalRoute route,
      {required final int id,
      final int? quickActionsIndex}) = _$FavoriteUnionRouteImpl;
  const FavoriteUnionRoute._() : super._();

  factory FavoriteUnionRoute.fromJson(Map<String, dynamic> json) =
      _$FavoriteUnionRouteImpl.fromJson;

  LocalRoute get route;
  @override
  int get id;
  @override
  int? get quickActionsIndex;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteUnionRouteImplCopyWith<_$FavoriteUnionRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteUnionStationTabsCurrentLocationImplCopyWith<$Res>
    implements $QuickActionsItemCopyWith<$Res> {
  factory _$$FavoriteUnionStationTabsCurrentLocationImplCopyWith(
          _$FavoriteUnionStationTabsCurrentLocationImpl value,
          $Res Function(_$FavoriteUnionStationTabsCurrentLocationImpl) then) =
      __$$FavoriteUnionStationTabsCurrentLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int? quickActionsIndex});
}

/// @nodoc
class __$$FavoriteUnionStationTabsCurrentLocationImplCopyWithImpl<$Res>
    extends _$QuickActionsItemCopyWithImpl<$Res,
        _$FavoriteUnionStationTabsCurrentLocationImpl>
    implements _$$FavoriteUnionStationTabsCurrentLocationImplCopyWith<$Res> {
  __$$FavoriteUnionStationTabsCurrentLocationImplCopyWithImpl(
      _$FavoriteUnionStationTabsCurrentLocationImpl _value,
      $Res Function(_$FavoriteUnionStationTabsCurrentLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quickActionsIndex = freezed,
  }) {
    return _then(_$FavoriteUnionStationTabsCurrentLocationImpl(
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
}

/// @nodoc
@JsonSerializable()
class _$FavoriteUnionStationTabsCurrentLocationImpl
    extends FavoriteUnionStationTabsCurrentLocation {
  const _$FavoriteUnionStationTabsCurrentLocationImpl(
      {required this.id, this.quickActionsIndex, final String? $type})
      : $type = $type ?? 'stationTabsCurrentLocation',
        super._();

  factory _$FavoriteUnionStationTabsCurrentLocationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FavoriteUnionStationTabsCurrentLocationImplFromJson(json);

  @override
  final int id;
  @override
  final int? quickActionsIndex;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'QuickActionsItem.stationTabsCurrentLocation(id: $id, quickActionsIndex: $quickActionsIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteUnionStationTabsCurrentLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quickActionsIndex, quickActionsIndex) ||
                other.quickActionsIndex == quickActionsIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quickActionsIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteUnionStationTabsCurrentLocationImplCopyWith<
          _$FavoriteUnionStationTabsCurrentLocationImpl>
      get copyWith =>
          __$$FavoriteUnionStationTabsCurrentLocationImplCopyWithImpl<
              _$FavoriteUnionStationTabsCurrentLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)
        stop,
    required TResult Function(LocalRoute route, int id, int? quickActionsIndex)
        route,
    required TResult Function(int id, int? quickActionsIndex)
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation(id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult? Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult? Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
  }) {
    return stationTabsCurrentLocation?.call(id, quickActionsIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FavoriteStop stop, int id, int? quickActionsIndex)? stop,
    TResult Function(LocalRoute route, int id, int? quickActionsIndex)? route,
    TResult Function(int id, int? quickActionsIndex)?
        stationTabsCurrentLocation,
    required TResult orElse(),
  }) {
    if (stationTabsCurrentLocation != null) {
      return stationTabsCurrentLocation(id, quickActionsIndex);
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
    return _$$FavoriteUnionStationTabsCurrentLocationImplToJson(
      this,
    );
  }
}

abstract class FavoriteUnionStationTabsCurrentLocation
    extends QuickActionsItem {
  const factory FavoriteUnionStationTabsCurrentLocation(
          {required final int id, final int? quickActionsIndex}) =
      _$FavoriteUnionStationTabsCurrentLocationImpl;
  const FavoriteUnionStationTabsCurrentLocation._() : super._();

  factory FavoriteUnionStationTabsCurrentLocation.fromJson(
          Map<String, dynamic> json) =
      _$FavoriteUnionStationTabsCurrentLocationImpl.fromJson;

  @override
  int get id;
  @override
  int? get quickActionsIndex;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteUnionStationTabsCurrentLocationImplCopyWith<
          _$FavoriteUnionStationTabsCurrentLocationImpl>
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
abstract class _$$QuickActionsFavoriteItemImplCopyWith<$Res> {
  factory _$$QuickActionsFavoriteItemImplCopyWith(
          _$QuickActionsFavoriteItemImpl value,
          $Res Function(_$QuickActionsFavoriteItemImpl) then) =
      __$$QuickActionsFavoriteItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuickActionsItem item});

  $QuickActionsItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$QuickActionsFavoriteItemImplCopyWithImpl<$Res>
    extends _$QuickActionsReorderableItemCopyWithImpl<$Res,
        _$QuickActionsFavoriteItemImpl>
    implements _$$QuickActionsFavoriteItemImplCopyWith<$Res> {
  __$$QuickActionsFavoriteItemImplCopyWithImpl(
      _$QuickActionsFavoriteItemImpl _value,
      $Res Function(_$QuickActionsFavoriteItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$QuickActionsFavoriteItemImpl(
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
class _$QuickActionsFavoriteItemImpl implements QuickActionsFavoriteItem {
  const _$QuickActionsFavoriteItemImpl(this.item, {final String? $type})
      : $type = $type ?? 'item';

  factory _$QuickActionsFavoriteItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickActionsFavoriteItemImplFromJson(json);

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
            other is _$QuickActionsFavoriteItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickActionsFavoriteItemImplCopyWith<_$QuickActionsFavoriteItemImpl>
      get copyWith => __$$QuickActionsFavoriteItemImplCopyWithImpl<
          _$QuickActionsFavoriteItemImpl>(this, _$identity);

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
    return _$$QuickActionsFavoriteItemImplToJson(
      this,
    );
  }
}

abstract class QuickActionsFavoriteItem implements QuickActionsReorderableItem {
  const factory QuickActionsFavoriteItem(final QuickActionsItem item) =
      _$QuickActionsFavoriteItemImpl;

  factory QuickActionsFavoriteItem.fromJson(Map<String, dynamic> json) =
      _$QuickActionsFavoriteItemImpl.fromJson;

  QuickActionsItem get item;
  @JsonKey(ignore: true)
  _$$QuickActionsFavoriteItemImplCopyWith<_$QuickActionsFavoriteItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuickActionsFavoriteDividerImplCopyWith<$Res> {
  factory _$$QuickActionsFavoriteDividerImplCopyWith(
          _$QuickActionsFavoriteDividerImpl value,
          $Res Function(_$QuickActionsFavoriteDividerImpl) then) =
      __$$QuickActionsFavoriteDividerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuickActionsFavoriteDividerImplCopyWithImpl<$Res>
    extends _$QuickActionsReorderableItemCopyWithImpl<$Res,
        _$QuickActionsFavoriteDividerImpl>
    implements _$$QuickActionsFavoriteDividerImplCopyWith<$Res> {
  __$$QuickActionsFavoriteDividerImplCopyWithImpl(
      _$QuickActionsFavoriteDividerImpl _value,
      $Res Function(_$QuickActionsFavoriteDividerImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$QuickActionsFavoriteDividerImpl implements QuickActionsFavoriteDivider {
  const _$QuickActionsFavoriteDividerImpl({final String? $type})
      : $type = $type ?? 'divider';

  factory _$QuickActionsFavoriteDividerImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$QuickActionsFavoriteDividerImplFromJson(json);

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
            other is _$QuickActionsFavoriteDividerImpl);
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
    return _$$QuickActionsFavoriteDividerImplToJson(
      this,
    );
  }
}

abstract class QuickActionsFavoriteDivider
    implements QuickActionsReorderableItem {
  const factory QuickActionsFavoriteDivider() =
      _$QuickActionsFavoriteDividerImpl;

  factory QuickActionsFavoriteDivider.fromJson(Map<String, dynamic> json) =
      _$QuickActionsFavoriteDividerImpl.fromJson;
}
