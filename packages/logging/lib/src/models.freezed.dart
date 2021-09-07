// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LogMessageTearOff {
  const _$LogMessageTearOff();

  _LogMessage call(
      {required String message,
      LogLevel level = LogLevel.info,
      required DateTime timestamp,
      String? channel}) {
    return _LogMessage(
      message: message,
      level: level,
      timestamp: timestamp,
      channel: channel,
    );
  }
}

/// @nodoc
const $LogMessage = _$LogMessageTearOff();

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
      _$LogMessageCopyWithImpl<$Res>;
  $Res call(
      {String message, LogLevel level, DateTime timestamp, String? channel});

  $LogLevelCopyWith<$Res> get level;
}

/// @nodoc
class _$LogMessageCopyWithImpl<$Res> implements $LogMessageCopyWith<$Res> {
  _$LogMessageCopyWithImpl(this._value, this._then);

  final LogMessage _value;
  // ignore: unused_field
  final $Res Function(LogMessage) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? level = freezed,
    Object? timestamp = freezed,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $LogLevelCopyWith<$Res> get level {
    return $LogLevelCopyWith<$Res>(_value.level, (value) {
      return _then(_value.copyWith(level: value));
    });
  }
}

/// @nodoc
abstract class _$LogMessageCopyWith<$Res> implements $LogMessageCopyWith<$Res> {
  factory _$LogMessageCopyWith(
          _LogMessage value, $Res Function(_LogMessage) then) =
      __$LogMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, LogLevel level, DateTime timestamp, String? channel});

  @override
  $LogLevelCopyWith<$Res> get level;
}

/// @nodoc
class __$LogMessageCopyWithImpl<$Res> extends _$LogMessageCopyWithImpl<$Res>
    implements _$LogMessageCopyWith<$Res> {
  __$LogMessageCopyWithImpl(
      _LogMessage _value, $Res Function(_LogMessage) _then)
      : super(_value, (v) => _then(v as _LogMessage));

  @override
  _LogMessage get _value => super._value as _LogMessage;

  @override
  $Res call({
    Object? message = freezed,
    Object? level = freezed,
    Object? timestamp = freezed,
    Object? channel = freezed,
  }) {
    return _then(_LogMessage(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channel: channel == freezed
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
  @JsonKey(defaultValue: LogLevel.info)
  @override
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
        (other is _LogMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality().equals(other.channel, channel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(channel);

  @JsonKey(ignore: true)
  @override
  _$LogMessageCopyWith<_LogMessage> get copyWith =>
      __$LogMessageCopyWithImpl<_LogMessage>(this, _$identity);
}

abstract class _LogMessage implements LogMessage {
  const factory _LogMessage(
      {required String message,
      LogLevel level,
      required DateTime timestamp,
      String? channel}) = _$_LogMessage;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  LogLevel get level => throw _privateConstructorUsedError;
  @override
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  String? get channel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LogMessageCopyWith<_LogMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LogLevelTearOff {
  const _$LogLevelTearOff();

  _LogLevel _(int level, Sentiment sentiment, String name) {
    return _LogLevel(
      level,
      sentiment,
      name,
    );
  }
}

/// @nodoc
const $LogLevel = _$LogLevelTearOff();

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
      _$LogLevelCopyWithImpl<$Res>;
  $Res call({int level, Sentiment sentiment, String name});
}

/// @nodoc
class _$LogLevelCopyWithImpl<$Res> implements $LogLevelCopyWith<$Res> {
  _$LogLevelCopyWithImpl(this._value, this._then);

  final LogLevel _value;
  // ignore: unused_field
  final $Res Function(LogLevel) _then;

  @override
  $Res call({
    Object? level = freezed,
    Object? sentiment = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      sentiment: sentiment == freezed
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as Sentiment,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LogLevelCopyWith<$Res> implements $LogLevelCopyWith<$Res> {
  factory _$LogLevelCopyWith(_LogLevel value, $Res Function(_LogLevel) then) =
      __$LogLevelCopyWithImpl<$Res>;
  @override
  $Res call({int level, Sentiment sentiment, String name});
}

/// @nodoc
class __$LogLevelCopyWithImpl<$Res> extends _$LogLevelCopyWithImpl<$Res>
    implements _$LogLevelCopyWith<$Res> {
  __$LogLevelCopyWithImpl(_LogLevel _value, $Res Function(_LogLevel) _then)
      : super(_value, (v) => _then(v as _LogLevel));

  @override
  _LogLevel get _value => super._value as _LogLevel;

  @override
  $Res call({
    Object? level = freezed,
    Object? sentiment = freezed,
    Object? name = freezed,
  }) {
    return _then(_LogLevel(
      level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      sentiment == freezed
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as Sentiment,
      name == freezed
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
        (other is _LogLevel &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.sentiment, sentiment) ||
                const DeepCollectionEquality()
                    .equals(other.sentiment, sentiment)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(sentiment) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$LogLevelCopyWith<_LogLevel> get copyWith =>
      __$LogLevelCopyWithImpl<_LogLevel>(this, _$identity);
}

abstract class _LogLevel implements LogLevel {
  const factory _LogLevel(int level, Sentiment sentiment, String name) =
      _$_LogLevel;

  @override
  int get level => throw _privateConstructorUsedError;
  @override
  Sentiment get sentiment => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LogLevelCopyWith<_LogLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
