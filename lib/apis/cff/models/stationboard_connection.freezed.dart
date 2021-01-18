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
      Stop terminal,
      String operator,
      {String number = '',
      @JsonKey(name: '*G')
          String g,
      @JsonKey(name: '*L')
          String l,
      @JsonKey(name: 'subsequent_stops', defaultValue: [])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay}) {
    return _StationboardConnection(
      time,
      type,
      line,
      color,
      terminal,
      operator,
      number: number,
      g: g,
      l: l,
      subsequentStops: subsequentStops,
      depDelay: depDelay,
      arrDelay: arrDelay,
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
  Stop get terminal;
  String get operator;
  String get number;
  @JsonKey(name: '*G')
  String get g;
  @JsonKey(name: '*L')
  String get l;
  @JsonKey(name: 'subsequent_stops', defaultValue: [])
  List<SubsequentStop> get subsequentStops;
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay;
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
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
      Stop terminal,
      String operator,
      String number,
      @JsonKey(name: '*G')
          String g,
      @JsonKey(name: '*L')
          String l,
      @JsonKey(name: 'subsequent_stops', defaultValue: [])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});

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
    Object terminal = freezed,
    Object operator = freezed,
    Object number = freezed,
    Object g = freezed,
    Object l = freezed,
    Object subsequentStops = freezed,
    Object depDelay = freezed,
    Object arrDelay = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed ? _value.time : time as DateTime,
      type: type == freezed ? _value.type : type as Vehicle,
      line: line == freezed ? _value.line : line as String,
      color: color == freezed ? _value.color : color as String,
      terminal: terminal == freezed ? _value.terminal : terminal as Stop,
      operator: operator == freezed ? _value.operator : operator as String,
      number: number == freezed ? _value.number : number as String,
      g: g == freezed ? _value.g : g as String,
      l: l == freezed ? _value.l : l as String,
      subsequentStops: subsequentStops == freezed
          ? _value.subsequentStops
          : subsequentStops as List<SubsequentStop>,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
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
      Stop terminal,
      String operator,
      String number,
      @JsonKey(name: '*G')
          String g,
      @JsonKey(name: '*L')
          String l,
      @JsonKey(name: 'subsequent_stops', defaultValue: [])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});

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
    Object terminal = freezed,
    Object operator = freezed,
    Object number = freezed,
    Object g = freezed,
    Object l = freezed,
    Object subsequentStops = freezed,
    Object depDelay = freezed,
    Object arrDelay = freezed,
  }) {
    return _then(_StationboardConnection(
      time == freezed ? _value.time : time as DateTime,
      type == freezed ? _value.type : type as Vehicle,
      line == freezed ? _value.line : line as String,
      color == freezed ? _value.color : color as String,
      terminal == freezed ? _value.terminal : terminal as Stop,
      operator == freezed ? _value.operator : operator as String,
      number: number == freezed ? _value.number : number as String,
      g: g == freezed ? _value.g : g as String,
      l: l == freezed ? _value.l : l as String,
      subsequentStops: subsequentStops == freezed
          ? _value.subsequentStops
          : subsequentStops as List<SubsequentStop>,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_StationboardConnection implements _StationboardConnection {
  _$_StationboardConnection(
      this.time,
      this.type,
      this.line,
      this.color,
      this.terminal,
      this.operator,
      {this.number = '',
      @JsonKey(name: '*G')
          this.g,
      @JsonKey(name: '*L')
          this.l,
      @JsonKey(name: 'subsequent_stops', defaultValue: [])
          this.subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.arrDelay})
      : assert(time != null),
        assert(type != null),
        assert(line != null),
        assert(color != null),
        assert(terminal != null),
        assert(operator != null),
        assert(number != null);

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
  final Stop terminal;
  @override
  final String operator;
  @JsonKey(defaultValue: '')
  @override
  final String number;
  @override
  @JsonKey(name: '*G')
  final String g;
  @override
  @JsonKey(name: '*L')
  final String l;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: [])
  final List<SubsequentStop> subsequentStops;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int depDelay;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int arrDelay;

  @override
  String toString() {
    return 'StationboardConnection(time: $time, type: $type, line: $line, color: $color, terminal: $terminal, operator: $operator, number: $number, g: $g, l: $l, subsequentStops: $subsequentStops, depDelay: $depDelay, arrDelay: $arrDelay)';
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
            (identical(other.terminal, terminal) ||
                const DeepCollectionEquality()
                    .equals(other.terminal, terminal)) &&
            (identical(other.operator, operator) ||
                const DeepCollectionEquality()
                    .equals(other.operator, operator)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.g, g) ||
                const DeepCollectionEquality().equals(other.g, g)) &&
            (identical(other.l, l) ||
                const DeepCollectionEquality().equals(other.l, l)) &&
            (identical(other.subsequentStops, subsequentStops) ||
                const DeepCollectionEquality()
                    .equals(other.subsequentStops, subsequentStops)) &&
            (identical(other.depDelay, depDelay) ||
                const DeepCollectionEquality()
                    .equals(other.depDelay, depDelay)) &&
            (identical(other.arrDelay, arrDelay) ||
                const DeepCollectionEquality()
                    .equals(other.arrDelay, arrDelay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(line) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(terminal) ^
      const DeepCollectionEquality().hash(operator) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(g) ^
      const DeepCollectionEquality().hash(l) ^
      const DeepCollectionEquality().hash(subsequentStops) ^
      const DeepCollectionEquality().hash(depDelay) ^
      const DeepCollectionEquality().hash(arrDelay);

  @JsonKey(ignore: true)
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
      Stop terminal,
      String operator,
      {String number,
      @JsonKey(name: '*G')
          String g,
      @JsonKey(name: '*L')
          String l,
      @JsonKey(name: 'subsequent_stops', defaultValue: [])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay}) = _$_StationboardConnection;

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
  Stop get terminal;
  @override
  String get operator;
  @override
  String get number;
  @override
  @JsonKey(name: '*G')
  String get g;
  @override
  @JsonKey(name: '*L')
  String get l;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: [])
  List<SubsequentStop> get subsequentStops;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay;
  @override
  @JsonKey(ignore: true)
  _$StationboardConnectionCopyWith<_StationboardConnection> get copyWith;
}
