// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineCacheEntry _$LineCacheEntryFromJson(Map<String, dynamic> json) {
  return _LineCacheEntry.fromJson(json);
}

/// @nodoc
class _$LineCacheEntryTearOff {
  const _$LineCacheEntryTearOff();

  _LineCacheEntry call(
      {required DateTime timestamp,
      required String stop,
      required List<Line> lines,
      int ttl = Duration.minutesPerDay * 7}) {
    return _LineCacheEntry(
      timestamp: timestamp,
      stop: stop,
      lines: lines,
      ttl: ttl,
    );
  }

  LineCacheEntry fromJson(Map<String, Object?> json) {
    return LineCacheEntry.fromJson(json);
  }
}

/// @nodoc
const $LineCacheEntry = _$LineCacheEntryTearOff();

/// @nodoc
mixin _$LineCacheEntry {
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get stop => throw _privateConstructorUsedError;
  List<Line> get lines => throw _privateConstructorUsedError;

  /// Time to live for this entry in minutes.
  ///
  /// Defaults to `7 days`.
  int get ttl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineCacheEntryCopyWith<LineCacheEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCacheEntryCopyWith<$Res> {
  factory $LineCacheEntryCopyWith(
          LineCacheEntry value, $Res Function(LineCacheEntry) then) =
      _$LineCacheEntryCopyWithImpl<$Res>;
  $Res call({DateTime timestamp, String stop, List<Line> lines, int ttl});
}

/// @nodoc
class _$LineCacheEntryCopyWithImpl<$Res>
    implements $LineCacheEntryCopyWith<$Res> {
  _$LineCacheEntryCopyWithImpl(this._value, this._then);

  final LineCacheEntry _value;
  // ignore: unused_field
  final $Res Function(LineCacheEntry) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? stop = freezed,
    Object? lines = freezed,
    Object? ttl = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      ttl: ttl == freezed
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LineCacheEntryCopyWith<$Res>
    implements $LineCacheEntryCopyWith<$Res> {
  factory _$LineCacheEntryCopyWith(
          _LineCacheEntry value, $Res Function(_LineCacheEntry) then) =
      __$LineCacheEntryCopyWithImpl<$Res>;
  @override
  $Res call({DateTime timestamp, String stop, List<Line> lines, int ttl});
}

/// @nodoc
class __$LineCacheEntryCopyWithImpl<$Res>
    extends _$LineCacheEntryCopyWithImpl<$Res>
    implements _$LineCacheEntryCopyWith<$Res> {
  __$LineCacheEntryCopyWithImpl(
      _LineCacheEntry _value, $Res Function(_LineCacheEntry) _then)
      : super(_value, (v) => _then(v as _LineCacheEntry));

  @override
  _LineCacheEntry get _value => super._value as _LineCacheEntry;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? stop = freezed,
    Object? lines = freezed,
    Object? ttl = freezed,
  }) {
    return _then(_LineCacheEntry(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      ttl: ttl == freezed
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@LineConverter()
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_LineCacheEntry implements _LineCacheEntry {
  const _$_LineCacheEntry(
      {required this.timestamp,
      required this.stop,
      required this.lines,
      this.ttl = Duration.minutesPerDay * 7});

  factory _$_LineCacheEntry.fromJson(Map<String, dynamic> json) =>
      _$$_LineCacheEntryFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String stop;
  @override
  final List<Line> lines;
  @JsonKey(defaultValue: Duration.minutesPerDay * 7)
  @override

  /// Time to live for this entry in minutes.
  ///
  /// Defaults to `7 days`.
  final int ttl;

  @override
  String toString() {
    return 'LineCacheEntry(timestamp: $timestamp, stop: $stop, lines: $lines, ttl: $ttl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LineCacheEntry &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.stop, stop) || other.stop == stop) &&
            const DeepCollectionEquality().equals(other.lines, lines) &&
            (identical(other.ttl, ttl) || other.ttl == ttl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timestamp, stop,
      const DeepCollectionEquality().hash(lines), ttl);

  @JsonKey(ignore: true)
  @override
  _$LineCacheEntryCopyWith<_LineCacheEntry> get copyWith =>
      __$LineCacheEntryCopyWithImpl<_LineCacheEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineCacheEntryToJson(this);
  }
}

abstract class _LineCacheEntry implements LineCacheEntry {
  const factory _LineCacheEntry(
      {required DateTime timestamp,
      required String stop,
      required List<Line> lines,
      int ttl}) = _$_LineCacheEntry;

  factory _LineCacheEntry.fromJson(Map<String, dynamic> json) =
      _$_LineCacheEntry.fromJson;

  @override
  DateTime get timestamp;
  @override
  String get stop;
  @override
  List<Line> get lines;
  @override

  /// Time to live for this entry in minutes.
  ///
  /// Defaults to `7 days`.
  int get ttl;
  @override
  @JsonKey(ignore: true)
  _$LineCacheEntryCopyWith<_LineCacheEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

/// @nodoc
class _$LineTearOff {
  const _$LineTearOff();

  _Line call(String? line, String colors) {
    return _Line(
      line,
      colors,
    );
  }

  Line fromJson(Map<String, Object?> json) {
    return Line.fromJson(json);
  }
}

/// @nodoc
const $Line = _$LineTearOff();

/// @nodoc
mixin _$Line {
  String? get line => throw _privateConstructorUsedError;
  String get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineCopyWith<Line> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res>;
  $Res call({String? line, String colors});
}

/// @nodoc
class _$LineCopyWithImpl<$Res> implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  final Line _value;
  // ignore: unused_field
  final $Res Function(Line) _then;

  @override
  $Res call({
    Object? line = freezed,
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      colors: colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$LineCopyWith(_Line value, $Res Function(_Line) then) =
      __$LineCopyWithImpl<$Res>;
  @override
  $Res call({String? line, String colors});
}

/// @nodoc
class __$LineCopyWithImpl<$Res> extends _$LineCopyWithImpl<$Res>
    implements _$LineCopyWith<$Res> {
  __$LineCopyWithImpl(_Line _value, $Res Function(_Line) _then)
      : super(_value, (v) => _then(v as _Line));

  @override
  _Line get _value => super._value as _Line;

  @override
  $Res call({
    Object? line = freezed,
    Object? colors = freezed,
  }) {
    return _then(_Line(
      line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      colors == freezed
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Line implements _Line {
  const _$_Line(this.line, this.colors);

  factory _$_Line.fromJson(Map<String, dynamic> json) => _$$_LineFromJson(json);

  @override
  final String? line;
  @override
  final String colors;

  @override
  String toString() {
    return 'Line(line: $line, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Line &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, line, colors);

  @JsonKey(ignore: true)
  @override
  _$LineCopyWith<_Line> get copyWith =>
      __$LineCopyWithImpl<_Line>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineToJson(this);
  }
}

abstract class _Line implements Line {
  const factory _Line(String? line, String colors) = _$_Line;

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  String? get line;
  @override
  String get colors;
  @override
  @JsonKey(ignore: true)
  _$LineCopyWith<_Line> get copyWith => throw _privateConstructorUsedError;
}
