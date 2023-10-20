// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stationboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchStationboard _$SchStationboardFromJson(Map<String, dynamic> json) {
  return _SchStationboard.fromJson(json);
}

/// @nodoc
mixin _$SchStationboard {
  @JsonKey(name: 'stop')
  SchStop? get sbbStop => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
  List<SchStationboardConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  List<Object> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchStationboardCopyWith<SchStationboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchStationboardCopyWith<$Res> {
  factory $SchStationboardCopyWith(
          SchStationboard value, $Res Function(SchStationboard) then) =
      _$SchStationboardCopyWithImpl<$Res, SchStationboard>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stop') SchStop? sbbStop,
      @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
      List<SchStationboardConnection> sbbConnections,
      List<Object> messages});

  $SchStopCopyWith<$Res>? get sbbStop;
}

/// @nodoc
class _$SchStationboardCopyWithImpl<$Res, $Val extends SchStationboard>
    implements $SchStationboardCopyWith<$Res> {
  _$SchStationboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sbbStop = freezed,
    Object? sbbConnections = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      sbbStop: freezed == sbbStop
          ? _value.sbbStop
          : sbbStop // ignore: cast_nullable_to_non_nullable
              as SchStop?,
      sbbConnections: null == sbbConnections
          ? _value.sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SchStationboardConnection>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchStopCopyWith<$Res>? get sbbStop {
    if (_value.sbbStop == null) {
      return null;
    }

    return $SchStopCopyWith<$Res>(_value.sbbStop!, (value) {
      return _then(_value.copyWith(sbbStop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SchStationboardImplCopyWith<$Res>
    implements $SchStationboardCopyWith<$Res> {
  factory _$$SchStationboardImplCopyWith(_$SchStationboardImpl value,
          $Res Function(_$SchStationboardImpl) then) =
      __$$SchStationboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stop') SchStop? sbbStop,
      @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
      List<SchStationboardConnection> sbbConnections,
      List<Object> messages});

  @override
  $SchStopCopyWith<$Res>? get sbbStop;
}

/// @nodoc
class __$$SchStationboardImplCopyWithImpl<$Res>
    extends _$SchStationboardCopyWithImpl<$Res, _$SchStationboardImpl>
    implements _$$SchStationboardImplCopyWith<$Res> {
  __$$SchStationboardImplCopyWithImpl(
      _$SchStationboardImpl _value, $Res Function(_$SchStationboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sbbStop = freezed,
    Object? sbbConnections = null,
    Object? messages = null,
  }) {
    return _then(_$SchStationboardImpl(
      sbbStop: freezed == sbbStop
          ? _value.sbbStop
          : sbbStop // ignore: cast_nullable_to_non_nullable
              as SchStop?,
      sbbConnections: null == sbbConnections
          ? _value._sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SchStationboardConnection>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Object>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
class _$SchStationboardImpl extends _SchStationboard {
  const _$SchStationboardImpl(
      {@JsonKey(name: 'stop') this.sbbStop = const SchStop(sbbName: ''),
      @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
      final List<SchStationboardConnection> sbbConnections =
          const <SchStationboardConnection>[],
      final List<Object> messages = const <Object>[]})
      : _sbbConnections = sbbConnections,
        _messages = messages,
        super._();

  factory _$SchStationboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchStationboardImplFromJson(json);

  @override
  @JsonKey(name: 'stop')
  final SchStop? sbbStop;
  final List<SchStationboardConnection> _sbbConnections;
  @override
  @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
  List<SchStationboardConnection> get sbbConnections {
    if (_sbbConnections is EqualUnmodifiableListView) return _sbbConnections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sbbConnections);
  }

  final List<Object> _messages;
  @override
  @JsonKey()
  List<Object> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'SchStationboard(sbbStop: $sbbStop, sbbConnections: $sbbConnections, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchStationboardImpl &&
            (identical(other.sbbStop, sbbStop) || other.sbbStop == sbbStop) &&
            const DeepCollectionEquality()
                .equals(other._sbbConnections, _sbbConnections) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sbbStop,
      const DeepCollectionEquality().hash(_sbbConnections),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchStationboardImplCopyWith<_$SchStationboardImpl> get copyWith =>
      __$$SchStationboardImplCopyWithImpl<_$SchStationboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchStationboardImplToJson(
      this,
    );
  }
}

abstract class _SchStationboard extends SchStationboard {
  const factory _SchStationboard(
      {@JsonKey(name: 'stop') final SchStop? sbbStop,
      @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
      final List<SchStationboardConnection> sbbConnections,
      final List<Object> messages}) = _$SchStationboardImpl;
  const _SchStationboard._() : super._();

  factory _SchStationboard.fromJson(Map<String, dynamic> json) =
      _$SchStationboardImpl.fromJson;

  @override
  @JsonKey(name: 'stop')
  SchStop? get sbbStop;
  @override
  @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
  List<SchStationboardConnection> get sbbConnections;
  @override
  List<Object> get messages;
  @override
  @JsonKey(ignore: true)
  _$$SchStationboardImplCopyWith<_$SchStationboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
