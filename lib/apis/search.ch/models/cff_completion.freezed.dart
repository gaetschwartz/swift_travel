// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cff_completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CffCompletion _$CffCompletionFromJson(Map<String, dynamic> json) {
  return _CffCompletion.fromJson(json);
}

/// @nodoc
class _$CffCompletionTearOff {
  const _$CffCompletionTearOff();

// ignore: unused_element
  _CffCompletion call(
      {@required String label,
      double dist,
      @JsonKey(name: 'iconclass') String icon,
      String html,
      String id,
      String favoriteName,
      DataOrigin origin = DataOrigin.data}) {
    return _CffCompletion(
      label: label,
      dist: dist,
      icon: icon,
      html: html,
      id: id,
      favoriteName: favoriteName,
      origin: origin,
    );
  }

// ignore: unused_element
  CffCompletion fromJson(Map<String, Object> json) {
    return CffCompletion.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CffCompletion = _$CffCompletionTearOff();

/// @nodoc
mixin _$CffCompletion {
  String get label;
  double get dist;
  @JsonKey(name: 'iconclass')
  String get icon;
  String get html;
  String get id;
  String get favoriteName;
  DataOrigin get origin;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CffCompletionCopyWith<CffCompletion> get copyWith;
}

/// @nodoc
abstract class $CffCompletionCopyWith<$Res> {
  factory $CffCompletionCopyWith(
          CffCompletion value, $Res Function(CffCompletion) then) =
      _$CffCompletionCopyWithImpl<$Res>;
  $Res call(
      {String label,
      double dist,
      @JsonKey(name: 'iconclass') String icon,
      String html,
      String id,
      String favoriteName,
      DataOrigin origin});
}

/// @nodoc
class _$CffCompletionCopyWithImpl<$Res>
    implements $CffCompletionCopyWith<$Res> {
  _$CffCompletionCopyWithImpl(this._value, this._then);

  final CffCompletion _value;
  // ignore: unused_field
  final $Res Function(CffCompletion) _then;

  @override
  $Res call({
    Object label = freezed,
    Object dist = freezed,
    Object icon = freezed,
    Object html = freezed,
    Object id = freezed,
    Object favoriteName = freezed,
    Object origin = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as double,
      icon: icon == freezed ? _value.icon : icon as String,
      html: html == freezed ? _value.html : html as String,
      id: id == freezed ? _value.id : id as String,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName as String,
      origin: origin == freezed ? _value.origin : origin as DataOrigin,
    ));
  }
}

/// @nodoc
abstract class _$CffCompletionCopyWith<$Res>
    implements $CffCompletionCopyWith<$Res> {
  factory _$CffCompletionCopyWith(
          _CffCompletion value, $Res Function(_CffCompletion) then) =
      __$CffCompletionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String label,
      double dist,
      @JsonKey(name: 'iconclass') String icon,
      String html,
      String id,
      String favoriteName,
      DataOrigin origin});
}

/// @nodoc
class __$CffCompletionCopyWithImpl<$Res>
    extends _$CffCompletionCopyWithImpl<$Res>
    implements _$CffCompletionCopyWith<$Res> {
  __$CffCompletionCopyWithImpl(
      _CffCompletion _value, $Res Function(_CffCompletion) _then)
      : super(_value, (v) => _then(v as _CffCompletion));

  @override
  _CffCompletion get _value => super._value as _CffCompletion;

  @override
  $Res call({
    Object label = freezed,
    Object dist = freezed,
    Object icon = freezed,
    Object html = freezed,
    Object id = freezed,
    Object favoriteName = freezed,
    Object origin = freezed,
  }) {
    return _then(_CffCompletion(
      label: label == freezed ? _value.label : label as String,
      dist: dist == freezed ? _value.dist : dist as double,
      icon: icon == freezed ? _value.icon : icon as String,
      html: html == freezed ? _value.html : html as String,
      id: id == freezed ? _value.id : id as String,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName as String,
      origin: origin == freezed ? _value.origin : origin as DataOrigin,
    ));
  }
}

@JsonSerializable(includeIfNull: false)

/// @nodoc
class _$_CffCompletion implements _CffCompletion {
  const _$_CffCompletion(
      {@required this.label,
      this.dist,
      @JsonKey(name: 'iconclass') this.icon,
      this.html,
      this.id,
      this.favoriteName,
      this.origin = DataOrigin.data})
      : assert(label != null),
        assert(origin != null);

  factory _$_CffCompletion.fromJson(Map<String, dynamic> json) =>
      _$_$_CffCompletionFromJson(json);

  @override
  final String label;
  @override
  final double dist;
  @override
  @JsonKey(name: 'iconclass')
  final String icon;
  @override
  final String html;
  @override
  final String id;
  @override
  final String favoriteName;
  @JsonKey(defaultValue: DataOrigin.data)
  @override
  final DataOrigin origin;

  @override
  String toString() {
    return 'CffCompletion(label: $label, dist: $dist, icon: $icon, html: $html, id: $id, favoriteName: $favoriteName, origin: $origin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CffCompletion &&
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
  _$CffCompletionCopyWith<_CffCompletion> get copyWith =>
      __$CffCompletionCopyWithImpl<_CffCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CffCompletionToJson(this);
  }
}

abstract class _CffCompletion implements CffCompletion {
  const factory _CffCompletion(
      {@required String label,
      double dist,
      @JsonKey(name: 'iconclass') String icon,
      String html,
      String id,
      String favoriteName,
      DataOrigin origin}) = _$_CffCompletion;

  factory _CffCompletion.fromJson(Map<String, dynamic> json) =
      _$_CffCompletion.fromJson;

  @override
  String get label;
  @override
  double get dist;
  @override
  @JsonKey(name: 'iconclass')
  String get icon;
  @override
  String get html;
  @override
  String get id;
  @override
  String get favoriteName;
  @override
  DataOrigin get origin;
  @override
  @JsonKey(ignore: true)
  _$CffCompletionCopyWith<_CffCompletion> get copyWith;
}
