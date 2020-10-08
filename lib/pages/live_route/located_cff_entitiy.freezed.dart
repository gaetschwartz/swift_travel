// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'located_cff_entitiy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LocatedCffEntitiyTearOff {
  const _$LocatedCffEntitiyTearOff();

// ignore: unused_element
  LegEntity leg(Leg leg) {
    return LegEntity(
      leg,
    );
  }

// ignore: unused_element
  StopEntity stop(Stop stop) {
    return StopEntity(
      stop,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LocatedCffEntitiy = _$LocatedCffEntitiyTearOff();

/// @nodoc
mixin _$LocatedCffEntitiy {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result leg(Leg leg),
    @required Result stop(Stop stop),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result leg(Leg leg),
    Result stop(Stop stop),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result leg(LegEntity value),
    @required Result stop(StopEntity value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result leg(LegEntity value),
    Result stop(StopEntity value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $LocatedCffEntitiyCopyWith<$Res> {
  factory $LocatedCffEntitiyCopyWith(
          LocatedCffEntitiy value, $Res Function(LocatedCffEntitiy) then) =
      _$LocatedCffEntitiyCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocatedCffEntitiyCopyWithImpl<$Res>
    implements $LocatedCffEntitiyCopyWith<$Res> {
  _$LocatedCffEntitiyCopyWithImpl(this._value, this._then);

  final LocatedCffEntitiy _value;
  // ignore: unused_field
  final $Res Function(LocatedCffEntitiy) _then;
}

/// @nodoc
abstract class $LegEntityCopyWith<$Res> {
  factory $LegEntityCopyWith(LegEntity value, $Res Function(LegEntity) then) =
      _$LegEntityCopyWithImpl<$Res>;
  $Res call({Leg leg});

  $LegCopyWith<$Res> get leg;
}

/// @nodoc
class _$LegEntityCopyWithImpl<$Res>
    extends _$LocatedCffEntitiyCopyWithImpl<$Res>
    implements $LegEntityCopyWith<$Res> {
  _$LegEntityCopyWithImpl(LegEntity _value, $Res Function(LegEntity) _then)
      : super(_value, (v) => _then(v as LegEntity));

  @override
  LegEntity get _value => super._value as LegEntity;

  @override
  $Res call({
    Object leg = freezed,
  }) {
    return _then(LegEntity(
      leg == freezed ? _value.leg : leg as Leg,
    ));
  }

  @override
  $LegCopyWith<$Res> get leg {
    if (_value.leg == null) {
      return null;
    }
    return $LegCopyWith<$Res>(_value.leg, (value) {
      return _then(_value.copyWith(leg: value));
    });
  }
}

/// @nodoc
class _$LegEntity implements LegEntity {
  _$LegEntity(this.leg) : assert(leg != null);

  @override
  final Leg leg;

  @override
  String toString() {
    return 'LocatedCffEntitiy.leg(leg: $leg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LegEntity &&
            (identical(other.leg, leg) ||
                const DeepCollectionEquality().equals(other.leg, leg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(leg);

  @override
  $LegEntityCopyWith<LegEntity> get copyWith =>
      _$LegEntityCopyWithImpl<LegEntity>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result leg(Leg leg),
    @required Result stop(Stop stop),
  }) {
    assert(leg != null);
    assert(stop != null);
    return leg(this.leg);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result leg(Leg leg),
    Result stop(Stop stop),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (leg != null) {
      return leg(this.leg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result leg(LegEntity value),
    @required Result stop(StopEntity value),
  }) {
    assert(leg != null);
    assert(stop != null);
    return leg(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result leg(LegEntity value),
    Result stop(StopEntity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (leg != null) {
      return leg(this);
    }
    return orElse();
  }
}

abstract class LegEntity implements LocatedCffEntitiy {
  factory LegEntity(Leg leg) = _$LegEntity;

  Leg get leg;
  $LegEntityCopyWith<LegEntity> get copyWith;
}

/// @nodoc
abstract class $StopEntityCopyWith<$Res> {
  factory $StopEntityCopyWith(
          StopEntity value, $Res Function(StopEntity) then) =
      _$StopEntityCopyWithImpl<$Res>;
  $Res call({Stop stop});

  $StopCopyWith<$Res> get stop;
}

/// @nodoc
class _$StopEntityCopyWithImpl<$Res>
    extends _$LocatedCffEntitiyCopyWithImpl<$Res>
    implements $StopEntityCopyWith<$Res> {
  _$StopEntityCopyWithImpl(StopEntity _value, $Res Function(StopEntity) _then)
      : super(_value, (v) => _then(v as StopEntity));

  @override
  StopEntity get _value => super._value as StopEntity;

  @override
  $Res call({
    Object stop = freezed,
  }) {
    return _then(StopEntity(
      stop == freezed ? _value.stop : stop as Stop,
    ));
  }

  @override
  $StopCopyWith<$Res> get stop {
    if (_value.stop == null) {
      return null;
    }
    return $StopCopyWith<$Res>(_value.stop, (value) {
      return _then(_value.copyWith(stop: value));
    });
  }
}

/// @nodoc
class _$StopEntity implements StopEntity {
  _$StopEntity(this.stop) : assert(stop != null);

  @override
  final Stop stop;

  @override
  String toString() {
    return 'LocatedCffEntitiy.stop(stop: $stop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StopEntity &&
            (identical(other.stop, stop) ||
                const DeepCollectionEquality().equals(other.stop, stop)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stop);

  @override
  $StopEntityCopyWith<StopEntity> get copyWith =>
      _$StopEntityCopyWithImpl<StopEntity>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result leg(Leg leg),
    @required Result stop(Stop stop),
  }) {
    assert(leg != null);
    assert(stop != null);
    return stop(this.stop);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result leg(Leg leg),
    Result stop(Stop stop),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stop != null) {
      return stop(this.stop);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result leg(LegEntity value),
    @required Result stop(StopEntity value),
  }) {
    assert(leg != null);
    assert(stop != null);
    return stop(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result leg(LegEntity value),
    Result stop(StopEntity value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class StopEntity implements LocatedCffEntitiy {
  factory StopEntity(Stop stop) = _$StopEntity;

  Stop get stop;
  $StopEntityCopyWith<StopEntity> get copyWith;
}
