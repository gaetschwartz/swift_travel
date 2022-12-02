// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SbbCompletionCopyWith<SbbCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SbbCompletionCopyWith<$Res> {
  factory $SbbCompletionCopyWith(
          SbbCompletion value, $Res Function(SbbCompletion) then) =
      _$SbbCompletionCopyWithImpl<$Res, SbbCompletion>;
  @useResult
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id});
}

/// @nodoc
class _$SbbCompletionCopyWithImpl<$Res, $Val extends SbbCompletion>
    implements $SbbCompletionCopyWith<$Res> {
  _$SbbCompletionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? dist = freezed,
    Object? iconClass = freezed,
    Object? html = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      dist: freezed == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
      iconClass: freezed == iconClass
          ? _value.iconClass
          : iconClass // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SbbCompletionCopyWith<$Res>
    implements $SbbCompletionCopyWith<$Res> {
  factory _$$_SbbCompletionCopyWith(
          _$_SbbCompletion value, $Res Function(_$_SbbCompletion) then) =
      __$$_SbbCompletionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      double? dist,
      @JsonKey(name: 'iconclass') String? iconClass,
      String? html,
      String? id});
}

/// @nodoc
class __$$_SbbCompletionCopyWithImpl<$Res>
    extends _$SbbCompletionCopyWithImpl<$Res, _$_SbbCompletion>
    implements _$$_SbbCompletionCopyWith<$Res> {
  __$$_SbbCompletionCopyWithImpl(
      _$_SbbCompletion _value, $Res Function(_$_SbbCompletion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? dist = freezed,
    Object? iconClass = freezed,
    Object? html = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_SbbCompletion(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      dist: freezed == dist
          ? _value.dist
          : dist // ignore: cast_nullable_to_non_nullable
              as double?,
      iconClass: freezed == iconClass
          ? _value.iconClass
          : iconClass // ignore: cast_nullable_to_non_nullable
              as String?,
      html: freezed == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.id})
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
  String toString() {
    return 'SbbCompletion(label: $label, dist: $dist, iconClass: $iconClass, html: $html, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SbbCompletion &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.dist, dist) || other.dist == dist) &&
            (identical(other.iconClass, iconClass) ||
                other.iconClass == iconClass) &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, dist, iconClass, html, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final String? id}) = _$_SbbCompletion;
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
  @JsonKey(ignore: true)
  _$$_SbbCompletionCopyWith<_$_SbbCompletion> get copyWith =>
      throw _privateConstructorUsedError;
}

_PlaceTypeIconclass _$_PlaceTypeIconclassFromJson(Map<String, dynamic> json) {
  return __PlaceTypeIconclass.fromJson(json);
}

/// @nodoc
mixin _$_PlaceTypeIconclass {
  PlaceType get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PlaceTypeIconclassCopyWith<_PlaceTypeIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PlaceTypeIconclassCopyWith<$Res> {
  factory _$PlaceTypeIconclassCopyWith(
          _PlaceTypeIconclass value, $Res Function(_PlaceTypeIconclass) then) =
      __$PlaceTypeIconclassCopyWithImpl<$Res, _PlaceTypeIconclass>;
  @useResult
  $Res call({PlaceType v});
}

/// @nodoc
class __$PlaceTypeIconclassCopyWithImpl<$Res, $Val extends _PlaceTypeIconclass>
    implements _$PlaceTypeIconclassCopyWith<$Res> {
  __$PlaceTypeIconclassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as PlaceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$__PlaceTypeIconclassCopyWith<$Res>
    implements _$PlaceTypeIconclassCopyWith<$Res> {
  factory _$$__PlaceTypeIconclassCopyWith(_$__PlaceTypeIconclass value,
          $Res Function(_$__PlaceTypeIconclass) then) =
      __$$__PlaceTypeIconclassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceType v});
}

/// @nodoc
class __$$__PlaceTypeIconclassCopyWithImpl<$Res>
    extends __$PlaceTypeIconclassCopyWithImpl<$Res, _$__PlaceTypeIconclass>
    implements _$$__PlaceTypeIconclassCopyWith<$Res> {
  __$$__PlaceTypeIconclassCopyWithImpl(_$__PlaceTypeIconclass _value,
      $Res Function(_$__PlaceTypeIconclass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? v = null,
  }) {
    return _then(_$__PlaceTypeIconclass(
      null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as PlaceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$__PlaceTypeIconclass implements __PlaceTypeIconclass {
  const _$__PlaceTypeIconclass(this.v);

  factory _$__PlaceTypeIconclass.fromJson(Map<String, dynamic> json) =>
      _$$__PlaceTypeIconclassFromJson(json);

  @override
  final PlaceType v;

  @override
  String toString() {
    return '_PlaceTypeIconclass(v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__PlaceTypeIconclass &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$__PlaceTypeIconclassCopyWith<_$__PlaceTypeIconclass> get copyWith =>
      __$$__PlaceTypeIconclassCopyWithImpl<_$__PlaceTypeIconclass>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__PlaceTypeIconclassToJson(
      this,
    );
  }
}

abstract class __PlaceTypeIconclass implements _PlaceTypeIconclass {
  const factory __PlaceTypeIconclass(final PlaceType v) =
      _$__PlaceTypeIconclass;

  factory __PlaceTypeIconclass.fromJson(Map<String, dynamic> json) =
      _$__PlaceTypeIconclass.fromJson;

  @override
  PlaceType get v;
  @override
  @JsonKey(ignore: true)
  _$$__PlaceTypeIconclassCopyWith<_$__PlaceTypeIconclass> get copyWith =>
      throw _privateConstructorUsedError;
}
