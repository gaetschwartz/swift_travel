// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'route_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
SbbRouteConnection _$SbbRouteConnectionFromJson(Map<String, dynamic> json) {
  return _SbbRouteConnection.fromJson(json);
}

/// @nodoc
class _$SbbRouteConnectionTearOff {
  const _$SbbRouteConnectionTearOff();

  _SbbRouteConnection call(
      {required String from,
      required String to,
      DateTime? departure,
      DateTime? arrival,
      double? duration,
      @JsonKey(name: 'legs')
          List<SbbLeg> sbbLegs = const <SbbLeg>[],
      Map<String, Disruption> disruptions = const <String, Disruption>{},
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int depDelay}) {
    return _SbbRouteConnection(
      from: from,
      to: to,
      departure: departure,
      arrival: arrival,
      duration: duration,
      sbbLegs: sbbLegs,
      disruptions: disruptions,
      depDelay: depDelay,
    );
  }

  SbbRouteConnection fromJson(Map<String, Object> json) {
    return SbbRouteConnection.fromJson(json);
  }
}

/// @nodoc
const $SbbRouteConnection = _$SbbRouteConnectionTearOff();

/// @nodoc
mixin _$SbbRouteConnection {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  DateTime? get departure => throw _privateConstructorUsedError;
  DateTime? get arrival => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'legs')
  List<SbbLeg> get sbbLegs => throw _privateConstructorUsedError;
  Map<String, Disruption> get disruptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbRouteConnectionCopyWith<SbbRouteConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbRouteConnectionCopyWith<$Res> {
  factory $SbbRouteConnectionCopyWith(
          SbbRouteConnection value, $Res Function(SbbRouteConnection) then) =
      _$SbbRouteConnectionCopyWithImpl<$Res>;
  $Res call(
      {String from,
      String to,
      DateTime? departure,
      DateTime? arrival,
      double? duration,
      @JsonKey(name: 'legs')
          List<SbbLeg> sbbLegs,
      Map<String, Disruption> disruptions,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay});
}

/// @nodoc
class _$SbbRouteConnectionCopyWithImpl<$Res>
    implements $SbbRouteConnectionCopyWith<$Res> {
  _$SbbRouteConnectionCopyWithImpl(this._value, this._then);

  final SbbRouteConnection _value;
  // ignore: unused_field
  final $Res Function(SbbRouteConnection) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? duration = freezed,
    Object? sbbLegs = freezed,
    Object? disruptions = freezed,
    Object? depDelay = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime?,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime?,
      duration: duration == freezed ? _value.duration : duration as double?,
      sbbLegs: sbbLegs == freezed ? _value.sbbLegs : sbbLegs as List<SbbLeg>,
      disruptions: disruptions == freezed
          ? _value.disruptions
          : disruptions as Map<String, Disruption>,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
    ));
  }
}

/// @nodoc
abstract class _$SbbRouteConnectionCopyWith<$Res>
    implements $SbbRouteConnectionCopyWith<$Res> {
  factory _$SbbRouteConnectionCopyWith(
          _SbbRouteConnection value, $Res Function(_SbbRouteConnection) then) =
      __$SbbRouteConnectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String from,
      String to,
      DateTime? departure,
      DateTime? arrival,
      double? duration,
      @JsonKey(name: 'legs')
          List<SbbLeg> sbbLegs,
      Map<String, Disruption> disruptions,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          int depDelay});
}

/// @nodoc
class __$SbbRouteConnectionCopyWithImpl<$Res>
    extends _$SbbRouteConnectionCopyWithImpl<$Res>
    implements _$SbbRouteConnectionCopyWith<$Res> {
  __$SbbRouteConnectionCopyWithImpl(
      _SbbRouteConnection _value, $Res Function(_SbbRouteConnection) _then)
      : super(_value, (v) => _then(v as _SbbRouteConnection));

  @override
  _SbbRouteConnection get _value => super._value as _SbbRouteConnection;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? duration = freezed,
    Object? sbbLegs = freezed,
    Object? disruptions = freezed,
    Object? depDelay = freezed,
  }) {
    return _then(_SbbRouteConnection(
      from: from == freezed ? _value.from : from as String,
      to: to == freezed ? _value.to : to as String,
      departure:
          departure == freezed ? _value.departure : departure as DateTime?,
      arrival: arrival == freezed ? _value.arrival : arrival as DateTime?,
      duration: duration == freezed ? _value.duration : duration as double?,
      sbbLegs: sbbLegs == freezed ? _value.sbbLegs : sbbLegs as List<SbbLeg>,
      disruptions: disruptions == freezed
          ? _value.disruptions
          : disruptions as Map<String, Disruption>,
      depDelay: depDelay == freezed ? _value.depDelay : depDelay as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)

/// @nodoc
class _$_SbbRouteConnection extends _SbbRouteConnection {
  const _$_SbbRouteConnection(
      {required this.from,
      required this.to,
      this.departure,
      this.arrival,
      this.duration,
      @JsonKey(name: 'legs')
          this.sbbLegs = const <SbbLeg>[],
      this.disruptions = const <String, Disruption>{},
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required this.depDelay})
      : super._();

  factory _$_SbbRouteConnection.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbRouteConnectionFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final DateTime? departure;
  @override
  final DateTime? arrival;
  @override
  final double? duration;
  @override
  @JsonKey(name: 'legs')
  final List<SbbLeg> sbbLegs;
  @JsonKey(defaultValue: const <String, Disruption>{})
  @override
  final Map<String, Disruption> disruptions;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  final int depDelay;

  @override
  String toString() {
    return 'SbbRouteConnection(from: $from, to: $to, departure: $departure, arrival: $arrival, duration: $duration, sbbLegs: $sbbLegs, disruptions: $disruptions, depDelay: $depDelay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbRouteConnection &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.departure, departure) ||
                const DeepCollectionEquality()
                    .equals(other.departure, departure)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality()
                    .equals(other.arrival, arrival)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.sbbLegs, sbbLegs) ||
                const DeepCollectionEquality()
                    .equals(other.sbbLegs, sbbLegs)) &&
            (identical(other.disruptions, disruptions) ||
                const DeepCollectionEquality()
                    .equals(other.disruptions, disruptions)) &&
            (identical(other.depDelay, depDelay) ||
                const DeepCollectionEquality()
                    .equals(other.depDelay, depDelay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(departure) ^
      const DeepCollectionEquality().hash(arrival) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(sbbLegs) ^
      const DeepCollectionEquality().hash(disruptions) ^
      const DeepCollectionEquality().hash(depDelay);

  @JsonKey(ignore: true)
  @override
  _$SbbRouteConnectionCopyWith<_SbbRouteConnection> get copyWith =>
      __$SbbRouteConnectionCopyWithImpl<_SbbRouteConnection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbRouteConnectionToJson(this);
  }
}

abstract class _SbbRouteConnection extends SbbRouteConnection {
  const _SbbRouteConnection._() : super._();
  const factory _SbbRouteConnection(
      {required String from,
      required String to,
      DateTime? departure,
      DateTime? arrival,
      double? duration,
      @JsonKey(name: 'legs')
          List<SbbLeg> sbbLegs,
      Map<String, Disruption> disruptions,
      @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
          required int depDelay}) = _$_SbbRouteConnection;

  factory _SbbRouteConnection.fromJson(Map<String, dynamic> json) =
      _$_SbbRouteConnection.fromJson;

  @override
  String get from => throw _privateConstructorUsedError;
  @override
  String get to => throw _privateConstructorUsedError;
  @override
  DateTime? get departure => throw _privateConstructorUsedError;
  @override
  DateTime? get arrival => throw _privateConstructorUsedError;
  @override
  double? get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'legs')
  List<SbbLeg> get sbbLegs => throw _privateConstructorUsedError;
  @override
  Map<String, Disruption> get disruptions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
  int get depDelay => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbRouteConnectionCopyWith<_SbbRouteConnection> get copyWith =>
      throw _privateConstructorUsedError;
}
