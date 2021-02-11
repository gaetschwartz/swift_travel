// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cff_stationboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CffStationboard _$CffStationboardFromJson(Map<String, dynamic> json) {
  return _CffStationboard.fromJson(json);
}

/// @nodoc
class _$CffStationboardTearOff {
  const _$CffStationboardTearOff();

  _CffStationboard call(
      {required Stop stop,
      required String stopName,
      List<StationboardConnection> connections = const [],
      String? request,
      List<String> messages = const []}) {
    return _CffStationboard(
      stop: stop,
      stopName: stopName,
      connections: connections,
      request: request,
      messages: messages,
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
  Stop get stop;
  String get stopName;
  List<StationboardConnection> get connections;
  String? get request;
  List<String> get messages;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CffStationboardCopyWith<CffStationboard> get copyWith;
}

/// @nodoc
abstract class $CffStationboardCopyWith<$Res> {
  factory $CffStationboardCopyWith(
          CffStationboard value, $Res Function(CffStationboard) then) =
      _$CffStationboardCopyWithImpl<$Res>;
  $Res call(
      {Stop stop,
      String stopName,
      List<StationboardConnection> connections,
      String? request,
      List<String> messages});

  $StopCopyWith<$Res> get stop;
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
    Object? stop = freezed,
    Object? stopName = freezed,
    Object? connections = freezed,
    Object? request = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      stop: stop == freezed ? _value.stop : stop as Stop,
      stopName: stopName == freezed ? _value.stopName : stopName as String,
      connections: connections == freezed
          ? _value.connections
          : connections as List<StationboardConnection>,
      request: request == freezed ? _value.request : request as String?,
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

/// @nodoc
abstract class _$CffStationboardCopyWith<$Res>
    implements $CffStationboardCopyWith<$Res> {
  factory _$CffStationboardCopyWith(
          _CffStationboard value, $Res Function(_CffStationboard) then) =
      __$CffStationboardCopyWithImpl<$Res>;
  @override
  $Res call(
      {Stop stop,
      String stopName,
      List<StationboardConnection> connections,
      String? request,
      List<String> messages});

  @override
  $StopCopyWith<$Res> get stop;
}

/// @nodoc
class __$CffStationboardCopyWithImpl<$Res>
    extends _$CffStationboardCopyWithImpl<$Res>
    implements _$CffStationboardCopyWith<$Res> {
  __$CffStationboardCopyWithImpl(
      _CffStationboard _value, $Res Function(_CffStationboard) _then)
      : super(_value, (v) => _then(v as _CffStationboard));

  @override
  _CffStationboard get _value => super._value as _CffStationboard;

  @override
  $Res call({
    Object? stop = freezed,
    Object? stopName = freezed,
    Object? connections = freezed,
    Object? request = freezed,
    Object? messages = freezed,
  }) {
    return _then(_CffStationboard(
      stop: stop == freezed ? _value.stop : stop as Stop,
      stopName: stopName == freezed ? _value.stopName : stopName as String,
      connections: connections == freezed
          ? _value.connections
          : connections as List<StationboardConnection>,
      request: request == freezed ? _value.request : request as String?,
      messages:
          messages == freezed ? _value.messages : messages as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CffStationboard implements _CffStationboard {
  const _$_CffStationboard(
      {required this.stop,
      required this.stopName,
      this.connections = const [],
      this.request,
      this.messages = const []});

  factory _$_CffStationboard.fromJson(Map<String, dynamic> json) =>
      _$_$_CffStationboardFromJson(json);

  @override
  final Stop stop;
  @override
  final String stopName;
  @JsonKey(defaultValue: const [])
  @override
  final List<StationboardConnection> connections;
  @override
  final String? request;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> messages;

  @override
  String toString() {
    return 'CffStationboard(stop: $stop, stopName: $stopName, connections: $connections, request: $request, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CffStationboard &&
            (identical(other.stop, stop) ||
                const DeepCollectionEquality().equals(other.stop, stop)) &&
            (identical(other.stopName, stopName) ||
                const DeepCollectionEquality()
                    .equals(other.stopName, stopName)) &&
            (identical(other.connections, connections) ||
                const DeepCollectionEquality()
                    .equals(other.connections, connections)) &&
            (identical(other.request, request) ||
                const DeepCollectionEquality()
                    .equals(other.request, request)) &&
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
      const DeepCollectionEquality().hash(request) ^
      const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  _$CffStationboardCopyWith<_CffStationboard> get copyWith =>
      __$CffStationboardCopyWithImpl<_CffStationboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CffStationboardToJson(this);
  }
}

abstract class _CffStationboard implements CffStationboard {
  const factory _CffStationboard(
      {required Stop stop,
      required String stopName,
      List<StationboardConnection> connections,
      String? request,
      List<String> messages}) = _$_CffStationboard;

  factory _CffStationboard.fromJson(Map<String, dynamic> json) =
      _$_CffStationboard.fromJson;

  @override
  Stop get stop;
  @override
  String get stopName;
  @override
  List<StationboardConnection> get connections;
  @override
  String? get request;
  @override
  List<String> get messages;
  @override
  @JsonKey(ignore: true)
  _$CffStationboardCopyWith<_CffStationboard> get copyWith;
}
