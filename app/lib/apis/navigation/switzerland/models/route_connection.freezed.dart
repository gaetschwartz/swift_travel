// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbRouteConnection _$SbbRouteConnectionFromJson(Map<String, dynamic> json) {
  return _SbbRouteConnection.fromJson(json);
}

/// @nodoc
mixin _$SbbRouteConnection {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay => throw _privateConstructorUsedError;
  DateTime? get departure => throw _privateConstructorUsedError;
  DateTime? get arrival => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  double? get durationInSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'legs')
  List<SbbLeg> get sbbLegs => throw _privateConstructorUsedError;
  Map<String, Disruption> get disruptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbRouteConnectionCopyWith<SbbRouteConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbRouteConnectionCopyWith<$Res> {
  factory $SbbRouteConnectionCopyWith(
          SbbRouteConnection value, $Res Function(SbbRouteConnection) then) =
      _$SbbRouteConnectionCopyWithImpl<$Res, SbbRouteConnection>;
  @useResult
  $Res call(
      {String from,
      String to,
      @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
      DateTime? departure,
      DateTime? arrival,
      @JsonKey(name: 'duration') double? durationInSeconds,
      @JsonKey(name: 'legs') List<SbbLeg> sbbLegs,
      Map<String, Disruption> disruptions});
}

/// @nodoc
class _$SbbRouteConnectionCopyWithImpl<$Res, $Val extends SbbRouteConnection>
    implements $SbbRouteConnectionCopyWith<$Res> {
  _$SbbRouteConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? depDelay = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? durationInSeconds = freezed,
    Object? sbbLegs = null,
    Object? disruptions = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      depDelay: freezed == depDelay
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationInSeconds: freezed == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbLegs: null == sbbLegs
          ? _value.sbbLegs
          : sbbLegs // ignore: cast_nullable_to_non_nullable
              as List<SbbLeg>,
      disruptions: null == disruptions
          ? _value.disruptions
          : disruptions // ignore: cast_nullable_to_non_nullable
              as Map<String, Disruption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SbbRouteConnectionCopyWith<$Res>
    implements $SbbRouteConnectionCopyWith<$Res> {
  factory _$$_SbbRouteConnectionCopyWith(_$_SbbRouteConnection value,
          $Res Function(_$_SbbRouteConnection) then) =
      __$$_SbbRouteConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String from,
      String to,
      @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
      DateTime? departure,
      DateTime? arrival,
      @JsonKey(name: 'duration') double? durationInSeconds,
      @JsonKey(name: 'legs') List<SbbLeg> sbbLegs,
      Map<String, Disruption> disruptions});
}

/// @nodoc
class __$$_SbbRouteConnectionCopyWithImpl<$Res>
    extends _$SbbRouteConnectionCopyWithImpl<$Res, _$_SbbRouteConnection>
    implements _$$_SbbRouteConnectionCopyWith<$Res> {
  __$$_SbbRouteConnectionCopyWithImpl(
      _$_SbbRouteConnection _value, $Res Function(_$_SbbRouteConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? depDelay = freezed,
    Object? departure = freezed,
    Object? arrival = freezed,
    Object? durationInSeconds = freezed,
    Object? sbbLegs = null,
    Object? disruptions = null,
  }) {
    return _then(_$_SbbRouteConnection(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      depDelay: freezed == depDelay
          ? _value.depDelay
          : depDelay // ignore: cast_nullable_to_non_nullable
              as int?,
      departure: freezed == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrival: freezed == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationInSeconds: freezed == durationInSeconds
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbLegs: null == sbbLegs
          ? _value._sbbLegs
          : sbbLegs // ignore: cast_nullable_to_non_nullable
              as List<SbbLeg>,
      disruptions: null == disruptions
          ? _value._disruptions
          : disruptions // ignore: cast_nullable_to_non_nullable
              as Map<String, Disruption>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
class _$_SbbRouteConnection extends _SbbRouteConnection {
  const _$_SbbRouteConnection(
      {required this.from,
      required this.to,
      @DelayConverter() @JsonKey(name: 'dep_delay') this.depDelay,
      this.departure,
      this.arrival,
      @JsonKey(name: 'duration') this.durationInSeconds,
      @JsonKey(name: 'legs') final List<SbbLeg> sbbLegs = const <SbbLeg>[],
      final Map<String, Disruption> disruptions = const <String, Disruption>{}})
      : _sbbLegs = sbbLegs,
        _disruptions = disruptions,
        super._();

  factory _$_SbbRouteConnection.fromJson(Map<String, dynamic> json) =>
      _$$_SbbRouteConnectionFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  final int? depDelay;
  @override
  final DateTime? departure;
  @override
  final DateTime? arrival;
  @override
  @JsonKey(name: 'duration')
  final double? durationInSeconds;
  final List<SbbLeg> _sbbLegs;
  @override
  @JsonKey(name: 'legs')
  List<SbbLeg> get sbbLegs {
    if (_sbbLegs is EqualUnmodifiableListView) return _sbbLegs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sbbLegs);
  }

  final Map<String, Disruption> _disruptions;
  @override
  @JsonKey()
  Map<String, Disruption> get disruptions {
    if (_disruptions is EqualUnmodifiableMapView) return _disruptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_disruptions);
  }

  @override
  String toString() {
    return 'SbbRouteConnection(from: $from, to: $to, depDelay: $depDelay, departure: $departure, arrival: $arrival, durationInSeconds: $durationInSeconds, sbbLegs: $sbbLegs, disruptions: $disruptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SbbRouteConnection &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.depDelay, depDelay) ||
                other.depDelay == depDelay) &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.durationInSeconds, durationInSeconds) ||
                other.durationInSeconds == durationInSeconds) &&
            const DeepCollectionEquality().equals(other._sbbLegs, _sbbLegs) &&
            const DeepCollectionEquality()
                .equals(other._disruptions, _disruptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      from,
      to,
      depDelay,
      departure,
      arrival,
      durationInSeconds,
      const DeepCollectionEquality().hash(_sbbLegs),
      const DeepCollectionEquality().hash(_disruptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SbbRouteConnectionCopyWith<_$_SbbRouteConnection> get copyWith =>
      __$$_SbbRouteConnectionCopyWithImpl<_$_SbbRouteConnection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbRouteConnectionToJson(
      this,
    );
  }
}

abstract class _SbbRouteConnection extends SbbRouteConnection {
  const factory _SbbRouteConnection(
      {required final String from,
      required final String to,
      @DelayConverter() @JsonKey(name: 'dep_delay') final int? depDelay,
      final DateTime? departure,
      final DateTime? arrival,
      @JsonKey(name: 'duration') final double? durationInSeconds,
      @JsonKey(name: 'legs') final List<SbbLeg> sbbLegs,
      final Map<String, Disruption> disruptions}) = _$_SbbRouteConnection;
  const _SbbRouteConnection._() : super._();

  factory _SbbRouteConnection.fromJson(Map<String, dynamic> json) =
      _$_SbbRouteConnection.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  @DelayConverter()
  @JsonKey(name: 'dep_delay')
  int? get depDelay;
  @override
  DateTime? get departure;
  @override
  DateTime? get arrival;
  @override
  @JsonKey(name: 'duration')
  double? get durationInSeconds;
  @override
  @JsonKey(name: 'legs')
  List<SbbLeg> get sbbLegs;
  @override
  Map<String, Disruption> get disruptions;
  @override
  @JsonKey(ignore: true)
  _$$_SbbRouteConnectionCopyWith<_$_SbbRouteConnection> get copyWith =>
      throw _privateConstructorUsedError;
}
