// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'leg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Leg _$LegFromJson(Map<String, dynamic> json) {
  return _Leg.fromJson(json);
}

/// @nodoc
class _$LegTearOff {
  const _$LegTearOff();

// ignore: unused_element
  _Leg call(
      {Vehicle type,
      String track,
      String terminal,
      String fgcolor,
      String number,
      String bgcolor,
      String tripid,
      Exit exit,
      double runningtime,
      String stopid,
      String line,
      List<Stop> stops = const [],
      String sbbName,
      String name,
      DateTime departure,
      DateTime arrival,
      int normalTime,
      int waittime,
      bool isaddress,
      double lat,
      double lon,
      Map<String, String> attributes = const {}}) {
    return _Leg(
      type: type,
      track: track,
      terminal: terminal,
      fgcolor: fgcolor,
      number: number,
      bgcolor: bgcolor,
      tripid: tripid,
      exit: exit,
      runningtime: runningtime,
      stopid: stopid,
      line: line,
      stops: stops,
      sbbName: sbbName,
      name: name,
      departure: departure,
      arrival: arrival,
      normalTime: normalTime,
      waittime: waittime,
      isaddress: isaddress,
      lat: lat,
      lon: lon,
      attributes: attributes,
    );
  }

// ignore: unused_element
  Leg fromJson(Map<String, Object> json) {
    return Leg.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Leg = _$LegTearOff();

/// @nodoc
mixin _$Leg {
  Vehicle get type;
  String get track;
  String get terminal;
  String get fgcolor;
  String get number;
  String get bgcolor;
  String get tripid;
  Exit get exit;
  double get runningtime;
  String get stopid;
  String get line;
  List<Stop> get stops;
  String get sbbName;
  String get name;
  DateTime get departure;
  DateTime get arrival;
  int get normalTime;
  int get waittime;
  bool get isaddress;
  double get lat;
  double get lon;
  Map<String, String> get attributes;

  Map<String, dynamic> toJson();
  $LegCopyWith<Leg> get copyWith;
}

/// @nodoc
abstract class $LegCopyWith<$Res> {
  factory $LegCopyWith(Leg value, $Res Function(Leg) then) =
      _$LegCopyWithImpl<$Res>;
  $Res call(
      {Vehicle type,
      String track,
      String terminal,
      String fgcolor,
      String number,
      String bgcolor,
      String tripid,
      Exit exit,
      double runningtime,
      String stopid,
      String line,
      List<Stop> stops,
      String sbbName,
      String name,
      DateTime departure,
      DateTime arrival,
      int normalTime,
      int waittime,
      bool isaddress,
      double lat,
      double lon,
      Map<String, String> attributes});

  $ExitCopyWith<$Res> get exit;
}

/// @nodoc
class _$LegCopyWithImpl<$Res> implements $LegCopyWith<$Res> {
  _$LegCopyWithImpl(this._value, this._then);

  final Leg _value;
  // ignore: unused_field
  final $Res Function(Leg) _then;

  @override
  $Res call({
    Object type = freezed,
    Object track = freezed,
    Object terminal = freezed,
    Object fgcolor = freezed,
    Object number = freezed,
    Object bgcolor = freezed,
    Object tripid = freezed,
    Object exit = freezed,
    Object runningtime = freezed,
    Object stopid = freezed,
    Object line = freezed,
    Object stops = freezed,
    Object sbbName = freezed,
    Object name = freezed,
    Object departure = freezed,
    Object arrival = freezed,
    Object normalTime = freezed,
    Object waittime = freezed,
    Object isaddress = freezed,
    Object lat = freezed,
    Object lon = freezed,
    Object attributes = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as Vehicle,
      track: track == freezed ? _value.track : track as String,
      terminal: terminal == freezed ? _value.terminal : terminal as String,
      fgcolor: fgcolor == freezed ? _value.fgcolor : fgcolor as String,
      number: number == freezed ? _value.number : number as String,
      bgcolor: bgcolor == freezed ? _value.bgcolor : bgcolor as String,
      tripid: tripid == freezed ? _value.tripid : tripid as String,
      exit: exit == freezed ? _value.exit : exit as Exit,
      runningtime:
          runningtime == freezed ? _value.runningtime : runningtime as double,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      line: line == freezed ? _value.line : line as String,
      stops: stops == freezed ? _value.stops : stops as List<Stop>,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String,
      name: name == freezed ? _value.name : name as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      normalTime: normalTime == freezed ? _value.normalTime : normalTime as int,
      waittime: waittime == freezed ? _value.waittime : waittime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes as Map<String, String>,
    ));
  }

  @override
  $ExitCopyWith<$Res> get exit {
    if (_value.exit == null) {
      return null;
    }
    return $ExitCopyWith<$Res>(_value.exit, (value) {
      return _then(_value.copyWith(exit: value));
    });
  }
}

/// @nodoc
abstract class _$LegCopyWith<$Res> implements $LegCopyWith<$Res> {
  factory _$LegCopyWith(_Leg value, $Res Function(_Leg) then) =
      __$LegCopyWithImpl<$Res>;
  @override
  $Res call(
      {Vehicle type,
      String track,
      String terminal,
      String fgcolor,
      String number,
      String bgcolor,
      String tripid,
      Exit exit,
      double runningtime,
      String stopid,
      String line,
      List<Stop> stops,
      String sbbName,
      String name,
      DateTime departure,
      DateTime arrival,
      int normalTime,
      int waittime,
      bool isaddress,
      double lat,
      double lon,
      Map<String, String> attributes});

  @override
  $ExitCopyWith<$Res> get exit;
}

/// @nodoc
class __$LegCopyWithImpl<$Res> extends _$LegCopyWithImpl<$Res>
    implements _$LegCopyWith<$Res> {
  __$LegCopyWithImpl(_Leg _value, $Res Function(_Leg) _then)
      : super(_value, (v) => _then(v as _Leg));

  @override
  _Leg get _value => super._value as _Leg;

  @override
  $Res call({
    Object type = freezed,
    Object track = freezed,
    Object terminal = freezed,
    Object fgcolor = freezed,
    Object number = freezed,
    Object bgcolor = freezed,
    Object tripid = freezed,
    Object exit = freezed,
    Object runningtime = freezed,
    Object stopid = freezed,
    Object line = freezed,
    Object stops = freezed,
    Object sbbName = freezed,
    Object name = freezed,
    Object departure = freezed,
    Object arrival = freezed,
    Object normalTime = freezed,
    Object waittime = freezed,
    Object isaddress = freezed,
    Object lat = freezed,
    Object lon = freezed,
    Object attributes = freezed,
  }) {
    return _then(_Leg(
      type: type == freezed ? _value.type : type as Vehicle,
      track: track == freezed ? _value.track : track as String,
      terminal: terminal == freezed ? _value.terminal : terminal as String,
      fgcolor: fgcolor == freezed ? _value.fgcolor : fgcolor as String,
      number: number == freezed ? _value.number : number as String,
      bgcolor: bgcolor == freezed ? _value.bgcolor : bgcolor as String,
      tripid: tripid == freezed ? _value.tripid : tripid as String,
      exit: exit == freezed ? _value.exit : exit as Exit,
      runningtime:
          runningtime == freezed ? _value.runningtime : runningtime as double,
      stopid: stopid == freezed ? _value.stopid : stopid as String,
      line: line == freezed ? _value.line : line as String,
      stops: stops == freezed ? _value.stops : stops as List<Stop>,
      sbbName: sbbName == freezed ? _value.sbbName : sbbName as String,
      name: name == freezed ? _value.name : name as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime,
      normalTime: normalTime == freezed ? _value.normalTime : normalTime as int,
      waittime: waittime == freezed ? _value.waittime : waittime as int,
      isaddress: isaddress == freezed ? _value.isaddress : isaddress as bool,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes as Map<String, String>,
    ));
  }
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)

/// @nodoc
class _$_Leg implements _Leg {
  _$_Leg(
      {this.type,
      this.track,
      this.terminal,
      this.fgcolor,
      this.number,
      this.bgcolor,
      this.tripid,
      this.exit,
      this.runningtime,
      this.stopid,
      this.line,
      this.stops = const [],
      this.sbbName,
      this.name,
      this.departure,
      this.arrival,
      this.normalTime,
      this.waittime,
      this.isaddress,
      this.lat,
      this.lon,
      this.attributes = const {}})
      : assert(stops != null),
        assert(attributes != null);

  factory _$_Leg.fromJson(Map<String, dynamic> json) => _$_$_LegFromJson(json);

  @override
  final Vehicle type;
  @override
  final String track;
  @override
  final String terminal;
  @override
  final String fgcolor;
  @override
  final String number;
  @override
  final String bgcolor;
  @override
  final String tripid;
  @override
  final Exit exit;
  @override
  final double runningtime;
  @override
  final String stopid;
  @override
  final String line;
  @JsonKey(defaultValue: const [])
  @override
  final List<Stop> stops;
  @override
  final String sbbName;
  @override
  final String name;
  @override
  final DateTime departure;
  @override
  final DateTime arrival;
  @override
  final int normalTime;
  @override
  final int waittime;
  @override
  final bool isaddress;
  @override
  final double lat;
  @override
  final double lon;
  @JsonKey(defaultValue: const {})
  @override
  final Map<String, String> attributes;

  @override
  String toString() {
    return 'Leg(type: $type, track: $track, terminal: $terminal, fgcolor: $fgcolor, number: $number, bgcolor: $bgcolor, tripid: $tripid, exit: $exit, runningtime: $runningtime, stopid: $stopid, line: $line, stops: $stops, sbbName: $sbbName, name: $name, departure: $departure, arrival: $arrival, normalTime: $normalTime, waittime: $waittime, isaddress: $isaddress, lat: $lat, lon: $lon, attributes: $attributes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Leg &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.track, track) ||
                const DeepCollectionEquality().equals(other.track, track)) &&
            (identical(other.terminal, terminal) ||
                const DeepCollectionEquality()
                    .equals(other.terminal, terminal)) &&
            (identical(other.fgcolor, fgcolor) ||
                const DeepCollectionEquality()
                    .equals(other.fgcolor, fgcolor)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.bgcolor, bgcolor) ||
                const DeepCollectionEquality()
                    .equals(other.bgcolor, bgcolor)) &&
            (identical(other.tripid, tripid) ||
                const DeepCollectionEquality().equals(other.tripid, tripid)) &&
            (identical(other.exit, exit) ||
                const DeepCollectionEquality().equals(other.exit, exit)) &&
            (identical(other.runningtime, runningtime) ||
                const DeepCollectionEquality()
                    .equals(other.runningtime, runningtime)) &&
            (identical(other.stopid, stopid) ||
                const DeepCollectionEquality().equals(other.stopid, stopid)) &&
            (identical(other.line, line) ||
                const DeepCollectionEquality().equals(other.line, line)) &&
            (identical(other.stops, stops) ||
                const DeepCollectionEquality().equals(other.stops, stops)) &&
            (identical(other.sbbName, sbbName) ||
                const DeepCollectionEquality()
                    .equals(other.sbbName, sbbName)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.departure, departure) ||
                const DeepCollectionEquality()
                    .equals(other.departure, departure)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.normalTime, normalTime) ||
                const DeepCollectionEquality()
                    .equals(other.normalTime, normalTime)) &&
            (identical(other.waittime, waittime) ||
                const DeepCollectionEquality()
                    .equals(other.waittime, waittime)) &&
            (identical(other.isaddress, isaddress) ||
                const DeepCollectionEquality()
                    .equals(other.isaddress, isaddress)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)) &&
            (identical(other.attributes, attributes) ||
                const DeepCollectionEquality()
                    .equals(other.attributes, attributes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(track) ^
      const DeepCollectionEquality().hash(terminal) ^
      const DeepCollectionEquality().hash(fgcolor) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(bgcolor) ^
      const DeepCollectionEquality().hash(tripid) ^
      const DeepCollectionEquality().hash(exit) ^
      const DeepCollectionEquality().hash(runningtime) ^
      const DeepCollectionEquality().hash(stopid) ^
      const DeepCollectionEquality().hash(line) ^
      const DeepCollectionEquality().hash(stops) ^
      const DeepCollectionEquality().hash(sbbName) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(departure) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(normalTime) ^
      const DeepCollectionEquality().hash(waittime) ^
      const DeepCollectionEquality().hash(isaddress) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon) ^
      const DeepCollectionEquality().hash(attributes);

  @override
  _$LegCopyWith<_Leg> get copyWith =>
      __$LegCopyWithImpl<_Leg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LegToJson(this);
  }
}

abstract class _Leg implements Leg {
  factory _Leg(
      {Vehicle type,
      String track,
      String terminal,
      String fgcolor,
      String number,
      String bgcolor,
      String tripid,
      Exit exit,
      double runningtime,
      String stopid,
      String line,
      List<Stop> stops,
      String sbbName,
      String name,
      DateTime departure,
      DateTime arrival,
      int normalTime,
      int waittime,
      bool isaddress,
      double lat,
      double lon,
      Map<String, String> attributes}) = _$_Leg;

  factory _Leg.fromJson(Map<String, dynamic> json) = _$_Leg.fromJson;

  @override
  Vehicle get type;
  @override
  String get track;
  @override
  String get terminal;
  @override
  String get fgcolor;
  @override
  String get number;
  @override
  String get bgcolor;
  @override
  String get tripid;
  @override
  Exit get exit;
  @override
  double get runningtime;
  @override
  String get stopid;
  @override
  String get line;
  @override
  List<Stop> get stops;
  @override
  String get sbbName;
  @override
  String get name;
  @override
  DateTime get departure;
  @override
  DateTime get arrival;
  @override
  int get normalTime;
  @override
  int get waittime;
  @override
  bool get isaddress;
  @override
  double get lat;
  @override
  double get lon;
  @override
  Map<String, String> get attributes;
  @override
  _$LegCopyWith<_Leg> get copyWith;
}
