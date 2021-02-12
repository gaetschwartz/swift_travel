// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stationboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CffStationboard _$CffStationboardFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return CffStationboardData.fromJson(json);
    case 'error':
      return CffStationboardError.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$CffStationboardTearOff {
  const _$CffStationboardTearOff();

  CffStationboardData call(
      {required Stop stop,
      required String stopName,
      List<StationboardConnection> connections = const [],
      List<String> messages = const []}) {
    return CffStationboardData(
      stop: stop,
      stopName: stopName,
      connections: connections,
      messages: messages,
    );
  }

  CffStationboardError error(List<String> messages) {
    return CffStationboardError(
      messages,
    );
  }

  CffStationboard fromJson(Map<String, Object> json) {
    return CffStationboard.fromJson(json);
  }
}

/// @nodoc
const $CffStationboard = _$CffStationboardTearOff();

/// @nodoc
mixin _$CffStationboard {
  List<String> get messages;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Stop stop, String stopName,
            List<StationboardConnection> connections, List<String> messages)
        $default, {
    required TResult Function(List<String> messages) error,
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Stop stop, String stopName,
            List<StationboardConnection> connections, List<String> messages)?
        $default, {
    TResult Function(List<String> messages)? error,
    required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CffStationboardData value) $default, {
    required TResult Function(CffStationboardError value) error,
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CffStationboardData value)? $default, {
    TResult Function(CffStationboardError value)? error,
    required TResult orElse(),
  });
  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CffStationboardCopyWith<CffStationboard> get copyWith;
}

/// @nodoc
abstract class $CffStationboardCopyWith<$Res> {
  factory $CffStationboardCopyWith(
          CffStationboard value, $Res Function(CffStationboard) then) =
      _$CffStationboardCopyWithImpl<$Res>;
  $Res call({List<String> messages});
}

/// @nodoc
class _$CffStationboardCopyWithImpl<$Res>
    implements $CffStationboardCopyWith<$Res> {
  _$CffStationboardCopyWithImpl(this._value, this._then);

  final CffStationboard _value;
  // ignore: unused_field
  final $Res Function(CffStationboard) _then;

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
abstract class $CffStationboardDataCopyWith<$Res>
    implements $CffStationboardCopyWith<$Res> {
  factory $CffStationboardDataCopyWith(
          CffStationboardData value, $Res Function(CffStationboardData) then) =
      _$CffStationboardDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Stop stop,
      String stopName,
      List<StationboardConnection> connections,
      List<String> messages});

  $StopCopyWith<$Res> get stop;
}

/// @nodoc
class _$CffStationboardDataCopyWithImpl<$Res>
    extends _$CffStationboardCopyWithImpl<$Res>
    implements $CffStationboardDataCopyWith<$Res> {
  _$CffStationboardDataCopyWithImpl(
      CffStationboardData _value, $Res Function(CffStationboardData) _then)
      : super(_value, (v) => _then(v as CffStationboardData));

  @override
  CffStationboardData get _value => super._value as CffStationboardData;

  @override
  $Res call({
    Object? stop = freezed,
    Object? stopName = freezed,
    Object? connections = freezed,
    Object? messages = freezed,
  }) {
    return _then(CffStationboardData(
      stop: stop == freezed ? _value.stop : stop as Stop,
      stopName: stopName == freezed ? _value.stopName : stopName as String,
      connections: connections == freezed
          ? _value.connections
          : connections as List<StationboardConnection>,
      messages:
          messages == freezed ? _value.messages : messages as List<String>,
    ));
  }

  @override
  $StopCopyWith<$Res> get stop {
    return $StopCopyWith<$Res>(_value.stop, (value) {
      return _then(_value.copyWith(stop: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$CffStationboardData implements CffStationboardData {
  const _$CffStationboardData(
      {required this.stop,
      required this.stopName,
      this.connections = const [],
      this.messages = const []});

  factory _$CffStationboardData.fromJson(Map<String, dynamic> json) =>
      _$_$CffStationboardDataFromJson(json);

  @override
  final Stop stop;
  @override
  final String stopName;
  @JsonKey(defaultValue: const [])
  @override
  final List<StationboardConnection> connections;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> messages;

  @override
  String toString() {
    return 'CffStationboard(stop: $stop, stopName: $stopName, connections: $connections, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CffStationboardData &&
            (identical(other.stop, stop) ||
                const DeepCollectionEquality().equals(other.stop, stop)) &&
            (identical(other.stopName, stopName) ||
                const DeepCollectionEquality()
                    .equals(other.stopName, stopName)) &&
            (identical(other.connections, connections) ||
                const DeepCollectionEquality()
                    .equals(other.connections, connections)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stop) ^
      const DeepCollectionEquality().hash(stopName) ^
      const DeepCollectionEquality().hash(connections) ^
      const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  $CffStationboardDataCopyWith<CffStationboardData> get copyWith =>
      _$CffStationboardDataCopyWithImpl<CffStationboardData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Stop stop, String stopName,
            List<StationboardConnection> connections, List<String> messages)
        $default, {
    required TResult Function(List<String> messages) error,
  }) {
    return $default(stop, stopName, connections, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Stop stop, String stopName,
            List<StationboardConnection> connections, List<String> messages)?
        $default, {
    TResult Function(List<String> messages)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(stop, stopName, connections, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CffStationboardData value) $default, {
    required TResult Function(CffStationboardError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CffStationboardData value)? $default, {
    TResult Function(CffStationboardError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CffStationboardDataToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class CffStationboardData implements CffStationboard {
  const factory CffStationboardData(
      {required Stop stop,
      required String stopName,
      List<StationboardConnection> connections,
      List<String> messages}) = _$CffStationboardData;

  factory CffStationboardData.fromJson(Map<String, dynamic> json) =
      _$CffStationboardData.fromJson;

  Stop get stop;
  String get stopName;
  List<StationboardConnection> get connections;
  @override
  List<String> get messages;
  @override
  @JsonKey(ignore: true)
  $CffStationboardDataCopyWith<CffStationboardData> get copyWith;
}

/// @nodoc
abstract class $CffStationboardErrorCopyWith<$Res>
    implements $CffStationboardCopyWith<$Res> {
  factory $CffStationboardErrorCopyWith(CffStationboardError value,
          $Res Function(CffStationboardError) then) =
      _$CffStationboardErrorCopyWithImpl<$Res>;
  @override
  $Res call({List<String> messages});
}

/// @nodoc
class _$CffStationboardErrorCopyWithImpl<$Res>
    extends _$CffStationboardCopyWithImpl<$Res>
    implements $CffStationboardErrorCopyWith<$Res> {
  _$CffStationboardErrorCopyWithImpl(
      CffStationboardError _value, $Res Function(CffStationboardError) _then)
      : super(_value, (v) => _then(v as CffStationboardError));

  @override
  CffStationboardError get _value => super._value as CffStationboardError;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(CffStationboardError(
      messages == freezed ? _value.messages : messages as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$CffStationboardError implements CffStationboardError {
  const _$CffStationboardError(this.messages);

  factory _$CffStationboardError.fromJson(Map<String, dynamic> json) =>
      _$_$CffStationboardErrorFromJson(json);

  @override
  final List<String> messages;

  @override
  String toString() {
    return 'CffStationboard.error(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CffStationboardError &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  $CffStationboardErrorCopyWith<CffStationboardError> get copyWith =>
      _$CffStationboardErrorCopyWithImpl<CffStationboardError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Stop stop, String stopName,
            List<StationboardConnection> connections, List<String> messages)
        $default, {
    required TResult Function(List<String> messages) error,
  }) {
    return error(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Stop stop, String stopName,
            List<StationboardConnection> connections, List<String> messages)?
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
    TResult Function(CffStationboardData value) $default, {
    required TResult Function(CffStationboardError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CffStationboardData value)? $default, {
    TResult Function(CffStationboardError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CffStationboardErrorToJson(this)..['runtimeType'] = 'error';
  }
}

abstract class CffStationboardError implements CffStationboard {
  const factory CffStationboardError(List<String> messages) =
      _$CffStationboardError;

  factory CffStationboardError.fromJson(Map<String, dynamic> json) =
      _$CffStationboardError.fromJson;

  @override
  List<String> get messages;
  @override
  @JsonKey(ignore: true)
  $CffStationboardErrorCopyWith<CffStationboardError> get copyWith;
}
