// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'disruption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Disruption _$DisruptionFromJson(Map<String, dynamic> json) {
  return _Disruption.fromJson(json);
}

/// @nodoc
class _$DisruptionTearOff {
  const _$DisruptionTearOff();

// ignore: unused_element
  _Disruption call(
      {String id,
      String header,
      String lead,
      String text,
      @JsonKey(name: 'timerange') String timeRange,
      bool exact,
      int priority}) {
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

// ignore: unused_element
  Disruption fromJson(Map<String, Object> json) {
    return Disruption.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Disruption = _$DisruptionTearOff();

/// @nodoc
mixin _$Disruption {
  String get id;
  String get header;
  String get lead;
  String get text;
  @JsonKey(name: 'timerange')
  String get timeRange;
  bool get exact;
  int get priority;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DisruptionCopyWith<Disruption> get copyWith;
}

/// @nodoc
abstract class $DisruptionCopyWith<$Res> {
  factory $DisruptionCopyWith(
          Disruption value, $Res Function(Disruption) then) =
      _$DisruptionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String header,
      String lead,
      String text,
      @JsonKey(name: 'timerange') String timeRange,
      bool exact,
      int priority});
}

/// @nodoc
class _$DisruptionCopyWithImpl<$Res> implements $DisruptionCopyWith<$Res> {
  _$DisruptionCopyWithImpl(this._value, this._then);

  final Disruption _value;
  // ignore: unused_field
  final $Res Function(Disruption) _then;

  @override
  $Res call({
    Object id = freezed,
    Object header = freezed,
    Object lead = freezed,
    Object text = freezed,
    Object timeRange = freezed,
    Object exact = freezed,
    Object priority = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      header: header == freezed ? _value.header : header as String,
      lead: lead == freezed ? _value.lead : lead as String,
      text: text == freezed ? _value.text : text as String,
      timeRange: timeRange == freezed ? _value.timeRange : timeRange as String,
      exact: exact == freezed ? _value.exact : exact as bool,
      priority: priority == freezed ? _value.priority : priority as int,
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
      {String id,
      String header,
      String lead,
      String text,
      @JsonKey(name: 'timerange') String timeRange,
      bool exact,
      int priority});
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
    Object id = freezed,
    Object header = freezed,
    Object lead = freezed,
    Object text = freezed,
    Object timeRange = freezed,
    Object exact = freezed,
    Object priority = freezed,
  }) {
    return _then(_Disruption(
      id: id == freezed ? _value.id : id as String,
      header: header == freezed ? _value.header : header as String,
      lead: lead == freezed ? _value.lead : lead as String,
      text: text == freezed ? _value.text : text as String,
      timeRange: timeRange == freezed ? _value.timeRange : timeRange as String,
      exact: exact == freezed ? _value.exact : exact as bool,
      priority: priority == freezed ? _value.priority : priority as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
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
      _$_$_DisruptionFromJson(json);

  @override
  final String id;
  @override
  final String header;
  @override
  final String lead;
  @override
  final String text;
  @override
  @JsonKey(name: 'timerange')
  final String timeRange;
  @override
  final bool exact;
  @override
  final int priority;

  @override
  String toString() {
    return 'Disruption(id: $id, header: $header, lead: $lead, text: $text, timeRange: $timeRange, exact: $exact, priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Disruption &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.header, header) ||
                const DeepCollectionEquality().equals(other.header, header)) &&
            (identical(other.lead, lead) ||
                const DeepCollectionEquality().equals(other.lead, lead)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.timeRange, timeRange) ||
                const DeepCollectionEquality()
                    .equals(other.timeRange, timeRange)) &&
            (identical(other.exact, exact) ||
                const DeepCollectionEquality().equals(other.exact, exact)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(header) ^
      const DeepCollectionEquality().hash(lead) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(timeRange) ^
      const DeepCollectionEquality().hash(exact) ^
      const DeepCollectionEquality().hash(priority);

  @JsonKey(ignore: true)
  @override
  _$DisruptionCopyWith<_Disruption> get copyWith =>
      __$DisruptionCopyWithImpl<_Disruption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DisruptionToJson(this);
  }
}

abstract class _Disruption implements Disruption {
  const factory _Disruption(
      {String id,
      String header,
      String lead,
      String text,
      @JsonKey(name: 'timerange') String timeRange,
      bool exact,
      int priority}) = _$_Disruption;

  factory _Disruption.fromJson(Map<String, dynamic> json) =
      _$_Disruption.fromJson;

  @override
  String get id;
  @override
  String get header;
  @override
  String get lead;
  @override
  String get text;
  @override
  @JsonKey(name: 'timerange')
  String get timeRange;
  @override
  bool get exact;
  @override
  int get priority;
  @override
  @JsonKey(ignore: true)
  _$DisruptionCopyWith<_Disruption> get copyWith;
}
