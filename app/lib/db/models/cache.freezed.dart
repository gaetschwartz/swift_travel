// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$LineCacheEntryCopyWithImpl<$Res, LineCacheEntry>;
  @useResult
  $Res call({DateTime timestamp, String stop, List<Line> lines, int ttl});
}

/// @nodoc
class _$LineCacheEntryCopyWithImpl<$Res, $Val extends LineCacheEntry>
    implements $LineCacheEntryCopyWith<$Res> {
  _$LineCacheEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? stop = null,
    Object? lines = null,
    Object? ttl = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      ttl: null == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LineCacheEntryImplCopyWith<$Res>
    implements $LineCacheEntryCopyWith<$Res> {
  factory _$$LineCacheEntryImplCopyWith(_$LineCacheEntryImpl value,
          $Res Function(_$LineCacheEntryImpl) then) =
      __$$LineCacheEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, String stop, List<Line> lines, int ttl});
}

/// @nodoc
class __$$LineCacheEntryImplCopyWithImpl<$Res>
    extends _$LineCacheEntryCopyWithImpl<$Res, _$LineCacheEntryImpl>
    implements _$$LineCacheEntryImplCopyWith<$Res> {
  __$$LineCacheEntryImplCopyWithImpl(
      _$LineCacheEntryImpl _value, $Res Function(_$LineCacheEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? stop = null,
    Object? lines = null,
    Object? ttl = null,
  }) {
    return _then(_$LineCacheEntryImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>,
      ttl: null == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@LineConverter()
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$LineCacheEntryImpl implements _LineCacheEntry {
  const _$LineCacheEntryImpl(
      {required this.timestamp,
      required this.stop,
      required final List<Line> lines,
      this.ttl = Duration.minutesPerDay * 7})
      : _lines = lines;

  factory _$LineCacheEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineCacheEntryImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String stop;
  final List<Line> _lines;
  @override
  List<Line> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
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
            other is _$LineCacheEntryImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.stop, stop) || other.stop == stop) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.ttl, ttl) || other.ttl == ttl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, stop,
      const DeepCollectionEquality().hash(_lines), ttl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineCacheEntryImplCopyWith<_$LineCacheEntryImpl> get copyWith =>
      __$$LineCacheEntryImplCopyWithImpl<_$LineCacheEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineCacheEntryImplToJson(
      this,
    );
  }
}

abstract class _LineCacheEntry implements LineCacheEntry {
  const factory _LineCacheEntry(
      {required final DateTime timestamp,
      required final String stop,
      required final List<Line> lines,
      final int ttl}) = _$LineCacheEntryImpl;

  factory _LineCacheEntry.fromJson(Map<String, dynamic> json) =
      _$LineCacheEntryImpl.fromJson;

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
  _$$LineCacheEntryImplCopyWith<_$LineCacheEntryImpl> get copyWith =>
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
      _$LineCopyWithImpl<$Res, Line>;
  @useResult
  $Res call({String? line, int? bgColor, int? fgColor});
}

/// @nodoc
class _$LineCopyWithImpl<$Res, $Val extends Line>
    implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = freezed,
    Object? bgColor = freezed,
    Object? fgColor = freezed,
  }) {
    return _then(_value.copyWith(
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      bgColor: freezed == bgColor
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as int?,
      fgColor: freezed == fgColor
          ? _value.fgColor
          : fgColor // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LineImplCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$$LineImplCopyWith(
          _$LineImpl value, $Res Function(_$LineImpl) then) =
      __$$LineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? line, int? bgColor, int? fgColor});
}

/// @nodoc
class __$$LineImplCopyWithImpl<$Res>
    extends _$LineCopyWithImpl<$Res, _$LineImpl>
    implements _$$LineImplCopyWith<$Res> {
  __$$LineImplCopyWithImpl(_$LineImpl _value, $Res Function(_$LineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = freezed,
    Object? bgColor = freezed,
    Object? fgColor = freezed,
  }) {
    return _then(_$LineImpl(
      line: freezed == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String?,
      bgColor: freezed == bgColor
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as int?,
      fgColor: freezed == fgColor
          ? _value.fgColor
          : fgColor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineImpl implements _Line {
  const _$LineImpl(
      {required this.line, required this.bgColor, required this.fgColor});

  factory _$LineImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineImplFromJson(json);

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
            other is _$LineImpl &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.bgColor, bgColor) || other.bgColor == bgColor) &&
            (identical(other.fgColor, fgColor) || other.fgColor == fgColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, line, bgColor, fgColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineImplCopyWith<_$LineImpl> get copyWith =>
      __$$LineImplCopyWithImpl<_$LineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineImplToJson(
      this,
    );
  }
}

abstract class _Line implements Line {
  const factory _Line(
      {required final String? line,
      required final int? bgColor,
      required final int? fgColor}) = _$LineImpl;

  factory _Line.fromJson(Map<String, dynamic> json) = _$LineImpl.fromJson;

  @override
  String? get line;
  @override
  int? get bgColor;
  @override
  int? get fgColor;
  @override
  @JsonKey(ignore: true)
  _$$LineImplCopyWith<_$LineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
