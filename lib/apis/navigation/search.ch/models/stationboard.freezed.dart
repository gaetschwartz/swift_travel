// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stationboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbStationboard _$SbbStationboardFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return SbbStationboardData.fromJson(json);
    case 'error':
      return SbbStationboardError.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$SbbStationboardTearOff {
  const _$SbbStationboardTearOff();

  SbbStationboardData call(
      {@JsonKey(name: 'stop')
          required SbbStop sbbStop,
      @JsonKey(name: 'connections')
          List<SbbStationboardConnection>
              sbbConnections = const <SbbStationboardConnection>[],
      List<String> messages = const <String>[]}) {
    return SbbStationboardData(
      sbbStop: sbbStop,
      sbbConnections: sbbConnections,
      messages: messages,
    );
  }

  SbbStationboardError error(List<String> messages) {
    return SbbStationboardError(
      messages,
    );
  }

  SbbStationboard fromJson(Map<String, Object> json) {
    return SbbStationboard.fromJson(json);
  }
}

/// @nodoc
const $SbbStationboard = _$SbbStationboardTearOff();

/// @nodoc
mixin _$SbbStationboard {
  List<String> get messages => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'stop')
                SbbStop sbbStop,
            @JsonKey(name: 'connections')
                List<SbbStationboardConnection> sbbConnections,
            List<String> messages)
        $default, {
    required TResult Function(List<String> messages) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'stop')
                SbbStop sbbStop,
            @JsonKey(name: 'connections')
                List<SbbStationboardConnection> sbbConnections,
            List<String> messages)?
        $default, {
    TResult Function(List<String> messages)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SbbStationboardData value) $default, {
    required TResult Function(SbbStationboardError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SbbStationboardData value)? $default, {
    TResult Function(SbbStationboardError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbStationboardCopyWith<SbbStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbStationboardCopyWith<$Res> {
  factory $SbbStationboardCopyWith(
          SbbStationboard value, $Res Function(SbbStationboard) then) =
      _$SbbStationboardCopyWithImpl<$Res>;
  $Res call({List<String> messages});
}

/// @nodoc
class _$SbbStationboardCopyWithImpl<$Res>
    implements $SbbStationboardCopyWith<$Res> {
  _$SbbStationboardCopyWithImpl(this._value, this._then);

  final SbbStationboard _value;
  // ignore: unused_field
  final $Res Function(SbbStationboard) _then;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages:
          messages == freezed ? _value.messages : messages as List<String>,
    ));
  }
}

/// @nodoc
abstract class $SbbStationboardDataCopyWith<$Res>
    implements $SbbStationboardCopyWith<$Res> {
  factory $SbbStationboardDataCopyWith(
          SbbStationboardData value, $Res Function(SbbStationboardData) then) =
      _$SbbStationboardDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'stop')
          SbbStop sbbStop,
      @JsonKey(name: 'connections')
          List<SbbStationboardConnection> sbbConnections,
      List<String> messages});

  $SbbStopCopyWith<$Res> get sbbStop;
}

/// @nodoc
class _$SbbStationboardDataCopyWithImpl<$Res>
    extends _$SbbStationboardCopyWithImpl<$Res>
    implements $SbbStationboardDataCopyWith<$Res> {
  _$SbbStationboardDataCopyWithImpl(
      SbbStationboardData _value, $Res Function(SbbStationboardData) _then)
      : super(_value, (v) => _then(v as SbbStationboardData));

  @override
  SbbStationboardData get _value => super._value as SbbStationboardData;

  @override
  $Res call({
    Object? sbbStop = freezed,
    Object? sbbConnections = freezed,
    Object? messages = freezed,
  }) {
    return _then(SbbStationboardData(
      sbbStop: sbbStop == freezed ? _value.sbbStop : sbbStop as SbbStop,
      sbbConnections: sbbConnections == freezed
          ? _value.sbbConnections
          : sbbConnections as List<SbbStationboardConnection>,
      messages:
          messages == freezed ? _value.messages : messages as List<String>,
    ));
  }

  @override
  $SbbStopCopyWith<$Res> get sbbStop {
    return $SbbStopCopyWith<$Res>(_value.sbbStop, (value) {
      return _then(_value.copyWith(sbbStop: value));
    });
  }
}

@JsonSerializable()
@With(_StationboardDataMixin)
@With(StationboardData)

/// @nodoc
class _$SbbStationboardData extends SbbStationboardData
    with _StationboardDataMixin, StationboardData {
  const _$SbbStationboardData(
      {@JsonKey(name: 'stop')
          required this.sbbStop,
      @JsonKey(name: 'connections')
          this.sbbConnections = const <SbbStationboardConnection>[],
      this.messages = const <String>[]})
      : super._();

  factory _$SbbStationboardData.fromJson(Map<String, dynamic> json) =>
      _$_$SbbStationboardDataFromJson(json);

  @override
  @JsonKey(name: 'stop')
  final SbbStop sbbStop;
  @override
  @JsonKey(name: 'connections')
  final List<SbbStationboardConnection> sbbConnections;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> messages;

  @override
  String toString() {
    return 'SbbStationboard(sbbStop: $sbbStop, sbbConnections: $sbbConnections, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SbbStationboardData &&
            (identical(other.sbbStop, sbbStop) ||
                const DeepCollectionEquality()
                    .equals(other.sbbStop, sbbStop)) &&
            (identical(other.sbbConnections, sbbConnections) ||
                const DeepCollectionEquality()
                    .equals(other.sbbConnections, sbbConnections)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sbbStop) ^
      const DeepCollectionEquality().hash(sbbConnections) ^
      const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  $SbbStationboardDataCopyWith<SbbStationboardData> get copyWith =>
      _$SbbStationboardDataCopyWithImpl<SbbStationboardData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'stop')
                SbbStop sbbStop,
            @JsonKey(name: 'connections')
                List<SbbStationboardConnection> sbbConnections,
            List<String> messages)
        $default, {
    required TResult Function(List<String> messages) error,
  }) {
    return $default(sbbStop, sbbConnections, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'stop')
                SbbStop sbbStop,
            @JsonKey(name: 'connections')
                List<SbbStationboardConnection> sbbConnections,
            List<String> messages)?
        $default, {
    TResult Function(List<String> messages)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(sbbStop, sbbConnections, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SbbStationboardData value) $default, {
    required TResult Function(SbbStationboardError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SbbStationboardData value)? $default, {
    TResult Function(SbbStationboardError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SbbStationboardDataToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class SbbStationboardData extends SbbStationboard
    implements _StationboardDataMixin, StationboardData {
  const SbbStationboardData._() : super._();
  const factory SbbStationboardData(
      {@JsonKey(name: 'stop')
          required SbbStop sbbStop,
      @JsonKey(name: 'connections')
          List<SbbStationboardConnection> sbbConnections,
      List<String> messages}) = _$SbbStationboardData;

  factory SbbStationboardData.fromJson(Map<String, dynamic> json) =
      _$SbbStationboardData.fromJson;

  @JsonKey(name: 'stop')
  SbbStop get sbbStop => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections')
  List<SbbStationboardConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  @override
  List<String> get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SbbStationboardDataCopyWith<SbbStationboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbStationboardErrorCopyWith<$Res>
    implements $SbbStationboardCopyWith<$Res> {
  factory $SbbStationboardErrorCopyWith(SbbStationboardError value,
          $Res Function(SbbStationboardError) then) =
      _$SbbStationboardErrorCopyWithImpl<$Res>;
  @override
  $Res call({List<String> messages});
}

/// @nodoc
class _$SbbStationboardErrorCopyWithImpl<$Res>
    extends _$SbbStationboardCopyWithImpl<$Res>
    implements $SbbStationboardErrorCopyWith<$Res> {
  _$SbbStationboardErrorCopyWithImpl(
      SbbStationboardError _value, $Res Function(SbbStationboardError) _then)
      : super(_value, (v) => _then(v as SbbStationboardError));

  @override
  SbbStationboardError get _value => super._value as SbbStationboardError;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(SbbStationboardError(
      messages == freezed ? _value.messages : messages as List<String>,
    ));
  }
}

@JsonSerializable()
@With(StationboardError)

/// @nodoc
class _$SbbStationboardError extends SbbStationboardError
    with StationboardError {
  const _$SbbStationboardError(this.messages) : super._();

  factory _$SbbStationboardError.fromJson(Map<String, dynamic> json) =>
      _$_$SbbStationboardErrorFromJson(json);

  @override
  final List<String> messages;

  @override
  String toString() {
    return 'SbbStationboard.error(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SbbStationboardError &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  $SbbStationboardErrorCopyWith<SbbStationboardError> get copyWith =>
      _$SbbStationboardErrorCopyWithImpl<SbbStationboardError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'stop')
                SbbStop sbbStop,
            @JsonKey(name: 'connections')
                List<SbbStationboardConnection> sbbConnections,
            List<String> messages)
        $default, {
    required TResult Function(List<String> messages) error,
  }) {
    return error(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'stop')
                SbbStop sbbStop,
            @JsonKey(name: 'connections')
                List<SbbStationboardConnection> sbbConnections,
            List<String> messages)?
        $default, {
    TResult Function(List<String> messages)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(SbbStationboardData value) $default, {
    required TResult Function(SbbStationboardError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(SbbStationboardData value)? $default, {
    TResult Function(SbbStationboardError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SbbStationboardErrorToJson(this)..['runtimeType'] = 'error';
  }
}

abstract class SbbStationboardError extends SbbStationboard
    implements StationboardError {
  const SbbStationboardError._() : super._();
  const factory SbbStationboardError(List<String> messages) =
      _$SbbStationboardError;

  factory SbbStationboardError.fromJson(Map<String, dynamic> json) =
      _$SbbStationboardError.fromJson;

  @override
  List<String> get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SbbStationboardErrorCopyWith<SbbStationboardError> get copyWith =>
      throw _privateConstructorUsedError;
}
