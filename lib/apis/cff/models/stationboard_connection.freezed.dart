// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stationboard_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StationboardConnection _$StationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return _StationboardConnection.fromJson(json);
}

/// @nodoc
class _$StationboardConnectionTearOff {
  const _$StationboardConnectionTearOff();

// ignore: unused_element
  _StationboardConnection call(
      DateTime time,
      Vehicle type,
      String line,
      String color,
      String number,
      Stop terminal,
      String operator,
      {@JsonKey(name: "*G")
          String g,
      @JsonKey(name: "*L")
          String l,
      @JsonKey(name: "subsequent_stops")
          List<SubsequentStop> subsequentStops = const []}) {
    return _StationboardConnection(
      time,
      type,
      line,
      color,
      number,
      terminal,
      operator,
      g: g,
      l: l,
      subsequentStops: subsequentStops,
    );
  }

// ignore: unused_element
  StationboardConnection fromJson(Map<String, Object> json) {
    return StationboardConnection.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $StationboardConnection = _$StationboardConnectionTearOff();

/// @nodoc
mixin _$StationboardConnection {
  DateTime get time;
  Vehicle get type;
  String get line;
  String get color;
  String get number;
  Stop get terminal;
  String get operator;
  @JsonKey(name: "*G")
  String get g;
  @JsonKey(name: "*L")
  String get l;
  @JsonKey(name: "subsequent_stops")
  List<SubsequentStop> get subsequentStops;

  Map<String, dynamic> toJson();
  $StationboardConnectionCopyWith<StationboardConnection> get copyWith;
}

/// @nodoc
abstract class $StationboardConnectionCopyWith<$Res> {
  factory $StationboardConnectionCopyWith(StationboardConnection value,
          $Res Function(StationboardConnection) then) =
      _$StationboardConnectionCopyWithImpl<$Res>;
  $Res call(
      {DateTime time,
      Vehicle type,
      String line,
      String color,
      String number,
      Stop terminal,
      String operator,
      @JsonKey(name: "*G") String g,
      @JsonKey(name: "*L") String l,
      @JsonKey(name: "subsequent_stops") List<SubsequentStop> subsequentStops});

  $StopCopyWith<$Res> get terminal;
}

/// @nodoc
class _$StationboardConnectionCopyWithImpl<$Res>
    implements $StationboardConnectionCopyWith<$Res> {
  _$StationboardConnectionCopyWithImpl(this._value, this._then);

  final StationboardConnection _value;
  // ignore: unused_field
  final $Res Function(StationboardConnection) _then;

  @override
  $Res call({
    Object time = freezed,
    Object type = freezed,
    Object line = freezed,
    Object color = freezed,
    Object number = freezed,
    Object terminal = freezed,
    Object operator = freezed,
    Object g = freezed,
    Object l = freezed,
    Object subsequentStops = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed ? _value.time : time as DateTime,
      type: type == freezed ? _value.type : type as Vehicle,
      line: line == freezed ? _value.line : line as String,
      color: color == freezed ? _value.color : color as String,
      number: number == freezed ? _value.number : number as String,
      terminal: terminal == freezed ? _value.terminal : terminal as Stop,
      operator: operator == freezed ? _value.operator : operator as String,
      g: g == freezed ? _value.g : g as String,
      l: l == freezed ? _value.l : l as String,
      subsequentStops: subsequentStops == freezed
          ? _value.subsequentStops
          : subsequentStops as List<SubsequentStop>,
    ));
  }

  @override
  $StopCopyWith<$Res> get terminal {
    if (_value.terminal == null) {
      return null;
    }
    return $StopCopyWith<$Res>(_value.terminal, (value) {
      return _then(_value.copyWith(terminal: value));
    });
  }
}

/// @nodoc
abstract class _$StationboardConnectionCopyWith<$Res>
    implements $StationboardConnectionCopyWith<$Res> {
  factory _$StationboardConnectionCopyWith(_StationboardConnection value,
          $Res Function(_StationboardConnection) then) =
      __$StationboardConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime time,
      Vehicle type,
      String line,
      String color,
      String number,
      Stop terminal,
      String operator,
      @JsonKey(name: "*G") String g,
      @JsonKey(name: "*L") String l,
      @JsonKey(name: "subsequent_stops") List<SubsequentStop> subsequentStops});

  @override
  $StopCopyWith<$Res> get terminal;
}

/// @nodoc
class __$StationboardConnectionCopyWithImpl<$Res>
    extends _$StationboardConnectionCopyWithImpl<$Res>
    implements _$StationboardConnectionCopyWith<$Res> {
  __$StationboardConnectionCopyWithImpl(_StationboardConnection _value,
      $Res Function(_StationboardConnection) _then)
      : super(_value, (v) => _then(v as _StationboardConnection));

  @override
  _StationboardConnection get _value => super._value as _StationboardConnection;

  @override
  $Res call({
    Object time = freezed,
    Object type = freezed,
    Object line = freezed,
    Object color = freezed,
    Object number = freezed,
    Object terminal = freezed,
    Object operator = freezed,
    Object g = freezed,
    Object l = freezed,
    Object subsequentStops = freezed,
  }) {
    return _then(_StationboardConnection(
      time == freezed ? _value.time : time as DateTime,
      type == freezed ? _value.type : type as Vehicle,
      line == freezed ? _value.line : line as String,
      color == freezed ? _value.color : color as String,
      number == freezed ? _value.number : number as String,
      terminal == freezed ? _value.terminal : terminal as Stop,
      operator == freezed ? _value.operator : operator as String,
      g: g == freezed ? _value.g : g as String,
      l: l == freezed ? _value.l : l as String,
      subsequentStops: subsequentStops == freezed
          ? _value.subsequentStops
          : subsequentStops as List<SubsequentStop>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_StationboardConnection implements _StationboardConnection {
  _$_StationboardConnection(this.time, this.type, this.line, this.color,
      this.number, this.terminal, this.operator,
      {@JsonKey(name: "*G") this.g,
      @JsonKey(name: "*L") this.l,
      @JsonKey(name: "subsequent_stops") this.subsequentStops = const []})
      : assert(time != null),
        assert(type != null),
        assert(line != null),
        assert(color != null),
        assert(number != null),
        assert(terminal != null),
        assert(operator != null),
        assert(subsequentStops != null);

  factory _$_StationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_StationboardConnectionFromJson(json);

  @override
  final DateTime time;
  @override
  final Vehicle type;
  @override
  final String line;
  @override
  final String color;
  @override
  final String number;
  @override
  final Stop terminal;
  @override
  final String operator;
  @override
  @JsonKey(name: "*G")
  final String g;
  @override
  @JsonKey(name: "*L")
  final String l;
  @override
  @JsonKey(name: "subsequent_stops")
  final List<SubsequentStop> subsequentStops;

  @override
  String toString() {
    return 'StationboardConnection(time: $time, type: $type, line: $line, color: $color, number: $number, terminal: $terminal, operator: $operator, g: $g, l: $l, subsequentStops: $subsequentStops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StationboardConnection &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.line, line) ||
                const DeepCollectionEquality().equals(other.line, line)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.terminal, terminal) ||
                const DeepCollectionEquality()
                    .equals(other.terminal, terminal)) &&
            (identical(other.operator, operator) ||
                const DeepCollectionEquality()
                    .equals(other.operator, operator)) &&
            (identical(other.g, g) ||
                const DeepCollectionEquality().equals(other.g, g)) &&
            (identical(other.l, l) ||
                const DeepCollectionEquality().equals(other.l, l)) &&
            (identical(other.subsequentStops, subsequentStops) ||
                const DeepCollectionEquality()
                    .equals(other.subsequentStops, subsequentStops)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(line) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(terminal) ^
      const DeepCollectionEquality().hash(operator) ^
      const DeepCollectionEquality().hash(g) ^
      const DeepCollectionEquality().hash(l) ^
      const DeepCollectionEquality().hash(subsequentStops);

  @override
  _$StationboardConnectionCopyWith<_StationboardConnection> get copyWith =>
      __$StationboardConnectionCopyWithImpl<_StationboardConnection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StationboardConnectionToJson(this);
  }
}

abstract class _StationboardConnection implements StationboardConnection {
  factory _StationboardConnection(
      DateTime time,
      Vehicle type,
      String line,
      String color,
      String number,
      Stop terminal,
      String operator,
      {@JsonKey(name: "*G")
          String g,
      @JsonKey(name: "*L")
          String l,
      @JsonKey(name: "subsequent_stops")
          List<SubsequentStop> subsequentStops}) = _$_StationboardConnection;

  factory _StationboardConnection.fromJson(Map<String, dynamic> json) =
      _$_StationboardConnection.fromJson;

  @override
  DateTime get time;
  @override
  Vehicle get type;
  @override
  String get line;
  @override
  String get color;
  @override
  String get number;
  @override
  Stop get terminal;
  @override
  String get operator;
  @override
  @JsonKey(name: "*G")
  String get g;
  @override
  @JsonKey(name: "*L")
  String get l;
  @override
  @JsonKey(name: "subsequent_stops")
  List<SubsequentStop> get subsequentStops;
  @override
  _$StationboardConnectionCopyWith<_StationboardConnection> get copyWith;
}