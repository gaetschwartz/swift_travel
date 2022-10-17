// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'leg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbLeg _$SbbLegFromJson(Map<String, dynamic> json) {
  return _SbbLeg.fromJson(json);
}

/// @nodoc
mixin _$SbbLeg {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'exit')
  SbbExit? get sbbExit => throw _privateConstructorUsedError;
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay => throw _privateConstructorUsedError;
  PlaceType? get type => throw _privateConstructorUsedError;
  String? get track => throw _privateConstructorUsedError;
  String? get terminal => throw _privateConstructorUsedError;
  String? get bgcolor => throw _privateConstructorUsedError;
  String? get fgcolor => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get tripid => throw _privateConstructorUsedError;
  String? get stopid => throw _privateConstructorUsedError;
  @JsonKey(name: 'runningtime')
  double? get runningTime => throw _privateConstructorUsedError;
  String? get line => throw _privateConstructorUsedError;
  @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
  List<SbbStop> get sbbStops => throw _privateConstructorUsedError;
  String? get sbbName => throw _privateConstructorUsedError;
  DateTime? get departure => throw _privateConstructorUsedError;
  DateTime? get arrival => throw _privateConstructorUsedError;
  @JsonKey(name: 'normal_time')
  double? get normalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'waittime', defaultValue: 0)
  double get waitTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'isaddress')
  bool get isAddress => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  @IntConverter()
  int? get x => throw _privateConstructorUsedError;
  @IntConverter()
  int? get y => throw _privateConstructorUsedError;
  Map<String, String> get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbLegCopyWith<SbbLeg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbLegCopyWith<$Res> {
  factory $SbbLegCopyWith(SbbLeg value, $Res Function(SbbLeg) then) =
      _$SbbLegCopyWithImpl<$Res, SbbLeg>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'exit') SbbExit? sbbExit,
      @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
      PlaceType? type,
      String? track,
      String? terminal,
      String? bgcolor,
      String? fgcolor,
      String? number,
      String? tripid,
      String? stopid,
      @JsonKey(name: 'runningtime') double? runningTime,
      String? line,
      @JsonKey(name: 'stops', defaultValue: <SbbStop>[]) List<SbbStop> sbbStops,
      String? sbbName,
      DateTime? departure,
      DateTime? arrival,
      @JsonKey(name: 'normal_time') double? normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0) double waitTime,
      @JsonKey(name: 'isaddress') bool isAddress,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y,
      Map<String, String> attributes});

  $SbbExitCopyWith<$Res>? get sbbExit;
}

/// @nodoc
class _$SbbLegCopyWithImpl<$Res, $Val extends SbbLeg>
    implements $SbbLegCopyWith<$Res> {
  _$SbbLegCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sbbExit = freezed,
    Object? depDelay = freezed,
    Object? type = freezed,
    Object? track = freezed,
    Object? terminal = freezed,
    Object? bgcolor = freezed,
    Object? fgcolor = freezed,
    Object? number = freezed,
    Object? tripid = freezed,
    Object? stopid = freezed,
    Object? runningTime = freezed,
    Object? line = freezed,
    Object? sbbStops = null,
    Object? sbbName = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? normalTime = freezed,
    Object? waitTime = null,
    Object? isAddress = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sbbExit: freezed == sbbExit
          ? _value.sbbExit
          : sbbExit // ignore: cast_nullable_to_non_nullable
              as SbbExit?,
      depDelay: freezed == depDelay
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      terminal: freezed == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String?,
      bgcolor: freezed == bgcolor
          ? _value.bgcolor
          : bgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      fgcolor: freezed == fgcolor
          ? _value.fgcolor
          : fgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      tripid: freezed == tripid
          ? _value.tripid
          : tripid // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: freezed == stopid
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      runningTime: freezed == runningTime
          ? _value.runningTime
          : runningTime // ignore: cast_nullable_to_non_nullable
              as double?,
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbStops: null == sbbStops
          ? _value.sbbStops
          : sbbStops // ignore: cast_nullable_to_non_nullable
              as List<SbbStop>,
      sbbName: freezed == sbbName
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      normalTime: freezed == normalTime
          ? _value.normalTime
          : normalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      waitTime: null == waitTime
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as double,
      isAddress: null == isAddress
          ? _value.isAddress
          : isAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SbbExitCopyWith<$Res>? get sbbExit {
    if (_value.sbbExit == null) {
      return null;
    }

    return $SbbExitCopyWith<$Res>(_value.sbbExit!, (value) {
      return _then(_value.copyWith(sbbExit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SbbLegCopyWith<$Res> implements $SbbLegCopyWith<$Res> {
  factory _$$_SbbLegCopyWith(_$_SbbLeg value, $Res Function(_$_SbbLeg) then) =
      __$$_SbbLegCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'exit') SbbExit? sbbExit,
      @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
      PlaceType? type,
      String? track,
      String? terminal,
      String? bgcolor,
      String? fgcolor,
      String? number,
      String? tripid,
      String? stopid,
      @JsonKey(name: 'runningtime') double? runningTime,
      String? line,
      @JsonKey(name: 'stops', defaultValue: <SbbStop>[]) List<SbbStop> sbbStops,
      String? sbbName,
      DateTime? departure,
      DateTime? arrival,
      @JsonKey(name: 'normal_time') double? normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0) double waitTime,
      @JsonKey(name: 'isaddress') bool isAddress,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y,
      Map<String, String> attributes});

  @override
  $SbbExitCopyWith<$Res>? get sbbExit;
}

/// @nodoc
class __$$_SbbLegCopyWithImpl<$Res>
    extends _$SbbLegCopyWithImpl<$Res, _$_SbbLeg>
    implements _$$_SbbLegCopyWith<$Res> {
  __$$_SbbLegCopyWithImpl(_$_SbbLeg _value, $Res Function(_$_SbbLeg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sbbExit = freezed,
    Object? depDelay = freezed,
    Object? type = freezed,
    Object? track = freezed,
    Object? terminal = freezed,
    Object? bgcolor = freezed,
    Object? fgcolor = freezed,
    Object? number = freezed,
    Object? tripid = freezed,
    Object? stopid = freezed,
    Object? runningTime = freezed,
    Object? line = freezed,
    Object? sbbStops = null,
    Object? sbbName = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? normalTime = freezed,
    Object? waitTime = null,
    Object? isAddress = null,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? attributes = null,
  }) {
    return _then(_$_SbbLeg(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sbbExit: freezed == sbbExit
          ? _value.sbbExit
          : sbbExit // ignore: cast_nullable_to_non_nullable
              as SbbExit?,
      depDelay: freezed == depDelay
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType?,
      track: freezed == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      terminal: freezed == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String?,
      bgcolor: freezed == bgcolor
          ? _value.bgcolor
          : bgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      fgcolor: freezed == fgcolor
          ? _value.fgcolor
          : fgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      tripid: freezed == tripid
          ? _value.tripid
          : tripid // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: freezed == stopid
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      runningTime: freezed == runningTime
          ? _value.runningTime
          : runningTime // ignore: cast_nullable_to_non_nullable
              as double?,
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbStops: null == sbbStops
          ? _value._sbbStops
          : sbbStops // ignore: cast_nullable_to_non_nullable
              as List<SbbStop>,
      sbbName: freezed == sbbName
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      normalTime: freezed == normalTime
          ? _value.normalTime
          : normalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      waitTime: null == waitTime
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as double,
      isAddress: null == isAddress
          ? _value.isAddress
          : isAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
class _$_SbbLeg extends _SbbLeg {
  _$_SbbLeg(
      {required this.name,
      @JsonKey(name: 'exit')
          this.sbbExit,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          this.depDelay,
      this.type,
      this.track,
      this.terminal,
      this.bgcolor,
      this.fgcolor,
      this.number,
      this.tripid,
      this.stopid,
      @JsonKey(name: 'runningtime')
          this.runningTime,
      this.line,
      @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
          final List<SbbStop> sbbStops = const <SbbStop>[],
      this.sbbName,
      this.departure,
      this.arrival,
      @JsonKey(name: 'normal_time')
          this.normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0)
          this.waitTime = 0,
      @JsonKey(name: 'isaddress')
          this.isAddress = false,
      this.lat,
      this.lon,
      @IntConverter()
          this.x,
      @IntConverter()
          this.y,
      final Map<String, String> attributes = const <String, String>{}})
      : _sbbStops = sbbStops,
        _attributes = attributes,
        super._();

  factory _$_SbbLeg.fromJson(Map<String, dynamic> json) =>
      _$$_SbbLegFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'exit')
  final SbbExit? sbbExit;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  final int? depDelay;
  @override
  final PlaceType? type;
  @override
  final String? track;
  @override
  final String? terminal;
  @override
  final String? bgcolor;
  @override
  final String? fgcolor;
  @override
  final String? number;
  @override
  final String? tripid;
  @override
  final String? stopid;
  @override
  @JsonKey(name: 'runningtime')
  final double? runningTime;
  @override
  final String? line;
  final List<SbbStop> _sbbStops;
  @override
  @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
  List<SbbStop> get sbbStops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sbbStops);
  }

  @override
  final String? sbbName;
  @override
  final DateTime? departure;
  @override
  final DateTime? arrival;
  @override
  @JsonKey(name: 'normal_time')
  final double? normalTime;
  @override
  @JsonKey(name: 'waittime', defaultValue: 0)
  final double waitTime;
  @override
  @JsonKey(name: 'isaddress')
  final bool isAddress;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  @IntConverter()
  final int? x;
  @override
  @IntConverter()
  final int? y;
  final Map<String, String> _attributes;
  @override
  @JsonKey()
  Map<String, String> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  String toString() {
    return 'SbbLeg(name: $name, sbbExit: $sbbExit, depDelay: $depDelay, type: $type, track: $track, terminal: $terminal, bgcolor: $bgcolor, fgcolor: $fgcolor, number: $number, tripid: $tripid, stopid: $stopid, runningTime: $runningTime, line: $line, sbbStops: $sbbStops, sbbName: $sbbName, departure: $departure, arrival: $arrival, normalTime: $normalTime, waitTime: $waitTime, isAddress: $isAddress, lat: $lat, lon: $lon, x: $x, y: $y, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SbbLeg &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sbbExit, sbbExit) || other.sbbExit == sbbExit) &&
            (identical(other.depDelay, depDelay) ||
                other.depDelay == depDelay) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.bgcolor, bgcolor) || other.bgcolor == bgcolor) &&
            (identical(other.fgcolor, fgcolor) || other.fgcolor == fgcolor) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.tripid, tripid) || other.tripid == tripid) &&
            (identical(other.stopid, stopid) || other.stopid == stopid) &&
            (identical(other.runningTime, runningTime) ||
                other.runningTime == runningTime) &&
            (identical(other.line, line) || other.line == line) &&
            const DeepCollectionEquality().equals(other._sbbStops, _sbbStops) &&
            (identical(other.sbbName, sbbName) || other.sbbName == sbbName) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.normalTime, normalTime) ||
                other.normalTime == normalTime) &&
            (identical(other.waitTime, waitTime) ||
                other.waitTime == waitTime) &&
            (identical(other.isAddress, isAddress) ||
                other.isAddress == isAddress) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        sbbExit,
        depDelay,
        type,
        track,
        terminal,
        bgcolor,
        fgcolor,
        number,
        tripid,
        stopid,
        runningTime,
        line,
        const DeepCollectionEquality().hash(_sbbStops),
        sbbName,
        departure,
        arrival,
        normalTime,
        waitTime,
        isAddress,
        lat,
        lon,
        x,
        y,
        const DeepCollectionEquality().hash(_attributes)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SbbLegCopyWith<_$_SbbLeg> get copyWith =>
      __$$_SbbLegCopyWithImpl<_$_SbbLeg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbLegToJson(
      this,
    );
  }
}

abstract class _SbbLeg extends SbbLeg {
  factory _SbbLeg(
      {required final String name,
      @JsonKey(name: 'exit')
          final SbbExit? sbbExit,
      @DelayConverter()
      @JsonKey(name: 'dep_delay')
          final int? depDelay,
      final PlaceType? type,
      final String? track,
      final String? terminal,
      final String? bgcolor,
      final String? fgcolor,
      final String? number,
      final String? tripid,
      final String? stopid,
      @JsonKey(name: 'runningtime')
          final double? runningTime,
      final String? line,
      @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
          final List<SbbStop> sbbStops,
      final String? sbbName,
      final DateTime? departure,
      final DateTime? arrival,
      @JsonKey(name: 'normal_time')
          final double? normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0)
          final double waitTime,
      @JsonKey(name: 'isaddress')
          final bool isAddress,
      final double? lat,
      final double? lon,
      @IntConverter()
          final int? x,
      @IntConverter()
          final int? y,
      final Map<String, String> attributes}) = _$_SbbLeg;
  _SbbLeg._() : super._();

  factory _SbbLeg.fromJson(Map<String, dynamic> json) = _$_SbbLeg.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'exit')
  SbbExit? get sbbExit;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay;
  @override
  PlaceType? get type;
  @override
  String? get track;
  @override
  String? get terminal;
  @override
  String? get bgcolor;
  @override
  String? get fgcolor;
  @override
  String? get number;
  @override
  String? get tripid;
  @override
  String? get stopid;
  @override
  @JsonKey(name: 'runningtime')
  double? get runningTime;
  @override
  String? get line;
  @override
  @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
  List<SbbStop> get sbbStops;
  @override
  String? get sbbName;
  @override
  DateTime? get departure;
  @override
  DateTime? get arrival;
  @override
  @JsonKey(name: 'normal_time')
  double? get normalTime;
  @override
  @JsonKey(name: 'waittime', defaultValue: 0)
  double get waitTime;
  @override
  @JsonKey(name: 'isaddress')
  bool get isAddress;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @IntConverter()
  int? get x;
  @override
  @IntConverter()
  int? get y;
  @override
  Map<String, String> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$_SbbLegCopyWith<_$_SbbLeg> get copyWith =>
      throw _privateConstructorUsedError;
}
