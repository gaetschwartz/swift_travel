// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CffRoute _$CffRouteFromJson(Map<String, dynamic> json) {
  return _CffRoute.fromJson(json);
}

/// @nodoc
class _$CffRouteTearOff {
  const _$CffRouteTearOff();

  _CffRoute call(
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
    return _CffRoute(
      count: count,
      minDuration: minDuration,
      maxDuration: maxDuration,
      sbbConnections: sbbConnections,
      messages: messages,
      requestUrl: requestUrl,
      dateTime: dateTime,
    );
  }

  CffRoute fromJson(Map<String, Object> json) {
    return CffRoute.fromJson(json);
  }
}

/// @nodoc
const $CffRoute = _$CffRouteTearOff();

/// @nodoc
mixin _$CffRoute {
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
  $CffRouteCopyWith<CffRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CffRouteCopyWith<$Res> {
  factory $CffRouteCopyWith(CffRoute value, $Res Function(CffRoute) then) =
      _$CffRouteCopyWithImpl<$Res>;
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
class _$CffRouteCopyWithImpl<$Res> implements $CffRouteCopyWith<$Res> {
  _$CffRouteCopyWithImpl(this._value, this._then);

  final CffRoute _value;
  // ignore: unused_field
  final $Res Function(CffRoute) _then;

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
abstract class _$CffRouteCopyWith<$Res> implements $CffRouteCopyWith<$Res> {
  factory _$CffRouteCopyWith(_CffRoute value, $Res Function(_CffRoute) then) =
      __$CffRouteCopyWithImpl<$Res>;
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
class __$CffRouteCopyWithImpl<$Res> extends _$CffRouteCopyWithImpl<$Res>
    implements _$CffRouteCopyWith<$Res> {
  __$CffRouteCopyWithImpl(_CffRoute _value, $Res Function(_CffRoute) _then)
      : super(_value, (v) => _then(v as _CffRoute));

  @override
  _CffRoute get _value => super._value as _CffRoute;

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
    return _then(_CffRoute(
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

@JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)

/// @nodoc
class _$_CffRoute extends _CffRoute {
  const _$_CffRoute(
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

  factory _$_CffRoute.fromJson(Map<String, dynamic> json) =>
      _$_$_CffRouteFromJson(json);

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
    return 'CffRoute(count: $count, minDuration: $minDuration, maxDuration: $maxDuration, sbbConnections: $sbbConnections, messages: $messages, requestUrl: $requestUrl, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CffRoute &&
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
  _$CffRouteCopyWith<_CffRoute> get copyWith =>
      __$CffRouteCopyWithImpl<_CffRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CffRouteToJson(this);
  }
}

abstract class _CffRoute extends CffRoute {
  const factory _CffRoute(
      {int count,
      @JsonKey(name: 'min_duration')
          double? minDuration,
      @JsonKey(name: 'max_duration')
          double? maxDuration,
      @JsonKey(name: 'connections', defaultValue: <SbbRouteConnection>[])
          List<SbbRouteConnection> sbbConnections,
      List<String> messages,
      String? requestUrl,
      DateTime? dateTime}) = _$_CffRoute;
  const _CffRoute._() : super._();

  factory _CffRoute.fromJson(Map<String, dynamic> json) = _$_CffRoute.fromJson;

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
  _$CffRouteCopyWith<_CffRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
