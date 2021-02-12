// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NavCompletion _$NavCompletionFromJson(Map<String, dynamic> json) {
  return _NavCompletion.fromJson(json);
}

/// @nodoc
class _$NavCompletionTearOff {
  const _$NavCompletionTearOff();

  _NavCompletion call(
      {required String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? icon,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin = DataOrigin.data}) {
    return _NavCompletion(
      label: label,
      dist: dist,
      icon: icon,
      html: html,
      id: id,
      favoriteName: favoriteName,
      origin: origin,
    );
  }

  NavCompletion fromJson(Map<String, Object> json) {
    return NavCompletion.fromJson(json);
  }
}

/// @nodoc
const $NavCompletion = _$NavCompletionTearOff();

/// @nodoc
mixin _$NavCompletion {
  String get label;
  double? get dist;
  @JsonKey(name: 'iconclass')
  String? get icon;
  String? get html;
  String? get id;
  String? get favoriteName;
  DataOrigin get origin;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $NavCompletionCopyWith<NavCompletion> get copyWith;
}

/// @nodoc
abstract class $NavCompletionCopyWith<$Res> {
  factory $NavCompletionCopyWith(
          NavCompletion value, $Res Function(NavCompletion) then) =
      _$NavCompletionCopyWithImpl<$Res>;
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? icon,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin});
}

/// @nodoc
class _$NavCompletionCopyWithImpl<$Res>
    implements $NavCompletionCopyWith<$Res> {
  _$NavCompletionCopyWithImpl(this._value, this._then);

  final NavCompletion _value;
  // ignore: unused_field
  final $Res Function(NavCompletion) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? dist = freezed,
    Object? icon = freezed,
    Object? html = freezed,
    Object? id = freezed,
    Object? favoriteName = freezed,
    Object? origin = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as double?,
      icon: icon == freezed ? _value.icon : icon as String?,
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
abstract class _$NavCompletionCopyWith<$Res>
    implements $NavCompletionCopyWith<$Res> {
  factory _$NavCompletionCopyWith(
          _NavCompletion value, $Res Function(_NavCompletion) then) =
      __$NavCompletionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? icon,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin});
}

/// @nodoc
class __$NavCompletionCopyWithImpl<$Res>
    extends _$NavCompletionCopyWithImpl<$Res>
    implements _$NavCompletionCopyWith<$Res> {
  __$NavCompletionCopyWithImpl(
      _NavCompletion _value, $Res Function(_NavCompletion) _then)
      : super(_value, (v) => _then(v as _NavCompletion));

  @override
  _NavCompletion get _value => super._value as _NavCompletion;

  @override
  $Res call({
    Object? label = freezed,
    Object? dist = freezed,
    Object? icon = freezed,
    Object? html = freezed,
    Object? id = freezed,
    Object? favoriteName = freezed,
    Object? origin = freezed,
  }) {
    return _then(_NavCompletion(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as double?,
      icon: icon == freezed ? _value.icon : icon as String?,
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
class _$_NavCompletion implements _NavCompletion {
  const _$_NavCompletion(
      {required this.label,
      this.dist,
      @JsonKey(name: 'iconclass') this.icon,
      this.html,
      this.id,
      this.favoriteName,
      this.origin = DataOrigin.data});

  factory _$_NavCompletion.fromJson(Map<String, dynamic> json) =>
      _$_$_NavCompletionFromJson(json);

  @override
  final String label;
  @override
  final double? dist;
  @override
  @JsonKey(name: 'iconclass')
  final String? icon;
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
    return 'NavCompletion(label: $label, dist: $dist, icon: $icon, html: $html, id: $id, favoriteName: $favoriteName, origin: $origin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NavCompletion &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.dist, dist) ||
                const DeepCollectionEquality().equals(other.dist, dist)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
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
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(html) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(favoriteName) ^
      const DeepCollectionEquality().hash(origin);

  @JsonKey(ignore: true)
  @override
  _$NavCompletionCopyWith<_NavCompletion> get copyWith =>
      __$NavCompletionCopyWithImpl<_NavCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NavCompletionToJson(this);
  }
}

abstract class _NavCompletion implements NavCompletion {
  const factory _NavCompletion(
      {required String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? icon,
      String? html,
      String? id,
      String? favoriteName,
      DataOrigin origin}) = _$_NavCompletion;

  factory _NavCompletion.fromJson(Map<String, dynamic> json) =
      _$_NavCompletion.fromJson;

  @override
  String get label;
  @override
  double? get dist;
  @override
  @JsonKey(name: 'iconclass')
  String? get icon;
  @override
  String? get html;
  @override
  String? get id;
  @override
  String? get favoriteName;
  @override
  DataOrigin get origin;
  @override
  @JsonKey(ignore: true)
  _$NavCompletionCopyWith<_NavCompletion> get copyWith;
}
