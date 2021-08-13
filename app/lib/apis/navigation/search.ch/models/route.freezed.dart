// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbRoute _$SbbRouteFromJson(Map<String, dynamic> json) {
  return _SbbRoute.fromJson(json);
}

/// @nodoc
class _$SbbRouteTearOff {
  const _$SbbRouteTearOff();

  _SbbRoute call(
      {int count = 0,
      @JsonKey(name: 'min_duration')
          double? minDuration,
      @JsonKey(name: 'max_duration')
          double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          List<SbbRouteConnection>
              sbbConnections = const <SbbRouteConnection>[],
      List<String> messages = const <String>[],
      String? requestUrl,
      DateTime? dateTime}) {
    return _SbbRoute(
      count: count,
      minDuration: minDuration,
      maxDuration: maxDuration,
      sbbConnections: sbbConnections,
      messages: messages,
      requestUrl: requestUrl,
      dateTime: dateTime,
    );
  }

  SbbRoute fromJson(Map<String, Object> json) {
    return SbbRoute.fromJson(json);
  }
}

/// @nodoc
const $SbbRoute = _$SbbRouteTearOff();

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
      _$SbbRouteCopyWithImpl<$Res>;
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
class _$SbbRouteCopyWithImpl<$Res> implements $SbbRouteCopyWith<$Res> {
  _$SbbRouteCopyWithImpl(this._value, this._then);

  final SbbRoute _value;
  // ignore: unused_field
  final $Res Function(SbbRoute) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? minDuration = freezed,
    Object? maxDuration = freezed,
    Object? sbbConnections = freezed,
    Object? messages = freezed,
    Object? requestUrl = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      minDuration: minDuration == freezed
          ? _value.minDuration
          : minDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDuration: maxDuration == freezed
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbConnections: sbbConnections == freezed
          ? _value.sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SbbRouteConnection>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requestUrl: requestUrl == freezed
          ? _value.requestUrl
          : requestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$SbbRouteCopyWith<$Res> implements $SbbRouteCopyWith<$Res> {
  factory _$SbbRouteCopyWith(_SbbRoute value, $Res Function(_SbbRoute) then) =
      __$SbbRouteCopyWithImpl<$Res>;
  @override
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
class __$SbbRouteCopyWithImpl<$Res> extends _$SbbRouteCopyWithImpl<$Res>
    implements _$SbbRouteCopyWith<$Res> {
  __$SbbRouteCopyWithImpl(_SbbRoute _value, $Res Function(_SbbRoute) _then)
      : super(_value, (v) => _then(v as _SbbRoute));

  @override
  _SbbRoute get _value => super._value as _SbbRoute;

  @override
  $Res call({
    Object? count = freezed,
    Object? minDuration = freezed,
    Object? maxDuration = freezed,
    Object? sbbConnections = freezed,
    Object? messages = freezed,
    Object? requestUrl = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_SbbRoute(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      minDuration: minDuration == freezed
          ? _value.minDuration
          : minDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDuration: maxDuration == freezed
          ? _value.maxDuration
          : maxDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      sbbConnections: sbbConnections == freezed
          ? _value.sbbConnections
          : sbbConnections // ignore: cast_nullable_to_non_nullable
              as List<SbbRouteConnection>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      requestUrl: requestUrl == freezed
          ? _value.requestUrl
          : requestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
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
          this.sbbConnections = const <SbbRouteConnection>[],
      this.messages = const <String>[],
      this.requestUrl,
      this.dateTime})
      : super._();

  factory _$_SbbRoute.fromJson(Map<String, dynamic> json) =>
      _$$_SbbRouteFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int count;
  @override
  @JsonKey(name: 'min_duration')
  final double? minDuration;
  @override
  @JsonKey(name: 'max_duration')
  final double? maxDuration;
  @override
  @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
  final List<SbbRouteConnection> sbbConnections;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> messages;
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
        (other is _SbbRoute &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.minDuration, minDuration) ||
                const DeepCollectionEquality()
                    .equals(other.minDuration, minDuration)) &&
            (identical(other.maxDuration, maxDuration) ||
                const DeepCollectionEquality()
                    .equals(other.maxDuration, maxDuration)) &&
            (identical(other.sbbConnections, sbbConnections) ||
                const DeepCollectionEquality()
                    .equals(other.sbbConnections, sbbConnections)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)) &&
            (identical(other.requestUrl, requestUrl) ||
                const DeepCollectionEquality()
                    .equals(other.requestUrl, requestUrl)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(minDuration) ^
      const DeepCollectionEquality().hash(maxDuration) ^
      const DeepCollectionEquality().hash(sbbConnections) ^
      const DeepCollectionEquality().hash(messages) ^
      const DeepCollectionEquality().hash(requestUrl) ^
      const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  _$SbbRouteCopyWith<_SbbRoute> get copyWith =>
      __$SbbRouteCopyWithImpl<_SbbRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbRouteToJson(this);
  }
}

abstract class _SbbRoute extends SbbRoute {
  const factory _SbbRoute(
      {int count,
      @JsonKey(name: 'min_duration')
          double? minDuration,
      @JsonKey(name: 'max_duration')
          double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          List<SbbRouteConnection> sbbConnections,
      List<String> messages,
      String? requestUrl,
      DateTime? dateTime}) = _$_SbbRoute;
  const _SbbRoute._() : super._();

  factory _SbbRoute.fromJson(Map<String, dynamic> json) = _$_SbbRoute.fromJson;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'min_duration')
  double? get minDuration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'max_duration')
  double? get maxDuration => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
  List<SbbRouteConnection> get sbbConnections =>
      throw _privateConstructorUsedError;
  @override
  List<String> get messages => throw _privateConstructorUsedError;
  @override
  String? get requestUrl => throw _privateConstructorUsedError;
  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbRouteCopyWith<_SbbRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
