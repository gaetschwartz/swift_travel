// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineCacheEntry _$LineCacheEntryFromJson(Map<String, dynamic> json) {
  return _LineCacheEntry.fromJson(json);
}

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
      required final List<Line> lines,
      this.ttl = Duration.minutesPerDay * 7})
      : _lines = lines;

  factory _$_LineCacheEntry.fromJson(Map<String, dynamic> json) =>
      _$$_LineCacheEntryFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String stop;
  final List<Line> _lines;
  @override
  List<Line> get lines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  /// Time to live for this entry in minutes.
  ///
  /// Defaults to `7 days`.
  @override
  @JsonKey()
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
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.stop, stop) &&
            const DeepCollectionEquality().equals(other.lines, lines) &&
            const DeepCollectionEquality().equals(other.ttl, ttl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(stop),
      const DeepCollectionEquality().hash(lines),
      const DeepCollectionEquality().hash(ttl));

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
      {required final DateTime timestamp,
      required final String stop,
      required final List<Line> lines,
      final int ttl}) = _$_LineCacheEntry;

  factory _LineCacheEntry.fromJson(Map<String, dynamic> json) =
      _$_LineCacheEntry.fromJson;

  @override
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  String get stop => throw _privateConstructorUsedError;
  @override
  List<Line> get lines => throw _privateConstructorUsedError;
  @override

  /// Time to live for this entry in minutes.
  ///
  /// Defaults to `7 days`.
  int get ttl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LineCacheEntryCopyWith<_LineCacheEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

/// @nodoc
mixin _$Line {
  String? get line => throw _privateConstructorUsedError;
  int? get bgColor => throw _privateConstructorUsedError;
  int? get fgColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineCopyWith<Line> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res>;
  $Res call({String? line, int? bgColor, int? fgColor});
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
    Object? bgColor = freezed,
    Object? fgColor = freezed,
  }) {
    return _then(_value.copyWith(
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      bgColor: bgColor == freezed
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as int?,
      fgColor: fgColor == freezed
          ? _value.fgColor
          : fgColor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$LineCopyWith(_Line value, $Res Function(_Line) then) =
      __$LineCopyWithImpl<$Res>;
  @override
  $Res call({String? line, int? bgColor, int? fgColor});
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
    Object? bgColor = freezed,
    Object? fgColor = freezed,
  }) {
    return _then(_Line(
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      bgColor: bgColor == freezed
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as int?,
      fgColor: fgColor == freezed
          ? _value.fgColor
          : fgColor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Line implements _Line {
  const _$_Line(
      {required this.line, required this.bgColor, required this.fgColor});

  factory _$_Line.fromJson(Map<String, dynamic> json) => _$$_LineFromJson(json);

  @override
  final String? line;
  @override
  final int? bgColor;
  @override
  final int? fgColor;

  @override
  String toString() {
    return 'Line(line: $line, bgColor: $bgColor, fgColor: $fgColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Line &&
            const DeepCollectionEquality().equals(other.line, line) &&
            const DeepCollectionEquality().equals(other.bgColor, bgColor) &&
            const DeepCollectionEquality().equals(other.fgColor, fgColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(line),
      const DeepCollectionEquality().hash(bgColor),
      const DeepCollectionEquality().hash(fgColor));

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
  const factory _Line(
      {required final String? line,
      required final int? bgColor,
      required final int? fgColor}) = _$_Line;

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  String? get line => throw _privateConstructorUsedError;
  @override
  int? get bgColor => throw _privateConstructorUsedError;
  @override
  int? get fgColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LineCopyWith<_Line> get copyWith => throw _privateConstructorUsedError;
}
