// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using MyClass._() or by manually adding another constructor. The MyClass._() constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
SbbCompletion _$SbbCompletionFromJson(Map<String, dynamic> json) {
  return _SbbCompletion.fromJson(json);
}

/// @nodoc
class _$SbbCompletionTearOff {
  const _$SbbCompletionTearOff();

  _SbbCompletion call(
      {required String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin = DataOrigin.data}) {
    return _SbbCompletion(
      label: label,
      dist: dist,
      iconClass: iconClass,
      html: html,
      id: id,
      favoriteName: favoriteName,
      origin: origin,
    );
  }

  SbbCompletion fromJson(Map<String, Object> json) {
    return SbbCompletion.fromJson(json);
  }
}

/// @nodoc
const $SbbCompletion = _$SbbCompletionTearOff();

/// @nodoc
mixin _$SbbCompletion {
  String get label => throw _privateConstructorUsedError;
  double? get dist => throw _privateConstructorUsedError;
  @JsonKey(name: 'iconclass')
  String? get iconClass => throw _privateConstructorUsedError;
  String? get html => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get favoriteName => throw _privateConstructorUsedError;
  DataOrigin get origin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbCompletionCopyWith<SbbCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbCompletionCopyWith<$Res> {
  factory $SbbCompletionCopyWith(
          SbbCompletion value, $Res Function(SbbCompletion) then) =
      _$SbbCompletionCopyWithImpl<$Res>;
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin});
}

/// @nodoc
class _$SbbCompletionCopyWithImpl<$Res>
    implements $SbbCompletionCopyWith<$Res> {
  _$SbbCompletionCopyWithImpl(this._value, this._then);

  final SbbCompletion _value;
  // ignore: unused_field
  final $Res Function(SbbCompletion) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? dist = freezed,
    Object? iconClass = freezed,
    Object? html = freezed,
    Object? id = freezed,
    Object? favoriteName = freezed,
    Object? origin = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as double?,
      iconClass: iconClass == freezed ? _value.iconClass : iconClass as String?,
      html: html == freezed ? _value.html : html as String?,
      id: id == freezed ? _value.id : id as String?,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName as String?,
      origin: origin == freezed ? _value.origin : origin as DataOrigin,
    ));
  }
}

/// @nodoc
abstract class _$SbbCompletionCopyWith<$Res>
    implements $SbbCompletionCopyWith<$Res> {
  factory _$SbbCompletionCopyWith(
          _SbbCompletion value, $Res Function(_SbbCompletion) then) =
      __$SbbCompletionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin});
}

/// @nodoc
class __$SbbCompletionCopyWithImpl<$Res>
    extends _$SbbCompletionCopyWithImpl<$Res>
    implements _$SbbCompletionCopyWith<$Res> {
  __$SbbCompletionCopyWithImpl(
      _SbbCompletion _value, $Res Function(_SbbCompletion) _then)
      : super(_value, (v) => _then(v as _SbbCompletion));

  @override
  _SbbCompletion get _value => super._value as _SbbCompletion;

  @override
  $Res call({
    Object? label = freezed,
    Object? dist = freezed,
    Object? iconClass = freezed,
    Object? html = freezed,
    Object? id = freezed,
    Object? favoriteName = freezed,
    Object? origin = freezed,
  }) {
    return _then(_SbbCompletion(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as double?,
      iconClass: iconClass == freezed ? _value.iconClass : iconClass as String?,
      html: html == freezed ? _value.html : html as String?,
      id: id == freezed ? _value.id : id as String?,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName as String?,
      origin: origin == freezed ? _value.origin : origin as DataOrigin,
    ));
  }
}

@JsonSerializable(includeIfNull: false)

/// @nodoc
class _$_SbbCompletion extends _SbbCompletion {
  _$_SbbCompletion(
      {required this.label,
      this.dist,
      @JsonKey(name: 'iconclass') this.iconClass,
      this.html,
      this.id,
      this.favoriteName,
      this.origin = DataOrigin.data})
      : super._();

  factory _$_SbbCompletion.fromJson(Map<String, dynamic> json) =>
      _$_$_SbbCompletionFromJson(json);

  @override
  final String label;
  @override
  final double? dist;
  @override
  @JsonKey(name: 'iconclass')
  final String? iconClass;
  @override
  final String? html;
  @override
  final String? id;
  @override
  final String? favoriteName;
  @JsonKey(defaultValue: DataOrigin.data)
  @override
  final DataOrigin origin;

  @override
  String toString() {
    return 'SbbCompletion(label: $label, dist: $dist, iconClass: $iconClass, html: $html, id: $id, favoriteName: $favoriteName, origin: $origin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SbbCompletion &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.dist, dist) ||
                const DeepCollectionEquality().equals(other.dist, dist)) &&
            (identical(other.iconClass, iconClass) ||
                const DeepCollectionEquality()
                    .equals(other.iconClass, iconClass)) &&
            (identical(other.html, html) ||
                const DeepCollectionEquality().equals(other.html, html)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.favoriteName, favoriteName) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteName, favoriteName)) &&
            (identical(other.origin, origin) ||
                const DeepCollectionEquality().equals(other.origin, origin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(dist) ^
      const DeepCollectionEquality().hash(iconClass) ^
      const DeepCollectionEquality().hash(html) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(favoriteName) ^
      const DeepCollectionEquality().hash(origin);

  @JsonKey(ignore: true)
  @override
  _$SbbCompletionCopyWith<_SbbCompletion> get copyWith =>
      __$SbbCompletionCopyWithImpl<_SbbCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SbbCompletionToJson(this);
  }
}

abstract class _SbbCompletion extends SbbCompletion {
  _SbbCompletion._() : super._();
  factory _SbbCompletion(
      {required String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin}) = _$_SbbCompletion;

  factory _SbbCompletion.fromJson(Map<String, dynamic> json) =
      _$_SbbCompletion.fromJson;

  @override
  String get label => throw _privateConstructorUsedError;
  @override
  double? get dist => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'iconclass')
  String? get iconClass => throw _privateConstructorUsedError;
  @override
  String? get html => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get favoriteName => throw _privateConstructorUsedError;
  @override
  DataOrigin get origin => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SbbCompletionCopyWith<_SbbCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}
