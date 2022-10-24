// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogMessage {
  String get message => throw _privateConstructorUsedError;
  LogLevel get level => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get channel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogMessageCopyWith<LogMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogMessageCopyWith<$Res> {
  factory $LogMessageCopyWith(
          LogMessage value, $Res Function(LogMessage) then) =
      _$LogMessageCopyWithImpl<$Res, LogMessage>;
  @useResult
  $Res call(
      {String message, LogLevel level, DateTime timestamp, String? channel});

  $LogLevelCopyWith<$Res> get level;
}

/// @nodoc
class _$LogMessageCopyWithImpl<$Res, $Val extends LogMessage>
    implements $LogMessageCopyWith<$Res> {
  _$LogMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? level = null,
    Object? timestamp = null,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LogLevelCopyWith<$Res> get level {
    return $LogLevelCopyWith<$Res>(_value.level, (value) {
      return _then(_value.copyWith(level: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LogMessageCopyWith<$Res>
    implements $LogMessageCopyWith<$Res> {
  factory _$$_LogMessageCopyWith(
          _$_LogMessage value, $Res Function(_$_LogMessage) then) =
      __$$_LogMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, LogLevel level, DateTime timestamp, String? channel});

  @override
  $LogLevelCopyWith<$Res> get level;
}

/// @nodoc
class __$$_LogMessageCopyWithImpl<$Res>
    extends _$LogMessageCopyWithImpl<$Res, _$_LogMessage>
    implements _$$_LogMessageCopyWith<$Res> {
  __$$_LogMessageCopyWithImpl(
      _$_LogMessage _value, $Res Function(_$_LogMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? level = null,
    Object? timestamp = null,
    Object? channel = freezed,
  }) {
    return _then(_$_LogMessage(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LogMessage implements _LogMessage {
  const _$_LogMessage(
      {required this.message,
      this.level = LogLevel.info,
      required this.timestamp,
      this.channel});

  @override
  final String message;
  @override
  @JsonKey()
  final LogLevel level;
  @override
  final DateTime timestamp;
  @override
  final String? channel;

  @override
  String toString() {
    return 'LogMessage(message: $message, level: $level, timestamp: $timestamp, channel: $channel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogMessage &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, level, timestamp, channel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogMessageCopyWith<_$_LogMessage> get copyWith =>
      __$$_LogMessageCopyWithImpl<_$_LogMessage>(this, _$identity);
}

abstract class _LogMessage implements LogMessage {
  const factory _LogMessage(
      {required final String message,
      final LogLevel level,
      required final DateTime timestamp,
      final String? channel}) = _$_LogMessage;

  @override
  String get message;
  @override
  LogLevel get level;
  @override
  DateTime get timestamp;
  @override
  String? get channel;
  @override
  @JsonKey(ignore: true)
  _$$_LogMessageCopyWith<_$_LogMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LogLevel {
  int get level => throw _privateConstructorUsedError;
  Sentiment get sentiment => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogLevelCopyWith<LogLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogLevelCopyWith<$Res> {
  factory $LogLevelCopyWith(LogLevel value, $Res Function(LogLevel) then) =
      _$LogLevelCopyWithImpl<$Res, LogLevel>;
  @useResult
  $Res call({int level, Sentiment sentiment, String name});
}

/// @nodoc
class _$LogLevelCopyWithImpl<$Res, $Val extends LogLevel>
    implements $LogLevelCopyWith<$Res> {
  _$LogLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? sentiment = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as Sentiment,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LogLevelCopyWith<$Res> implements $LogLevelCopyWith<$Res> {
  factory _$$_LogLevelCopyWith(
          _$_LogLevel value, $Res Function(_$_LogLevel) then) =
      __$$_LogLevelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, Sentiment sentiment, String name});
}

/// @nodoc
class __$$_LogLevelCopyWithImpl<$Res>
    extends _$LogLevelCopyWithImpl<$Res, _$_LogLevel>
    implements _$$_LogLevelCopyWith<$Res> {
  __$$_LogLevelCopyWithImpl(
      _$_LogLevel _value, $Res Function(_$_LogLevel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? sentiment = null,
    Object? name = null,
  }) {
    return _then(_$_LogLevel(
      null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as Sentiment,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LogLevel implements _LogLevel {
  const _$_LogLevel(this.level, this.sentiment, this.name);

  @override
  final int level;
  @override
  final Sentiment sentiment;
  @override
  final String name;

  @override
  String toString() {
    return 'LogLevel._(level: $level, sentiment: $sentiment, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogLevel &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, sentiment, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogLevelCopyWith<_$_LogLevel> get copyWith =>
      __$$_LogLevelCopyWithImpl<_$_LogLevel>(this, _$identity);
}

abstract class _LogLevel implements LogLevel {
  const factory _LogLevel(
          final int level, final Sentiment sentiment, final String name) =
      _$_LogLevel;

  @override
  int get level;
  @override
  Sentiment get sentiment;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_LogLevelCopyWith<_$_LogLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
