// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchRoute _$SchRouteFromJson(Map<String, dynamic> json) {
  return _SchRoute.fromJson(json);
}

/// @nodoc
mixin _$SchRoute {
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_duration')
  double? get minDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_duration')
  double? get maxDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
  List<SchRouteConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  String? get requestUrl => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchRouteCopyWith<SchRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchRouteCopyWith<$Res> {
  factory $SchRouteCopyWith(SchRoute value, $Res Function(SchRoute) then) =
      _$SchRouteCopyWithImpl<$Res, SchRoute>;
  @useResult
  $Res call(
      {int count,
      @JsonKey(name: 'min_duration') double? minDuration,
      @JsonKey(name: 'max_duration') double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
      List<SchRouteConnection> sbbConnections,
      List<String> messages,
      String? requestUrl,
      DateTime? dateTime});
}

/// @nodoc
class _$SchRouteCopyWithImpl<$Res, $Val extends SchRoute>
    implements $SchRouteCopyWith<$Res> {
  _$SchRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? minDuration = freezed,
    Object? maxDuration = freezed,
    Object? sbbConnections = null,
    Object? messages = null,
    Object? requestUrl = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      minDuration: freezed == minDuration
          ? _value.minDuration
          : minDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDuration: freezed == maxDuration
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbConnections: null == sbbConnections
          ? _value.sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SchRouteConnection>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requestUrl: freezed == requestUrl
          ? _value.requestUrl
          : requestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchRouteImplCopyWith<$Res>
    implements $SchRouteCopyWith<$Res> {
  factory _$$SchRouteImplCopyWith(
          _$SchRouteImpl value, $Res Function(_$SchRouteImpl) then) =
      __$$SchRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      @JsonKey(name: 'min_duration') double? minDuration,
      @JsonKey(name: 'max_duration') double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
      List<SchRouteConnection> sbbConnections,
      List<String> messages,
      String? requestUrl,
      DateTime? dateTime});
}

/// @nodoc
class __$$SchRouteImplCopyWithImpl<$Res>
    extends _$SchRouteCopyWithImpl<$Res, _$SchRouteImpl>
    implements _$$SchRouteImplCopyWith<$Res> {
  __$$SchRouteImplCopyWithImpl(
      _$SchRouteImpl _value, $Res Function(_$SchRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? minDuration = freezed,
    Object? maxDuration = freezed,
    Object? sbbConnections = null,
    Object? messages = null,
    Object? requestUrl = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$SchRouteImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      minDuration: freezed == minDuration
          ? _value.minDuration
          : minDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDuration: freezed == maxDuration
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbConnections: null == sbbConnections
          ? _value._sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SchRouteConnection>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requestUrl: freezed == requestUrl
          ? _value.requestUrl
          : requestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
class _$SchRouteImpl extends _SchRoute {
  const _$SchRouteImpl(
      {this.count = 0,
      @JsonKey(name: 'min_duration') this.minDuration,
      @JsonKey(name: 'max_duration') this.maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
      final List<SchRouteConnection> sbbConnections =
          const <SchRouteConnection>[],
      final List<String> messages = const <String>[],
      this.requestUrl,
      this.dateTime})
      : _sbbConnections = sbbConnections,
        _messages = messages,
        super._();

  factory _$SchRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchRouteImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey(name: 'min_duration')
  final double? minDuration;
  @override
  @JsonKey(name: 'max_duration')
  final double? maxDuration;
  final List<SchRouteConnection> _sbbConnections;
  @override
  @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
  List<SchRouteConnection> get sbbConnections {
    if (_sbbConnections is EqualUnmodifiableListView) return _sbbConnections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sbbConnections);
  }

  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String? requestUrl;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'SchRoute(count: $count, minDuration: $minDuration, maxDuration: $maxDuration, sbbConnections: $sbbConnections, messages: $messages, requestUrl: $requestUrl, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchRouteImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.minDuration, minDuration) ||
                other.minDuration == minDuration) &&
            (identical(other.maxDuration, maxDuration) ||
                other.maxDuration == maxDuration) &&
            const DeepCollectionEquality()
                .equals(other._sbbConnections, _sbbConnections) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.requestUrl, requestUrl) ||
                other.requestUrl == requestUrl) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      minDuration,
      maxDuration,
      const DeepCollectionEquality().hash(_sbbConnections),
      const DeepCollectionEquality().hash(_messages),
      requestUrl,
      dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchRouteImplCopyWith<_$SchRouteImpl> get copyWith =>
      __$$SchRouteImplCopyWithImpl<_$SchRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchRouteImplToJson(
      this,
    );
  }
}

abstract class _SchRoute extends SchRoute {
  const factory _SchRoute(
      {final int count,
      @JsonKey(name: 'min_duration') final double? minDuration,
      @JsonKey(name: 'max_duration') final double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
      final List<SchRouteConnection> sbbConnections,
      final List<String> messages,
      final String? requestUrl,
      final DateTime? dateTime}) = _$SchRouteImpl;
  const _SchRoute._() : super._();

  factory _SchRoute.fromJson(Map<String, dynamic> json) =
      _$SchRouteImpl.fromJson;

  @override
  int get count;
  @override
  @JsonKey(name: 'min_duration')
  double? get minDuration;
  @override
  @JsonKey(name: 'max_duration')
  double? get maxDuration;
  @override
  @JsonKey(name: 'connections', defaultValue: <SchRouteConnection>[])
  List<SchRouteConnection> get sbbConnections;
  @override
  List<String> get messages;
  @override
  String? get requestUrl;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$SchRouteImplCopyWith<_$SchRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
