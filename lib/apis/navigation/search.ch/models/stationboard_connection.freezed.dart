// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stationboard_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
SbbStationboardConnection _$SbbStationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return _SbbStationboardConnection.fromJson(json);
}

/// @nodoc
class _$SbbStationboardConnectionTearOff {
  const _$SbbStationboardConnectionTearOff();

  _SbbStationboardConnection call(
      {required DateTime time,
      required Vehicle type,
      required String color,
      required SbbStop terminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator_,
      String number = '',
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
          List<SubsequentStop> subsequentStops = const <SubsequentStop>[],
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay = 0,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay = 0}) {
    return _SbbStationboardConnection(
      time: time,
      type: type,
      color: color,
      terminal: terminal,
      line: line,
      operator_: operator_,
      number: number,
      g: g,
      l: l,
      subsequentStops: subsequentStops,
      depDelay: depDelay,
      arrDelay: arrDelay,
    );
  }

  SbbStationboardConnection fromJson(Map<String, Object> json) {
    return SbbStationboardConnection.fromJson(json);
  }
}

/// @nodoc
const $SbbStationboardConnection = _$SbbStationboardConnectionTearOff();

/// @nodoc
mixin _$SbbStationboardConnection {
  DateTime get time => throw _privateConstructorUsedError;
  Vehicle get type => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  SbbStop get terminal => throw _privateConstructorUsedError;
  String? get line => throw _privateConstructorUsedError;
  @JsonKey(name: 'operator')
  String? get operator_ => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: '*G')
  String? get g => throw _privateConstructorUsedError;
  @JsonKey(name: '*L')
  String? get l => throw _privateConstructorUsedError;
  @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
  List<SubsequentStop> get subsequentStops =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbStationboardConnectionCopyWith<SbbStationboardConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbStationboardConnectionCopyWith<$Res> {
  factory $SbbStationboardConnectionCopyWith(SbbStationboardConnection value,
          $Res Function(SbbStationboardConnection) then) =
      _$SbbStationboardConnectionCopyWithImpl<$Res>;
  $Res call(
      {DateTime time,
      Vehicle type,
      String color,
      SbbStop terminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator_,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});

  $SbbStopCopyWith<$Res> get terminal;
}

/// @nodoc
class _$SbbStationboardConnectionCopyWithImpl<$Res>
    implements $SbbStationboardConnectionCopyWith<$Res> {
  _$SbbStationboardConnectionCopyWithImpl(this._value, this._then);

  final SbbStationboardConnection _value;
  // ignore: unused_field
  final $Res Function(SbbStationboardConnection) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? type = freezed,
    Object? color = freezed,
    Object? terminal = freezed,
    Object? line = freezed,
    Object? operator_ = freezed,
    Object? number = freezed,
    Object? g = freezed,
    Object? l = freezed,
    Object? subsequentStops = freezed,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed ? _value.time : time as DateTime,
      type: type == freezed ? _value.type : type as Vehicle,
      color: color == freezed ? _value.color : color as String,
      terminal: terminal == freezed ? _value.terminal : terminal as SbbStop,
      line: line == freezed ? _value.line : line as String?,
      operator_: operator_ == freezed ? _value.operator_ : operator_ as String?,
      number: number == freezed ? _value.number : number as String,
      g: g == freezed ? _value.g : g as String?,
      l: l == freezed ? _value.l : l as String?,
      subsequentStops: subsequentStops == freezed
          ? _value.subsequentStops
          : subsequentStops as List<SubsequentStop>,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
      arrDelay: arrDelay == freezed ? _value.arrDelay : arrDelay as int,
    ));
  }

  @override
  $SbbStopCopyWith<$Res> get terminal {
    return $SbbStopCopyWith<$Res>(_value.terminal, (value) {
      return _then(_value.copyWith(terminal: value));
    });
  }
}

/// @nodoc
abstract class _$SbbStationboardConnectionCopyWith<$Res>
    implements $SbbStationboardConnectionCopyWith<$Res> {
  factory _$SbbStationboardConnectionCopyWith(_SbbStationboardConnection value,
          $Res Function(_SbbStationboardConnection) then) =
      __$SbbStationboardConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime time,
      Vehicle type,
      String color,
      SbbStop terminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator_,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay});

  @override
  $SbbStopCopyWith<$Res> get terminal;
}

/// @nodoc
class __$SbbStationboardConnectionCopyWithImpl<$Res>
    extends _$SbbStationboardConnectionCopyWithImpl<$Res>
    implements _$SbbStationboardConnectionCopyWith<$Res> {
  __$SbbStationboardConnectionCopyWithImpl(_SbbStationboardConnection _value,
      $Res Function(_SbbStationboardConnection) _then)
      : super(_value, (v) => _then(v as _SbbStationboardConnection));

  @override
  _SbbStationboardConnection get _value =>
      super._value as _SbbStationboardConnection;

  @override
  $Res call({
    Object? time = freezed,
    Object? type = freezed,
    Object? color = freezed,
    Object? terminal = freezed,
    Object? line = freezed,
    Object? operator_ = freezed,
    Object? number = freezed,
    Object? g = freezed,
    Object? l = freezed,
    Object? subsequentStops = freezed,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
  }) {
    return _then(_SbbStationboardConnection(
      time: time == freezed ? _value.time : time as DateTime,
      type: type == freezed ? _value.type : type as Vehicle,
      color: color == freezed ? _value.color : color as String,
      terminal: terminal == freezed ? _value.terminal : terminal as SbbStop,
      line: line == freezed ? _value.line : line as String?,
      operator_: operator_ == freezed ? _value.operator_ : operator_ as String?,
      number: number == freezed ? _value.number : number as String,
      g: g == freezed ? _value.g : g as String?,
      l: l == freezed ? _value.l : l as String?,
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
class _$_SbbStationboardConnection implements _SbbStationboardConnection {
  const _$_SbbStationboardConnection(
      {required this.time,
      required this.type,
      required this.color,
      required this.terminal,
      this.line,
      @JsonKey(name: 'operator')
          this.operator_,
      this.number = '',
      @JsonKey(name: '*G')
          this.g,
      @JsonKey(name: '*L')
          this.l,
      @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
          this.subsequentStops = const <SubsequentStop>[],
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.depDelay = 0,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          this.arrDelay = 0});

  factory _$_SbbStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbStationboardConnectionFromJson(json);

  @override
  final DateTime time;
  @override
  final Vehicle type;
  @override
  final String color;
  @override
  final SbbStop terminal;
  @override
  final String? line;
  @override
  @JsonKey(name: 'operator')
  final String? operator_;
  @JsonKey(defaultValue: '')
  @override
  final String number;
  @override
  @JsonKey(name: '*G')
  final String? g;
  @override
  @JsonKey(name: '*L')
  final String? l;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
  final List<SubsequentStop> subsequentStops;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int depDelay;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int arrDelay;

  @override
  String toString() {
    return 'SbbStationboardConnection(time: $time, type: $type, color: $color, terminal: $terminal, line: $line, operator_: $operator_, number: $number, g: $g, l: $l, subsequentStops: $subsequentStops, depDelay: $depDelay, arrDelay: $arrDelay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbStationboardConnection &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.terminal, terminal) ||
                const DeepCollectionEquality()
                    .equals(other.terminal, terminal)) &&
            (identical(other.line, line) ||
                const DeepCollectionEquality().equals(other.line, line)) &&
            (identical(other.operator_, operator_) ||
                const DeepCollectionEquality()
                    .equals(other.operator_, operator_)) &&
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
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(terminal) ^
      const DeepCollectionEquality().hash(line) ^
      const DeepCollectionEquality().hash(operator_) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(g) ^
      const DeepCollectionEquality().hash(l) ^
      const DeepCollectionEquality().hash(subsequentStops) ^
      const DeepCollectionEquality().hash(depDelay) ^
      const DeepCollectionEquality().hash(arrDelay);

  @JsonKey(ignore: true)
  @override
  _$SbbStationboardConnectionCopyWith<_SbbStationboardConnection>
      get copyWith =>
          __$SbbStationboardConnectionCopyWithImpl<_SbbStationboardConnection>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbStationboardConnectionToJson(this);
  }
}

abstract class _SbbStationboardConnection implements SbbStationboardConnection {
  const factory _SbbStationboardConnection(
      {required DateTime time,
      required Vehicle type,
      required String color,
      required SbbStop terminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator_,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
          List<SubsequentStop> subsequentStops,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay,
      @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
          int arrDelay}) = _$_SbbStationboardConnection;

  factory _SbbStationboardConnection.fromJson(Map<String, dynamic> json) =
      _$_SbbStationboardConnection.fromJson;

  @override
  DateTime get time => throw _privateConstructorUsedError;
  @override
  Vehicle get type => throw _privateConstructorUsedError;
  @override
  String get color => throw _privateConstructorUsedError;
  @override
  SbbStop get terminal => throw _privateConstructorUsedError;
  @override
  String? get line => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'operator')
  String? get operator_ => throw _privateConstructorUsedError;
  @override
  String get number => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '*G')
  String? get g => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '*L')
  String? get l => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: const <SubsequentStop>[])
  List<SubsequentStop> get subsequentStops =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get arrDelay => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbStationboardConnectionCopyWith<_SbbStationboardConnection>
      get copyWith => throw _privateConstructorUsedError;
}
