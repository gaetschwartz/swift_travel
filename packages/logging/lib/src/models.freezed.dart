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
abstract class _$$_LogMessageCopyWith<$Res>
    implements $LogMessageCopyWith<$Res> {
  factory _$$_LogMessageCopyWith(
          _$_LogMessage value, $Res Function(_$_LogMessage) then) =
      __$$_LogMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message, LogLevel level, DateTime timestamp, String? channel});

  @override
  $LogLevelCopyWith<$Res> get level;
}

/// @nodoc
class __$$_LogMessageCopyWithImpl<$Res> extends _$LogMessageCopyWithImpl<$Res>
    implements _$$_LogMessageCopyWith<$Res> {
  __$$_LogMessageCopyWithImpl(
      _$_LogMessage _value, $Res Function(_$_LogMessage) _then)
      : super(_value, (v) => _then(v as _$_LogMessage));

  @override
  _$_LogMessage get _value => super._value as _$_LogMessage;

  @override
  $Res call({
    Object? message = freezed,
    Object? level = freezed,
    Object? timestamp = freezed,
    Object? channel = freezed,
  }) {
    return _then(_$_LogMessage(
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
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.channel, channel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(channel));

  @JsonKey(ignore: true)
  @override
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
abstract class _$$_LogLevelCopyWith<$Res> implements $LogLevelCopyWith<$Res> {
  factory _$$_LogLevelCopyWith(
          _$_LogLevel value, $Res Function(_$_LogLevel) then) =
      __$$_LogLevelCopyWithImpl<$Res>;
  @override
  $Res call({int level, Sentiment sentiment, String name});
}

/// @nodoc
class __$$_LogLevelCopyWithImpl<$Res> extends _$LogLevelCopyWithImpl<$Res>
    implements _$$_LogLevelCopyWith<$Res> {
  __$$_LogLevelCopyWithImpl(
      _$_LogLevel _value, $Res Function(_$_LogLevel) _then)
      : super(_value, (v) => _then(v as _$_LogLevel));

  @override
  _$_LogLevel get _value => super._value as _$_LogLevel;

  @override
  $Res call({
    Object? level = freezed,
    Object? sentiment = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_LogLevel(
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
        (other.runtimeType == runtimeType &&
            other is _$_LogLevel &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.sentiment, sentiment) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(sentiment),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
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
