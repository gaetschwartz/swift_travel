// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disruption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Disruption _$DisruptionFromJson(Map<String, dynamic> json) {
  return _Disruption.fromJson(json);
}

/// @nodoc
class _$DisruptionTearOff {
  const _$DisruptionTearOff();

  _Disruption call(
      {String? id,
      String? header,
      String? lead,
      String? text,
      @JsonKey(name: 'timerange') String? timeRange,
      bool? exact,
      int? priority}) {
    return _Disruption(
      id: id,
      header: header,
      lead: lead,
      text: text,
      timeRange: timeRange,
      exact: exact,
      priority: priority,
    );
  }

  Disruption fromJson(Map<String, Object?> json) {
    return Disruption.fromJson(json);
  }
}

/// @nodoc
const $Disruption = _$DisruptionTearOff();

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
      _$DisruptionCopyWithImpl<$Res>;
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
class _$DisruptionCopyWithImpl<$Res> implements $DisruptionCopyWith<$Res> {
  _$DisruptionCopyWithImpl(this._value, this._then);

  final Disruption _value;
  // ignore: unused_field
  final $Res Function(Disruption) _then;

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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      lead: lead == freezed
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as String?,
      exact: exact == freezed
          ? _value.exact
          : exact // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$DisruptionCopyWith<$Res> implements $DisruptionCopyWith<$Res> {
  factory _$DisruptionCopyWith(
          _Disruption value, $Res Function(_Disruption) then) =
      __$DisruptionCopyWithImpl<$Res>;
  @override
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
class __$DisruptionCopyWithImpl<$Res> extends _$DisruptionCopyWithImpl<$Res>
    implements _$DisruptionCopyWith<$Res> {
  __$DisruptionCopyWithImpl(
      _Disruption _value, $Res Function(_Disruption) _then)
      : super(_value, (v) => _then(v as _Disruption));

  @override
  _Disruption get _value => super._value as _Disruption;

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
    return _then(_Disruption(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      header: header == freezed
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      lead: lead == freezed
          ? _value.lead
          : lead // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRange: timeRange == freezed
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as String?,
      exact: exact == freezed
          ? _value.exact
          : exact // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Disruption implements _Disruption {
  const _$_Disruption(
      {this.id,
      this.header,
      this.lead,
      this.text,
      @JsonKey(name: 'timerange') this.timeRange,
      this.exact,
      this.priority});

  factory _$_Disruption.fromJson(Map<String, dynamic> json) =>
      _$$_DisruptionFromJson(json);

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
            other is _Disruption &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.header, header) &&
            const DeepCollectionEquality().equals(other.lead, lead) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.timeRange, timeRange) &&
            const DeepCollectionEquality().equals(other.exact, exact) &&
            const DeepCollectionEquality().equals(other.priority, priority));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(header),
      const DeepCollectionEquality().hash(lead),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(timeRange),
      const DeepCollectionEquality().hash(exact),
      const DeepCollectionEquality().hash(priority));

  @JsonKey(ignore: true)
  @override
  _$DisruptionCopyWith<_Disruption> get copyWith =>
      __$DisruptionCopyWithImpl<_Disruption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DisruptionToJson(this);
  }
}

abstract class _Disruption implements Disruption {
  const factory _Disruption(
      {String? id,
      String? header,
      String? lead,
      String? text,
      @JsonKey(name: 'timerange') String? timeRange,
      bool? exact,
      int? priority}) = _$_Disruption;

  factory _Disruption.fromJson(Map<String, dynamic> json) =
      _$_Disruption.fromJson;

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
  _$DisruptionCopyWith<_Disruption> get copyWith =>
      throw _privateConstructorUsedError;
}
