// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stationboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbStationboard _$SbbStationboardFromJson(Map<String, dynamic> json) {
  return _SbbStationboard.fromJson(json);
}

/// @nodoc
class _$SbbStationboardTearOff {
  const _$SbbStationboardTearOff();

  _SbbStationboard call(
      {@JsonKey(name: 'stop')
          SbbStop? sbbStop = const SbbStop(''),
      @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
          List<SbbStationboardConnection>
              sbbConnections = const <SbbStationboardConnection>[],
      List<Object> messages = const <Object>[]}) {
    return _SbbStationboard(
      sbbStop: sbbStop,
      sbbConnections: sbbConnections,
      messages: messages,
    );
  }

  SbbStationboard fromJson(Map<String, Object> json) {
    return SbbStationboard.fromJson(json);
  }
}

/// @nodoc
const $SbbStationboard = _$SbbStationboardTearOff();

/// @nodoc
mixin _$SbbStationboard {
  @JsonKey(name: 'stop')
  SbbStop? get sbbStop => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
  List<SbbStationboardConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  List<Object> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbStationboardCopyWith<SbbStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbStationboardCopyWith<$Res> {
  factory $SbbStationboardCopyWith(
          SbbStationboard value, $Res Function(SbbStationboard) then) =
      _$SbbStationboardCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'stop')
          SbbStop? sbbStop,
      @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
          List<SbbStationboardConnection> sbbConnections,
      List<Object> messages});

  $SbbStopCopyWith<$Res>? get sbbStop;
}

/// @nodoc
class _$SbbStationboardCopyWithImpl<$Res>
    implements $SbbStationboardCopyWith<$Res> {
  _$SbbStationboardCopyWithImpl(this._value, this._then);

  final SbbStationboard _value;
  // ignore: unused_field
  final $Res Function(SbbStationboard) _then;

  @override
  $Res call({
    Object? sbbStop = freezed,
    Object? sbbConnections = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      sbbStop: sbbStop == freezed
          ? _value.sbbStop
          : sbbStop // ignore: cast_nullable_to_non_nullable
              as SbbStop?,
      sbbConnections: sbbConnections == freezed
          ? _value.sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SbbStationboardConnection>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }

  @override
  $SbbStopCopyWith<$Res>? get sbbStop {
    if (_value.sbbStop == null) {
      return null;
    }

    return $SbbStopCopyWith<$Res>(_value.sbbStop!, (value) {
      return _then(_value.copyWith(sbbStop: value));
    });
  }
}

/// @nodoc
abstract class _$SbbStationboardCopyWith<$Res>
    implements $SbbStationboardCopyWith<$Res> {
  factory _$SbbStationboardCopyWith(
          _SbbStationboard value, $Res Function(_SbbStationboard) then) =
      __$SbbStationboardCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'stop')
          SbbStop? sbbStop,
      @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
          List<SbbStationboardConnection> sbbConnections,
      List<Object> messages});

  @override
  $SbbStopCopyWith<$Res>? get sbbStop;
}

/// @nodoc
class __$SbbStationboardCopyWithImpl<$Res>
    extends _$SbbStationboardCopyWithImpl<$Res>
    implements _$SbbStationboardCopyWith<$Res> {
  __$SbbStationboardCopyWithImpl(
      _SbbStationboard _value, $Res Function(_SbbStationboard) _then)
      : super(_value, (v) => _then(v as _SbbStationboard));

  @override
  _SbbStationboard get _value => super._value as _SbbStationboard;

  @override
  $Res call({
    Object? sbbStop = freezed,
    Object? sbbConnections = freezed,
    Object? messages = freezed,
  }) {
    return _then(_SbbStationboard(
      sbbStop: sbbStop == freezed
          ? _value.sbbStop
          : sbbStop // ignore: cast_nullable_to_non_nullable
              as SbbStop?,
      sbbConnections: sbbConnections == freezed
          ? _value.sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SbbStationboardConnection>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
class _$_SbbStationboard extends _SbbStationboard {
  const _$_SbbStationboard(
      {@JsonKey(name: 'stop')
          this.sbbStop = const SbbStop(''),
      @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
          this.sbbConnections = const <SbbStationboardConnection>[],
      this.messages = const <Object>[]})
      : super._();

  factory _$_SbbStationboard.fromJson(Map<String, dynamic> json) =>
      _$$_SbbStationboardFromJson(json);

  @override
  @JsonKey(name: 'stop')
  final SbbStop? sbbStop;
  @override
  @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
  final List<SbbStationboardConnection> sbbConnections;
  @JsonKey(defaultValue: const <Object>[])
  @override
  final List<Object> messages;

  @override
  String toString() {
    return 'SbbStationboard(sbbStop: $sbbStop, sbbConnections: $sbbConnections, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbStationboard &&
            (identical(other.sbbStop, sbbStop) ||
                const DeepCollectionEquality()
                    .equals(other.sbbStop, sbbStop)) &&
            (identical(other.sbbConnections, sbbConnections) ||
                const DeepCollectionEquality()
                    .equals(other.sbbConnections, sbbConnections)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sbbStop) ^
      const DeepCollectionEquality().hash(sbbConnections) ^
      const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  _$SbbStationboardCopyWith<_SbbStationboard> get copyWith =>
      __$SbbStationboardCopyWithImpl<_SbbStationboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbStationboardToJson(this);
  }
}

abstract class _SbbStationboard extends SbbStationboard {
  const factory _SbbStationboard(
      {@JsonKey(name: 'stop')
          SbbStop? sbbStop,
      @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
          List<SbbStationboardConnection> sbbConnections,
      List<Object> messages}) = _$_SbbStationboard;
  const _SbbStationboard._() : super._();

  factory _SbbStationboard.fromJson(Map<String, dynamic> json) =
      _$_SbbStationboard.fromJson;

  @override
  @JsonKey(name: 'stop')
  SbbStop? get sbbStop => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
  List<SbbStationboardConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  @override
  List<Object> get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbStationboardCopyWith<_SbbStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}
