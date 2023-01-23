// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stationboard_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchStationboardConnection _$SchStationboardConnectionFromJson(
    Map<String, dynamic> json) {
  return _SchStationboardConnection.fromJson(json);
}

/// @nodoc
mixin _$SchStationboardConnection {
  DateTime get time => throw _privateConstructorUsedError;
  VehicleType get type => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'terminal')
  SchStop get sbbTerminal => throw _privateConstructorUsedError;
  String? get line => throw _privateConstructorUsedError;
  @JsonKey(name: 'operator')
  String? get operator => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: '*G')
  String? get g => throw _privateConstructorUsedError;
  @JsonKey(name: '*L')
  String? get l => throw _privateConstructorUsedError;
  @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
  List<SchSubsequentStop> get sbbSubsequentStops =>
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
  $SchStationboardConnectionCopyWith<SchStationboardConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchStationboardConnectionCopyWith<$Res> {
  factory $SchStationboardConnectionCopyWith(SchStationboardConnection value,
          $Res Function(SchStationboardConnection) then) =
      _$SchStationboardConnectionCopyWithImpl<$Res, SchStationboardConnection>;
  @useResult
  $Res call(
      {DateTime time,
      VehicleType type,
      String color,
      @JsonKey(name: 'terminal')
          SchStop sbbTerminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
          List<SchSubsequentStop> sbbSubsequentStops,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          int? depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          int? arrDelay,
      String? track});

  $SchStopCopyWith<$Res> get sbbTerminal;
}

/// @nodoc
class _$SchStationboardConnectionCopyWithImpl<$Res,
        $Val extends SchStationboardConnection>
    implements $SchStationboardConnectionCopyWith<$Res> {
  _$SchStationboardConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? type = null,
    Object? color = null,
    Object? sbbTerminal = null,
    Object? line = freezed,
    Object? operator = freezed,
    Object? number = null,
    Object? g = freezed,
    Object? l = freezed,
    Object? sbbSubsequentStops = null,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
    Object? track = freezed,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VehicleType,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      sbbTerminal: null == sbbTerminal
          ? _value.sbbTerminal
          : sbbTerminal // ignore: cast_nullable_to_non_nullable
              as SchStop,
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: freezed == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String?,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      g: freezed == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as String?,
      l: freezed == l
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbSubsequentStops: null == sbbSubsequentStops
          ? _value.sbbSubsequentStops
          : sbbSubsequentStops // ignore: cast_nullable_to_non_nullable
              as List<SchSubsequentStop>,
      depDelay: freezed == depDelay
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      arrDelay: freezed == arrDelay
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchStopCopyWith<$Res> get sbbTerminal {
    return $SchStopCopyWith<$Res>(_value.sbbTerminal, (value) {
      return _then(_value.copyWith(sbbTerminal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SchStationboardConnectionCopyWith<$Res>
    implements $SchStationboardConnectionCopyWith<$Res> {
  factory _$$_SchStationboardConnectionCopyWith(
          _$_SchStationboardConnection value,
          $Res Function(_$_SchStationboardConnection) then) =
      __$$_SchStationboardConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime time,
      VehicleType type,
      String color,
      @JsonKey(name: 'terminal')
          SchStop sbbTerminal,
      String? line,
      @JsonKey(name: 'operator')
          String? operator,
      String number,
      @JsonKey(name: '*G')
          String? g,
      @JsonKey(name: '*L')
          String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
          List<SchSubsequentStop> sbbSubsequentStops,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          int? depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          int? arrDelay,
      String? track});

  @override
  $SchStopCopyWith<$Res> get sbbTerminal;
}

/// @nodoc
class __$$_SchStationboardConnectionCopyWithImpl<$Res>
    extends _$SchStationboardConnectionCopyWithImpl<$Res,
        _$_SchStationboardConnection>
    implements _$$_SchStationboardConnectionCopyWith<$Res> {
  __$$_SchStationboardConnectionCopyWithImpl(
      _$_SchStationboardConnection _value,
      $Res Function(_$_SchStationboardConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? type = null,
    Object? color = null,
    Object? sbbTerminal = null,
    Object? line = freezed,
    Object? operator = freezed,
    Object? number = null,
    Object? g = freezed,
    Object? l = freezed,
    Object? sbbSubsequentStops = null,
    Object? depDelay = freezed,
    Object? arrDelay = freezed,
    Object? track = freezed,
  }) {
    return _then(_$_SchStationboardConnection(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VehicleType,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      sbbTerminal: null == sbbTerminal
          ? _value.sbbTerminal
          : sbbTerminal // ignore: cast_nullable_to_non_nullable
              as SchStop,
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: freezed == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String?,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      g: freezed == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as String?,
      l: freezed == l
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbSubsequentStops: null == sbbSubsequentStops
          ? _value._sbbSubsequentStops
          : sbbSubsequentStops // ignore: cast_nullable_to_non_nullable
              as List<SchSubsequentStop>,
      depDelay: freezed == depDelay
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      arrDelay: freezed == arrDelay
          ? _value.arrDelay
          : arrDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, checked: true)
class _$_SchStationboardConnection extends _SchStationboardConnection {
  _$_SchStationboardConnection(
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
      @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
          final List<SchSubsequentStop>
              sbbSubsequentStops = const <SchSubsequentStop>[],
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          this.depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          this.arrDelay,
      this.track})
      : _sbbSubsequentStops = sbbSubsequentStops,
        super._();

  factory _$_SchStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$$_SchStationboardConnectionFromJson(json);

  @override
  final DateTime time;
  @override
  final VehicleType type;
  @override
  final String color;
  @override
  @JsonKey(name: 'terminal')
  final SchStop sbbTerminal;
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
  final List<SchSubsequentStop> _sbbSubsequentStops;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
  List<SchSubsequentStop> get sbbSubsequentStops {
    if (_sbbSubsequentStops is EqualUnmodifiableListView)
      return _sbbSubsequentStops;
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
    return 'SchStationboardConnection(time: $time, type: $type, color: $color, sbbTerminal: $sbbTerminal, line: $line, operator: $operator, number: $number, g: $g, l: $l, sbbSubsequentStops: $sbbSubsequentStops, depDelay: $depDelay, arrDelay: $arrDelay, track: $track)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchStationboardConnection &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.sbbTerminal, sbbTerminal) ||
                other.sbbTerminal == sbbTerminal) &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.l, l) || other.l == l) &&
            const DeepCollectionEquality()
                .equals(other._sbbSubsequentStops, _sbbSubsequentStops) &&
            (identical(other.depDelay, depDelay) ||
                other.depDelay == depDelay) &&
            (identical(other.arrDelay, arrDelay) ||
                other.arrDelay == arrDelay) &&
            (identical(other.track, track) || other.track == track));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      type,
      color,
      sbbTerminal,
      line,
      operator,
      number,
      g,
      l,
      const DeepCollectionEquality().hash(_sbbSubsequentStops),
      depDelay,
      arrDelay,
      track);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchStationboardConnectionCopyWith<_$_SchStationboardConnection>
      get copyWith => __$$_SchStationboardConnectionCopyWithImpl<
          _$_SchStationboardConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchStationboardConnectionToJson(
      this,
    );
  }
}

abstract class _SchStationboardConnection extends SchStationboardConnection {
  factory _SchStationboardConnection(
      {required final DateTime time,
      required final VehicleType type,
      required final String color,
      @JsonKey(name: 'terminal')
          required final SchStop sbbTerminal,
      final String? line,
      @JsonKey(name: 'operator')
          final String? operator,
      final String number,
      @JsonKey(name: '*G')
          final String? g,
      @JsonKey(name: '*L')
          final String? l,
      @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
          final List<SchSubsequentStop> sbbSubsequentStops,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          final int? depDelay,
      @DelayConverter()
      @JsonKey(name: 'arr_delay')
          final int? arrDelay,
      final String? track}) = _$_SchStationboardConnection;
  _SchStationboardConnection._() : super._();

  factory _SchStationboardConnection.fromJson(Map<String, dynamic> json) =
      _$_SchStationboardConnection.fromJson;

  @override
  DateTime get time;
  @override
  VehicleType get type;
  @override
  String get color;
  @override
  @JsonKey(name: 'terminal')
  SchStop get sbbTerminal;
  @override
  String? get line;
  @override
  @JsonKey(name: 'operator')
  String? get operator;
  @override
  String get number;
  @override
  @JsonKey(name: '*G')
  String? get g;
  @override
  @JsonKey(name: '*L')
  String? get l;
  @override
  @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
  List<SchSubsequentStop> get sbbSubsequentStops;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay;
  @override
  @DelayConverter()
  @JsonKey(name: 'arr_delay')
  int? get arrDelay;
  @override
  String? get track;
  @override
  @JsonKey(ignore: true)
  _$$_SchStationboardConnectionCopyWith<_$_SchStationboardConnection>
      get copyWith => throw _privateConstructorUsedError;
}
