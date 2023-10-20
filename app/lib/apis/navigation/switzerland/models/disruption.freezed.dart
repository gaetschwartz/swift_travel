// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disruption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Disruption _$DisruptionFromJson(Map<String, dynamic> json) {
  return _Disruption.fromJson(json);
}

/// @nodoc
mixin _$Disruption {
  String? get id => throw _privateConstructorUsedError;
  String? get header => throw _privateConstructorUsedError;
  String? get lead => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'timerange')
  String? get timeRange => throw _privateConstructorUsedError;
  bool? get exact => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisruptionCopyWith<Disruption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisruptionCopyWith<$Res> {
  factory $DisruptionCopyWith(
          Disruption value, $Res Function(Disruption) then) =
      _$DisruptionCopyWithImpl<$Res, Disruption>;
  @useResult
  $Res call(
      {String? id,
      String? header,
      String? lead,
      String? text,
      @JsonKey(name: 'timerange') String? timeRange,
      bool? exact,
      int? priority});
}

/// @nodoc
class _$DisruptionCopyWithImpl<$Res, $Val extends Disruption>
    implements $DisruptionCopyWith<$Res> {
  _$DisruptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? header = freezed,
    Object? lead = freezed,
    Object? text = freezed,
    Object? timeRange = freezed,
    Object? exact = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as String?,
      exact: freezed == exact
          ? _value.exact
          : exact // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisruptionImplCopyWith<$Res>
    implements $DisruptionCopyWith<$Res> {
  factory _$$DisruptionImplCopyWith(
          _$DisruptionImpl value, $Res Function(_$DisruptionImpl) then) =
      __$$DisruptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? header,
      String? lead,
      String? text,
      @JsonKey(name: 'timerange') String? timeRange,
      bool? exact,
      int? priority});
}

/// @nodoc
class __$$DisruptionImplCopyWithImpl<$Res>
    extends _$DisruptionCopyWithImpl<$Res, _$DisruptionImpl>
    implements _$$DisruptionImplCopyWith<$Res> {
  __$$DisruptionImplCopyWithImpl(
      _$DisruptionImpl _value, $Res Function(_$DisruptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? header = freezed,
    Object? lead = freezed,
    Object? text = freezed,
    Object? timeRange = freezed,
    Object? exact = freezed,
    Object? priority = freezed,
  }) {
    return _then(_$DisruptionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      lead: freezed == lead
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as String?,
      exact: freezed == exact
          ? _value.exact
          : exact // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisruptionImpl implements _Disruption {
  const _$DisruptionImpl(
      {this.id,
      this.header,
      this.lead,
      this.text,
      @JsonKey(name: 'timerange') this.timeRange,
      this.exact,
      this.priority});

  factory _$DisruptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisruptionImplFromJson(json);

  @override
  final String? id;
  @override
  final String? header;
  @override
  final String? lead;
  @override
  final String? text;
  @override
  @JsonKey(name: 'timerange')
  final String? timeRange;
  @override
  final bool? exact;
  @override
  final int? priority;

  @override
  String toString() {
    return 'Disruption(id: $id, header: $header, lead: $lead, text: $text, timeRange: $timeRange, exact: $exact, priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisruptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.lead, lead) || other.lead == lead) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange) &&
            (identical(other.exact, exact) || other.exact == exact) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, header, lead, text, timeRange, exact, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisruptionImplCopyWith<_$DisruptionImpl> get copyWith =>
      __$$DisruptionImplCopyWithImpl<_$DisruptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisruptionImplToJson(
      this,
    );
  }
}

abstract class _Disruption implements Disruption {
  const factory _Disruption(
      {final String? id,
      final String? header,
      final String? lead,
      final String? text,
      @JsonKey(name: 'timerange') final String? timeRange,
      final bool? exact,
      final int? priority}) = _$DisruptionImpl;

  factory _Disruption.fromJson(Map<String, dynamic> json) =
      _$DisruptionImpl.fromJson;

  @override
  String? get id;
  @override
  String? get header;
  @override
  String? get lead;
  @override
  String? get text;
  @override
  @JsonKey(name: 'timerange')
  String? get timeRange;
  @override
  bool? get exact;
  @override
  int? get priority;
  @override
  @JsonKey(ignore: true)
  _$$DisruptionImplCopyWith<_$DisruptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
