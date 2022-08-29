// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SbbCompletion _$SbbCompletionFromJson(Map<String, dynamic> json) {
  return _SbbCompletion.fromJson(json);
}

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
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      dist: dist == freezed
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
      iconClass: iconClass == freezed
          ? _value.iconClass
          : iconClass // ignore: cast_nullable_to_non_nullable
              as String?,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as DataOrigin,
    ));
  }
}

/// @nodoc
abstract class _$$_SbbCompletionCopyWith<$Res>
    implements $SbbCompletionCopyWith<$Res> {
  factory _$$_SbbCompletionCopyWith(
          _$_SbbCompletion value, $Res Function(_$_SbbCompletion) then) =
      __$$_SbbCompletionCopyWithImpl<$Res>;
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
class __$$_SbbCompletionCopyWithImpl<$Res>
    extends _$SbbCompletionCopyWithImpl<$Res>
    implements _$$_SbbCompletionCopyWith<$Res> {
  __$$_SbbCompletionCopyWithImpl(
      _$_SbbCompletion _value, $Res Function(_$_SbbCompletion) _then)
      : super(_value, (v) => _then(v as _$_SbbCompletion));

  @override
  _$_SbbCompletion get _value => super._value as _$_SbbCompletion;

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
    return _then(_$_SbbCompletion(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      dist: dist == freezed
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
      iconClass: iconClass == freezed
          ? _value.iconClass
          : iconClass // ignore: cast_nullable_to_non_nullable
              as String?,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteName: favoriteName == freezed
          ? _value.favoriteName
          : favoriteName // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as DataOrigin,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
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
      _$$_SbbCompletionFromJson(json);

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
  @override
  @JsonKey()
  final DataOrigin origin;

  @override
  String toString() {
    return 'SbbCompletion(label: $label, dist: $dist, iconClass: $iconClass, html: $html, id: $id, favoriteName: $favoriteName, origin: $origin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SbbCompletion &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.dist, dist) &&
            const DeepCollectionEquality().equals(other.iconClass, iconClass) &&
            const DeepCollectionEquality().equals(other.html, html) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.favoriteName, favoriteName) &&
            const DeepCollectionEquality().equals(other.origin, origin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(dist),
      const DeepCollectionEquality().hash(iconClass),
      const DeepCollectionEquality().hash(html),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(favoriteName),
      const DeepCollectionEquality().hash(origin));

  @JsonKey(ignore: true)
  @override
  _$$_SbbCompletionCopyWith<_$_SbbCompletion> get copyWith =>
      __$$_SbbCompletionCopyWithImpl<_$_SbbCompletion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SbbCompletionToJson(
      this,
    );
  }
}

abstract class _SbbCompletion extends SbbCompletion {
  factory _SbbCompletion(
      {required final String label,
      final double? dist,
      @JsonKey(name: 'iconclass') final String? iconClass,
      final String? html,
      final String? id,
      final String? favoriteName,
      final DataOrigin origin}) = _$_SbbCompletion;
  _SbbCompletion._() : super._();

  factory _SbbCompletion.fromJson(Map<String, dynamic> json) =
      _$_SbbCompletion.fromJson;

  @override
  String get label;
  @override
  double? get dist;
  @override
  @JsonKey(name: 'iconclass')
  String? get iconClass;
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
  _$$_SbbCompletionCopyWith<_$_SbbCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}
