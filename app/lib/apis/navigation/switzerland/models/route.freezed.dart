// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbRoute _$SbbRouteFromJson(Map<String, dynamic> json) {
  return _SbbRoute.fromJson(json);
}

/// @nodoc
mixin _$SbbRoute {
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_duration')
  double? get minDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_duration')
  double? get maxDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
  List<SbbRouteConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  String? get requestUrl => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbRouteCopyWith<SbbRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbRouteCopyWith<$Res> {
  factory $SbbRouteCopyWith(SbbRoute value, $Res Function(SbbRoute) then) =
      _$SbbRouteCopyWithImpl<$Res, SbbRoute>;
  @useResult
  $Res call(
      {int count,
      @JsonKey(name: 'min_duration')
          double? minDuration,
      @JsonKey(name: 'max_duration')
          double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          List<SbbRouteConnection> sbbConnections,
      List<String> messages,
      String? requestUrl,
      DateTime? dateTime});
}

/// @nodoc
class _$SbbRouteCopyWithImpl<$Res, $Val extends SbbRoute>
    implements $SbbRouteCopyWith<$Res> {
  _$SbbRouteCopyWithImpl(this._value, this._then);

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
              as List<SbbRouteConnection>,
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
abstract class _$$_SbbRouteCopyWith<$Res> implements $SbbRouteCopyWith<$Res> {
  factory _$$_SbbRouteCopyWith(
          _$_SbbRoute value, $Res Function(_$_SbbRoute) then) =
      __$$_SbbRouteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      @JsonKey(name: 'min_duration')
          double? minDuration,
      @JsonKey(name: 'max_duration')
          double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          List<SbbRouteConnection> sbbConnections,
      List<String> messages,
      String? requestUrl,
      DateTime? dateTime});
}

/// @nodoc
class __$$_SbbRouteCopyWithImpl<$Res>
    extends _$SbbRouteCopyWithImpl<$Res, _$_SbbRoute>
    implements _$$_SbbRouteCopyWith<$Res> {
  __$$_SbbRouteCopyWithImpl(
      _$_SbbRoute _value, $Res Function(_$_SbbRoute) _then)
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
    return _then(_$_SbbRoute(
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
              as List<SbbRouteConnection>,
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
class _$_SbbRoute extends _SbbRoute {
  const _$_SbbRoute(
      {this.count = 0,
      @JsonKey(name: 'min_duration')
          this.minDuration,
      @JsonKey(name: 'max_duration')
          this.maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          final List<SbbRouteConnection>
              sbbConnections = const <SbbRouteConnection>[],
      final List<String> messages = const <String>[],
      this.requestUrl,
      this.dateTime})
      : _sbbConnections = sbbConnections,
        _messages = messages,
        super._();

  factory _$_SbbRoute.fromJson(Map<String, dynamic> json) =>
      _$$_SbbRouteFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey(name: 'min_duration')
  final double? minDuration;
  @override
  @JsonKey(name: 'max_duration')
  final double? maxDuration;
  final List<SbbRouteConnection> _sbbConnections;
  @override
  @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
  List<SbbRouteConnection> get sbbConnections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sbbConnections);
  }

  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String? requestUrl;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'SbbRoute(count: $count, minDuration: $minDuration, maxDuration: $maxDuration, sbbConnections: $sbbConnections, messages: $messages, requestUrl: $requestUrl, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SbbRoute &&
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
  _$$_SbbRouteCopyWith<_$_SbbRoute> get copyWith =>
      __$$_SbbRouteCopyWithImpl<_$_SbbRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbRouteToJson(
      this,
    );
  }
}

abstract class _SbbRoute extends SbbRoute {
  const factory _SbbRoute(
      {final int count,
      @JsonKey(name: 'min_duration')
          final double? minDuration,
      @JsonKey(name: 'max_duration')
          final double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          final List<SbbRouteConnection> sbbConnections,
      final List<String> messages,
      final String? requestUrl,
      final DateTime? dateTime}) = _$_SbbRoute;
  const _SbbRoute._() : super._();

  factory _SbbRoute.fromJson(Map<String, dynamic> json) = _$_SbbRoute.fromJson;

  @override
  int get count;
  @override
  @JsonKey(name: 'min_duration')
  double? get minDuration;
  @override
  @JsonKey(name: 'max_duration')
  double? get maxDuration;
  @override
  @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
  List<SbbRouteConnection> get sbbConnections;
  @override
  List<String> get messages;
  @override
  String? get requestUrl;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_SbbRouteCopyWith<_$_SbbRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
