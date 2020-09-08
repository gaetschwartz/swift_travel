// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cff_stationboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CffStationboard _$CffStationboardFromJson(Map<String, dynamic> json) {
  return _CffStationboard.fromJson(json);
}

class _$CffStationboardTearOff {
  const _$CffStationboardTearOff();

// ignore: unused_element
  _CffStationboard call(LocatedStop stop,
      List<StationboardConnection> connections, String request, int eof) {
    return _CffStationboard(
      stop,
      connections,
      request,
      eof,
    );
  }
}

// ignore: unused_element
const $CffStationboard = _$CffStationboardTearOff();

mixin _$CffStationboard {
  LocatedStop get stop;
  List<StationboardConnection> get connections;
  String get request;
  int get eof;

  Map<String, dynamic> toJson();
  $CffStationboardCopyWith<CffStationboard> get copyWith;
}

abstract class $CffStationboardCopyWith<$Res> {
  factory $CffStationboardCopyWith(
          CffStationboard value, $Res Function(CffStationboard) then) =
      _$CffStationboardCopyWithImpl<$Res>;
  $Res call(
      {LocatedStop stop,
      List<StationboardConnection> connections,
      String request,
      int eof});

  $LocatedStopCopyWith<$Res> get stop;
}

class _$CffStationboardCopyWithImpl<$Res>
    implements $CffStationboardCopyWith<$Res> {
  _$CffStationboardCopyWithImpl(this._value, this._then);

  final CffStationboard _value;
  // ignore: unused_field
  final $Res Function(CffStationboard) _then;

  @override
  $Res call({
    Object stop = freezed,
    Object connections = freezed,
    Object request = freezed,
    Object eof = freezed,
  }) {
    return _then(_value.copyWith(
      stop: stop == freezed ? _value.stop : stop as LocatedStop,
      connections: connections == freezed
          ? _value.connections
          : connections as List<StationboardConnection>,
      request: request == freezed ? _value.request : request as String,
      eof: eof == freezed ? _value.eof : eof as int,
    ));
  }

  @override
  $LocatedStopCopyWith<$Res> get stop {
    if (_value.stop == null) {
      return null;
    }
    return $LocatedStopCopyWith<$Res>(_value.stop, (value) {
      return _then(_value.copyWith(stop: value));
    });
  }
}

abstract class _$CffStationboardCopyWith<$Res>
    implements $CffStationboardCopyWith<$Res> {
  factory _$CffStationboardCopyWith(
          _CffStationboard value, $Res Function(_CffStationboard) then) =
      __$CffStationboardCopyWithImpl<$Res>;
  @override
  $Res call(
      {LocatedStop stop,
      List<StationboardConnection> connections,
      String request,
      int eof});

  @override
  $LocatedStopCopyWith<$Res> get stop;
}

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
    Object stop = freezed,
    Object connections = freezed,
    Object request = freezed,
    Object eof = freezed,
  }) {
    return _then(_CffStationboard(
      stop == freezed ? _value.stop : stop as LocatedStop,
      connections == freezed
          ? _value.connections
          : connections as List<StationboardConnection>,
      request == freezed ? _value.request : request as String,
      eof == freezed ? _value.eof : eof as int,
    ));
  }
}

@JsonSerializable()
class _$_CffStationboard implements _CffStationboard {
  _$_CffStationboard(this.stop, this.connections, this.request, this.eof)
      : assert(stop != null),
        assert(connections != null),
        assert(request != null),
        assert(eof != null);

  factory _$_CffStationboard.fromJson(Map<String, dynamic> json) =>
      _$_$_CffStationboardFromJson(json);

  @override
  final LocatedStop stop;
  @override
  final List<StationboardConnection> connections;
  @override
  final String request;
  @override
  final int eof;

  @override
  String toString() {
    return 'CffStationboard(stop: $stop, connections: $connections, request: $request, eof: $eof)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CffStationboard &&
            (identical(other.stop, stop) ||
                const DeepCollectionEquality().equals(other.stop, stop)) &&
            (identical(other.connections, connections) ||
                const DeepCollectionEquality()
                    .equals(other.connections, connections)) &&
            (identical(other.request, request) ||
                const DeepCollectionEquality()
                    .equals(other.request, request)) &&
            (identical(other.eof, eof) ||
                const DeepCollectionEquality().equals(other.eof, eof)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stop) ^
      const DeepCollectionEquality().hash(connections) ^
      const DeepCollectionEquality().hash(request) ^
      const DeepCollectionEquality().hash(eof);

  @override
  _$CffStationboardCopyWith<_CffStationboard> get copyWith =>
      __$CffStationboardCopyWithImpl<_CffStationboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CffStationboardToJson(this);
  }
}

abstract class _CffStationboard implements CffStationboard {
  factory _CffStationboard(
      LocatedStop stop,
      List<StationboardConnection> connections,
      String request,
      int eof) = _$_CffStationboard;

  factory _CffStationboard.fromJson(Map<String, dynamic> json) =
      _$_CffStationboard.fromJson;

  @override
  LocatedStop get stop;
  @override
  List<StationboardConnection> get connections;
  @override
  String get request;
  @override
  int get eof;
  @override
  _$CffStationboardCopyWith<_CffStationboard> get copyWith;
}
