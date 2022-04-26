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
  @JsonKey(name: "normal_time")
  double? get normalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'waittime', defaultValue: 0)
  double get waitTime => throw _privateConstructorUsedError;
  @JsonKey(name: "isaddress")
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
      _$SbbLegCopyWithImpl<$Res>;
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
      @JsonKey(name: "normal_time") double? normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0) double waitTime,
      @JsonKey(name: "isaddress") bool isAddress,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y,
      Map<String, String> attributes});

  $SbbExitCopyWith<$Res>? get sbbExit;
}

/// @nodoc
class _$SbbLegCopyWithImpl<$Res> implements $SbbLegCopyWith<$Res> {
  _$SbbLegCopyWithImpl(this._value, this._then);

  final SbbLeg _value;
  // ignore: unused_field
  final $Res Function(SbbLeg) _then;

  @override
  $Res call({
    Object? name = freezed,
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
    Object? sbbStops = freezed,
    Object? sbbName = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? normalTime = freezed,
    Object? waitTime = freezed,
    Object? isAddress = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sbbExit: sbbExit == freezed
          ? _value.sbbExit
          : sbbExit // ignore: cast_nullable_to_non_nullable
              as SbbExit?,
      depDelay: depDelay == freezed
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType?,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      terminal: terminal == freezed
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String?,
      bgcolor: bgcolor == freezed
          ? _value.bgcolor
          : bgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      fgcolor: fgcolor == freezed
          ? _value.fgcolor
          : fgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      tripid: tripid == freezed
          ? _value.tripid
          : tripid // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: stopid == freezed
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      runningTime: runningTime == freezed
          ? _value.runningTime
          : runningTime // ignore: cast_nullable_to_non_nullable
              as double?,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbStops: sbbStops == freezed
          ? _value.sbbStops
          : sbbStops // ignore: cast_nullable_to_non_nullable
              as List<SbbStop>,
      sbbName: sbbName == freezed
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: departure == freezed
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrival: arrival == freezed
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      normalTime: normalTime == freezed
          ? _value.normalTime
          : normalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      waitTime: waitTime == freezed
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as double,
      isAddress: isAddress == freezed
          ? _value.isAddress
          : isAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }

  @override
  $SbbExitCopyWith<$Res>? get sbbExit {
    if (_value.sbbExit == null) {
      return null;
    }

    return $SbbExitCopyWith<$Res>(_value.sbbExit!, (value) {
      return _then(_value.copyWith(sbbExit: value));
    });
  }
}

/// @nodoc
abstract class _$SbbLegCopyWith<$Res> implements $SbbLegCopyWith<$Res> {
  factory _$SbbLegCopyWith(_SbbLeg value, $Res Function(_SbbLeg) then) =
      __$SbbLegCopyWithImpl<$Res>;
  @override
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
      @JsonKey(name: "normal_time") double? normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0) double waitTime,
      @JsonKey(name: "isaddress") bool isAddress,
      double? lat,
      double? lon,
      @IntConverter() int? x,
      @IntConverter() int? y,
      Map<String, String> attributes});

  @override
  $SbbExitCopyWith<$Res>? get sbbExit;
}

/// @nodoc
class __$SbbLegCopyWithImpl<$Res> extends _$SbbLegCopyWithImpl<$Res>
    implements _$SbbLegCopyWith<$Res> {
  __$SbbLegCopyWithImpl(_SbbLeg _value, $Res Function(_SbbLeg) _then)
      : super(_value, (v) => _then(v as _SbbLeg));

  @override
  _SbbLeg get _value => super._value as _SbbLeg;

  @override
  $Res call({
    Object? name = freezed,
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
    Object? sbbStops = freezed,
    Object? sbbName = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? normalTime = freezed,
    Object? waitTime = freezed,
    Object? isAddress = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? x = freezed,
    Object? y = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_SbbLeg(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sbbExit: sbbExit == freezed
          ? _value.sbbExit
          : sbbExit // ignore: cast_nullable_to_non_nullable
              as SbbExit?,
      depDelay: depDelay == freezed
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PlaceType?,
      track: track == freezed
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String?,
      terminal: terminal == freezed
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String?,
      bgcolor: bgcolor == freezed
          ? _value.bgcolor
          : bgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      fgcolor: fgcolor == freezed
          ? _value.fgcolor
          : fgcolor // ignore: cast_nullable_to_non_nullable
              as String?,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      tripid: tripid == freezed
          ? _value.tripid
          : tripid // ignore: cast_nullable_to_non_nullable
              as String?,
      stopid: stopid == freezed
          ? _value.stopid
          : stopid // ignore: cast_nullable_to_non_nullable
              as String?,
      runningTime: runningTime == freezed
          ? _value.runningTime
          : runningTime // ignore: cast_nullable_to_non_nullable
              as double?,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      sbbStops: sbbStops == freezed
          ? _value.sbbStops
          : sbbStops // ignore: cast_nullable_to_non_nullable
              as List<SbbStop>,
      sbbName: sbbName == freezed
          ? _value.sbbName
          : sbbName // ignore: cast_nullable_to_non_nullable
              as String?,
      departure: departure == freezed
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrival: arrival == freezed
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      normalTime: normalTime == freezed
          ? _value.normalTime
          : normalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      waitTime: waitTime == freezed
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as double,
      isAddress: isAddress == freezed
          ? _value.isAddress
          : isAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int?,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int?,
      attributes: attributes == freezed
          ? _value.attributes
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
      @JsonKey(name: "normal_time")
          this.normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0)
          this.waitTime = 0,
      @JsonKey(name: "isaddress")
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
  @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
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
  @JsonKey(name: "normal_time")
  final double? normalTime;
  @override
  @JsonKey(name: 'waittime', defaultValue: 0)
  final double waitTime;
  @override
  @JsonKey(name: "isaddress")
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
            other is _SbbLeg &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.sbbExit, sbbExit) &&
            const DeepCollectionEquality().equals(other.depDelay, depDelay) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.track, track) &&
            const DeepCollectionEquality().equals(other.terminal, terminal) &&
            const DeepCollectionEquality().equals(other.bgcolor, bgcolor) &&
            const DeepCollectionEquality().equals(other.fgcolor, fgcolor) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.tripid, tripid) &&
            const DeepCollectionEquality().equals(other.stopid, stopid) &&
            const DeepCollectionEquality()
                .equals(other.runningTime, runningTime) &&
            const DeepCollectionEquality().equals(other.line, line) &&
            const DeepCollectionEquality().equals(other.sbbStops, sbbStops) &&
            const DeepCollectionEquality().equals(other.sbbName, sbbName) &&
            const DeepCollectionEquality().equals(other.departure, departure) &&
            const DeepCollectionEquality().equals(other.arrival, arrival) &&
            const DeepCollectionEquality()
                .equals(other.normalTime, normalTime) &&
            const DeepCollectionEquality().equals(other.waitTime, waitTime) &&
            const DeepCollectionEquality().equals(other.isAddress, isAddress) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lon, lon) &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(sbbExit),
        const DeepCollectionEquality().hash(depDelay),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(track),
        const DeepCollectionEquality().hash(terminal),
        const DeepCollectionEquality().hash(bgcolor),
        const DeepCollectionEquality().hash(fgcolor),
        const DeepCollectionEquality().hash(number),
        const DeepCollectionEquality().hash(tripid),
        const DeepCollectionEquality().hash(stopid),
        const DeepCollectionEquality().hash(runningTime),
        const DeepCollectionEquality().hash(line),
        const DeepCollectionEquality().hash(sbbStops),
        const DeepCollectionEquality().hash(sbbName),
        const DeepCollectionEquality().hash(departure),
        const DeepCollectionEquality().hash(arrival),
        const DeepCollectionEquality().hash(normalTime),
        const DeepCollectionEquality().hash(waitTime),
        const DeepCollectionEquality().hash(isAddress),
        const DeepCollectionEquality().hash(lat),
        const DeepCollectionEquality().hash(lon),
        const DeepCollectionEquality().hash(x),
        const DeepCollectionEquality().hash(y),
        const DeepCollectionEquality().hash(attributes)
      ]);

  @JsonKey(ignore: true)
  @override
  _$SbbLegCopyWith<_SbbLeg> get copyWith =>
      __$SbbLegCopyWithImpl<_SbbLeg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbLegToJson(this);
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
      @JsonKey(name: "normal_time")
          final double? normalTime,
      @JsonKey(name: 'waittime', defaultValue: 0)
          final double waitTime,
      @JsonKey(name: "isaddress")
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
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'exit')
  SbbExit? get sbbExit => throw _privateConstructorUsedError;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay => throw _privateConstructorUsedError;
  @override
  PlaceType? get type => throw _privateConstructorUsedError;
  @override
  String? get track => throw _privateConstructorUsedError;
  @override
  String? get terminal => throw _privateConstructorUsedError;
  @override
  String? get bgcolor => throw _privateConstructorUsedError;
  @override
  String? get fgcolor => throw _privateConstructorUsedError;
  @override
  String? get number => throw _privateConstructorUsedError;
  @override
  String? get tripid => throw _privateConstructorUsedError;
  @override
  String? get stopid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'runningtime')
  double? get runningTime => throw _privateConstructorUsedError;
  @override
  String? get line => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'stops', defaultValue: <SbbStop>[])
  List<SbbStop> get sbbStops => throw _privateConstructorUsedError;
  @override
  String? get sbbName => throw _privateConstructorUsedError;
  @override
  DateTime? get departure => throw _privateConstructorUsedError;
  @override
  DateTime? get arrival => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "normal_time")
  double? get normalTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'waittime', defaultValue: 0)
  double get waitTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "isaddress")
  bool get isAddress => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lon => throw _privateConstructorUsedError;
  @override
  @IntConverter()
  int? get x => throw _privateConstructorUsedError;
  @override
  @IntConverter()
  int? get y => throw _privateConstructorUsedError;
  @override
  Map<String, String> get attributes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbLegCopyWith<_SbbLeg> get copyWith => throw _privateConstructorUsedError;
}
