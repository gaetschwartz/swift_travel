// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stationboard_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbStationboardConnection _$SbbStationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return _SbbStationboardConnection.fromJson(json);
}

/// @nodoc
mixin _$SbbStationboardConnection {
  DateTime get time => throw _privateConstructorUsedError;
  PlaceType get type => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'terminal')
  SbbStop get sbbTerminal => throw _privateConstructorUsedError;
  String? get line => throw _privateConstructorUsedError;
  @JsonKey(name: 'operator')
  String? get operator => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: '*G')
  String? get g => throw _privateConstructorUsedError;
  @JsonKey(name: '*L')
  String? get l => throw _privateConstructorUsedError;
  @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
  List<SbbSubsequentStop> get sbbSubsequentStops =>
      throw _privateConstructorUsedError;
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay => throw _privateConstructorUsedError;
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  int? get arrDelay => throw _privateConstructorUsedError;
  String? get track => throw _privateConstructorUsedError;

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
      PlaceType type,
      String color,
      @JsonKey(name: 'terminal')
          SbbStop sbbTerminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
          List<SbbSubsequentStop> sbbSubsequentStops,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          int? depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          int? arrDelay,
      String? track});

  $SbbStopCopyWith<$Res> get sbbTerminal;
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
    Object? sbbTerminal = freezed,
    Object? line = freezed,
    Object? operator = freezed,
    Object? number = freezed,
    Object? g = freezed,
    Object? l = freezed,
    Object? sbbSubsequentStops = freezed,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
    Object? track = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      sbbTerminal: sbbTerminal == freezed
          ? _value.sbbTerminal
          : sbbTerminal // ignore: cast_nullable_to_non_nullable
              as SbbStop,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: operator == freezed
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      g: g == freezed
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as String?,
      l: l == freezed
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbSubsequentStops: sbbSubsequentStops == freezed
          ? _value.sbbSubsequentStops
          : sbbSubsequentStops // ignore: cast_nullable_to_non_nullable
              as List<SbbSubsequentStop>,
      depDelay: depDelay == freezed
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      arrDelay: arrDelay == freezed
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SbbStopCopyWith<$Res> get sbbTerminal {
    return $SbbStopCopyWith<$Res>(_value.sbbTerminal, (value) {
      return _then(_value.copyWith(sbbTerminal: value));
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
      PlaceType type,
      String color,
      @JsonKey(name: 'terminal')
          SbbStop sbbTerminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
          List<SbbSubsequentStop> sbbSubsequentStops,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          int? depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          int? arrDelay,
      String? track});

  @override
  $SbbStopCopyWith<$Res> get sbbTerminal;
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
    Object? sbbTerminal = freezed,
    Object? line = freezed,
    Object? operator = freezed,
    Object? number = freezed,
    Object? g = freezed,
    Object? l = freezed,
    Object? sbbSubsequentStops = freezed,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
    Object? track = freezed,
  }) {
    return _then(_SbbStationboardConnection(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      sbbTerminal: sbbTerminal == freezed
          ? _value.sbbTerminal
          : sbbTerminal // ignore: cast_nullable_to_non_nullable
              as SbbStop,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: operator == freezed
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      g: g == freezed
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as String?,
      l: l == freezed
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbSubsequentStops: sbbSubsequentStops == freezed
          ? _value.sbbSubsequentStops
          : sbbSubsequentStops // ignore: cast_nullable_to_non_nullable
              as List<SbbSubsequentStop>,
      depDelay: depDelay == freezed
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      arrDelay: arrDelay == freezed
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, checked: true)
class _$_SbbStationboardConnection extends _SbbStationboardConnection {
  _$_SbbStationboardConnection(
      {required this.time,
      required this.type,
      required this.color,
      @JsonKey(name: 'terminal')
          required this.sbbTerminal,
      this.line,
      @JsonKey(name: 'operator')
          this.operator,
      this.number = '',
      @JsonKey(name: '*G')
          this.g,
      @JsonKey(name: '*L')
          this.l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
          final List<SbbSubsequentStop>
              sbbSubsequentStops = const <SbbSubsequentStop>[],
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          this.depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          this.arrDelay,
      this.track})
      : _sbbSubsequentStops = sbbSubsequentStops,
        super._();

  factory _$_SbbStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$$_SbbStationboardConnectionFromJson(json);

  @override
  final DateTime time;
  @override
  final PlaceType type;
  @override
  final String color;
  @override
  @JsonKey(name: 'terminal')
  final SbbStop sbbTerminal;
  @override
  final String? line;
  @override
  @JsonKey(name: 'operator')
  final String? operator;
  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey(name: '*G')
  final String? g;
  @override
  @JsonKey(name: '*L')
  final String? l;
  @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
  final List<SbbSubsequentStop> _sbbSubsequentStops;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
  List<SbbSubsequentStop> get sbbSubsequentStops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sbbSubsequentStops);
  }

  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  final int? depDelay;
  @override
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  final int? arrDelay;
  @override
  final String? track;

  @override
  String toString() {
    return 'SbbStationboardConnection(time: $time, type: $type, color: $color, sbbTerminal: $sbbTerminal, line: $line, operator: $operator, number: $number, g: $g, l: $l, sbbSubsequentStops: $sbbSubsequentStops, depDelay: $depDelay, arrDelay: $arrDelay, track: $track)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SbbStationboardConnection &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.sbbTerminal, sbbTerminal) &&
            const DeepCollectionEquality().equals(other.line, line) &&
            const DeepCollectionEquality().equals(other.operator, operator) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.g, g) &&
            const DeepCollectionEquality().equals(other.l, l) &&
            const DeepCollectionEquality()
                .equals(other.sbbSubsequentStops, sbbSubsequentStops) &&
            const DeepCollectionEquality().equals(other.depDelay, depDelay) &&
            const DeepCollectionEquality().equals(other.arrDelay, arrDelay) &&
            const DeepCollectionEquality().equals(other.track, track));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(sbbTerminal),
      const DeepCollectionEquality().hash(line),
      const DeepCollectionEquality().hash(operator),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(g),
      const DeepCollectionEquality().hash(l),
      const DeepCollectionEquality().hash(sbbSubsequentStops),
      const DeepCollectionEquality().hash(depDelay),
      const DeepCollectionEquality().hash(arrDelay),
      const DeepCollectionEquality().hash(track));

  @JsonKey(ignore: true)
  @override
  _$SbbStationboardConnectionCopyWith<_SbbStationboardConnection>
      get copyWith =>
          __$SbbStationboardConnectionCopyWithImpl<_SbbStationboardConnection>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbStationboardConnectionToJson(this);
  }
}

abstract class _SbbStationboardConnection extends SbbStationboardConnection {
  factory _SbbStationboardConnection(
      {required final DateTime time,
      required final PlaceType type,
      required final String color,
      @JsonKey(name: 'terminal')
          required final SbbStop sbbTerminal,
      final String? line,
      @JsonKey(name: 'operator')
          final String? operator,
      final String number,
      @JsonKey(name: '*G')
          final String? g,
      @JsonKey(name: '*L')
          final String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
          final List<SbbSubsequentStop> sbbSubsequentStops,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          final int? depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          final int? arrDelay,
      final String? track}) = _$_SbbStationboardConnection;
  _SbbStationboardConnection._() : super._();

  factory _SbbStationboardConnection.fromJson(Map<String, dynamic> json) =
      _$_SbbStationboardConnection.fromJson;

  @override
  DateTime get time => throw _privateConstructorUsedError;
  @override
  PlaceType get type => throw _privateConstructorUsedError;
  @override
  String get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'terminal')
  SbbStop get sbbTerminal => throw _privateConstructorUsedError;
  @override
  String? get line => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'operator')
  String? get operator => throw _privateConstructorUsedError;
  @override
  String get number => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '*G')
  String? get g => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: '*L')
  String? get l => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
  List<SbbSubsequentStop> get sbbSubsequentStops =>
      throw _privateConstructorUsedError;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay => throw _privateConstructorUsedError;
  @override
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  int? get arrDelay => throw _privateConstructorUsedError;
  @override
  String? get track => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbStationboardConnectionCopyWith<_SbbStationboardConnection>
      get copyWith => throw _privateConstructorUsedError;
}
