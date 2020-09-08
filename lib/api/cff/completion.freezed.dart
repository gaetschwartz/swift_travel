// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Completion _$CompletionFromJson(Map<String, dynamic> json) {
  return _Completion.fromJson(json);
}

class _$CompletionTearOff {
  const _$CompletionTearOff();

// ignore: unused_element
  _Completion call(String label, {int dist, String iconclass, String html}) {
    return _Completion(
      label,
      dist: dist,
      iconclass: iconclass,
      html: html,
    );
  }
}

// ignore: unused_element
const $Completion = _$CompletionTearOff();

mixin _$Completion {
  String get label;
  int get dist;
  String get iconclass;
  String get html;

  Map<String, dynamic> toJson();
  $CompletionCopyWith<Completion> get copyWith;
}

abstract class $CompletionCopyWith<$Res> {
  factory $CompletionCopyWith(
          Completion value, $Res Function(Completion) then) =
      _$CompletionCopyWithImpl<$Res>;
  $Res call({String label, int dist, String iconclass, String html});
}

class _$CompletionCopyWithImpl<$Res> implements $CompletionCopyWith<$Res> {
  _$CompletionCopyWithImpl(this._value, this._then);

  final Completion _value;
  // ignore: unused_field
  final $Res Function(Completion) _then;

  @override
  $Res call({
    Object label = freezed,
    Object dist = freezed,
    Object iconclass = freezed,
    Object html = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as int,
      iconclass: iconclass == freezed ? _value.iconclass : iconclass as String,
      html: html == freezed ? _value.html : html as String,
    ));
  }
}

abstract class _$CompletionCopyWith<$Res> implements $CompletionCopyWith<$Res> {
  factory _$CompletionCopyWith(
          _Completion value, $Res Function(_Completion) then) =
      __$CompletionCopyWithImpl<$Res>;
  @override
  $Res call({String label, int dist, String iconclass, String html});
}

class __$CompletionCopyWithImpl<$Res> extends _$CompletionCopyWithImpl<$Res>
    implements _$CompletionCopyWith<$Res> {
  __$CompletionCopyWithImpl(
      _Completion _value, $Res Function(_Completion) _then)
      : super(_value, (v) => _then(v as _Completion));

  @override
  _Completion get _value => super._value as _Completion;

  @override
  $Res call({
    Object label = freezed,
    Object dist = freezed,
    Object iconclass = freezed,
    Object html = freezed,
  }) {
    return _then(_Completion(
      label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as int,
      iconclass: iconclass == freezed ? _value.iconclass : iconclass as String,
      html: html == freezed ? _value.html : html as String,
    ));
  }
}

@JsonSerializable()
class _$_Completion implements _Completion {
  _$_Completion(this.label, {this.dist, this.iconclass, this.html})
      : assert(label != null);

  factory _$_Completion.fromJson(Map<String, dynamic> json) =>
      _$_$_CompletionFromJson(json);

  @override
  final String label;
  @override
  final int dist;
  @override
  final String iconclass;
  @override
  final String html;

  @override
  String toString() {
    return 'Completion(label: $label, dist: $dist, iconclass: $iconclass, html: $html)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Completion &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.dist, dist) ||
                const DeepCollectionEquality().equals(other.dist, dist)) &&
            (identical(other.iconclass, iconclass) ||
                const DeepCollectionEquality()
                    .equals(other.iconclass, iconclass)) &&
            (identical(other.html, html) ||
                const DeepCollectionEquality().equals(other.html, html)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(dist) ^
      const DeepCollectionEquality().hash(iconclass) ^
      const DeepCollectionEquality().hash(html);

  @override
  _$CompletionCopyWith<_Completion> get copyWith =>
      __$CompletionCopyWithImpl<_Completion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompletionToJson(this);
  }
}

abstract class _Completion implements Completion {
  factory _Completion(String label, {int dist, String iconclass, String html}) =
      _$_Completion;

  factory _Completion.fromJson(Map<String, dynamic> json) =
      _$_Completion.fromJson;

  @override
  String get label;
  @override
  int get dist;
  @override
  String get iconclass;
  @override
  String get html;
  @override
  _$CompletionCopyWith<_Completion> get copyWith;
}
