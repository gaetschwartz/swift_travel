// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Union _$UnionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return Person.fromJson(json);
    case 'animal':
      return Animal.fromJson(json);
    case 'number':
      return Number.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Union',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Union {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name) $default, {
    required TResult Function(String name, int legs) animal,
    required TResult Function(int number) number,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name)? $default, {
    TResult? Function(String name, int legs)? animal,
    TResult? Function(int number)? number,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name)? $default, {
    TResult Function(String name, int legs)? animal,
    TResult Function(int number)? number,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Person value) $default, {
    required TResult Function(Animal value) animal,
    required TResult Function(Number value) number,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Person value)? $default, {
    TResult? Function(Animal value)? animal,
    TResult? Function(Number value)? number,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Person value)? $default, {
    TResult Function(Animal value)? animal,
    TResult Function(Number value)? number,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnionCopyWith<$Res> {
  factory $UnionCopyWith(Union value, $Res Function(Union) then) =
      _$UnionCopyWithImpl<$Res, Union>;
}

/// @nodoc
class _$UnionCopyWithImpl<$Res, $Val extends Union>
    implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PersonImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements Person {
  const _$PersonImpl(this.name, {final String? $type})
      : $type = $type ?? 'default';

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  final String name;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Union(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name) $default, {
    required TResult Function(String name, int legs) animal,
    required TResult Function(int number) number,
  }) {
    return $default(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name)? $default, {
    TResult? Function(String name, int legs)? animal,
    TResult? Function(int number)? number,
  }) {
    return $default?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name)? $default, {
    TResult Function(String name, int legs)? animal,
    TResult Function(int number)? number,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Person value) $default, {
    required TResult Function(Animal value) animal,
    required TResult Function(Number value) number,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Person value)? $default, {
    TResult? Function(Animal value)? animal,
    TResult? Function(Number value)? number,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Person value)? $default, {
    TResult Function(Animal value)? animal,
    TResult Function(Number value)? number,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class Person implements Union {
  const factory Person(final String name) = _$PersonImpl;

  factory Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  String get name;
  @JsonKey(ignore: true)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AnimalImplCopyWith<$Res> {
  factory _$$AnimalImplCopyWith(
          _$AnimalImpl value, $Res Function(_$AnimalImpl) then) =
      __$$AnimalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, int legs});
}

/// @nodoc
class __$$AnimalImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$AnimalImpl>
    implements _$$AnimalImplCopyWith<$Res> {
  __$$AnimalImplCopyWithImpl(
      _$AnimalImpl _value, $Res Function(_$AnimalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? legs = null,
  }) {
    return _then(_$AnimalImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == legs
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimalImpl implements Animal {
  const _$AnimalImpl(this.name, this.legs, {final String? $type})
      : $type = $type ?? 'animal';

  factory _$AnimalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimalImplFromJson(json);

  @override
  final String name;
  @override
  final int legs;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Union.animal(name: $name, legs: $legs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimalImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.legs, legs) || other.legs == legs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, legs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimalImplCopyWith<_$AnimalImpl> get copyWith =>
      __$$AnimalImplCopyWithImpl<_$AnimalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name) $default, {
    required TResult Function(String name, int legs) animal,
    required TResult Function(int number) number,
  }) {
    return animal(name, legs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name)? $default, {
    TResult? Function(String name, int legs)? animal,
    TResult? Function(int number)? number,
  }) {
    return animal?.call(name, legs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name)? $default, {
    TResult Function(String name, int legs)? animal,
    TResult Function(int number)? number,
    required TResult orElse(),
  }) {
    if (animal != null) {
      return animal(name, legs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Person value) $default, {
    required TResult Function(Animal value) animal,
    required TResult Function(Number value) number,
  }) {
    return animal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Person value)? $default, {
    TResult? Function(Animal value)? animal,
    TResult? Function(Number value)? number,
  }) {
    return animal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Person value)? $default, {
    TResult Function(Animal value)? animal,
    TResult Function(Number value)? number,
    required TResult orElse(),
  }) {
    if (animal != null) {
      return animal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimalImplToJson(
      this,
    );
  }
}

abstract class Animal implements Union {
  const factory Animal(final String name, final int legs) = _$AnimalImpl;

  factory Animal.fromJson(Map<String, dynamic> json) = _$AnimalImpl.fromJson;

  String get name;
  int get legs;
  @JsonKey(ignore: true)
  _$$AnimalImplCopyWith<_$AnimalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberImplCopyWith<$Res> {
  factory _$$NumberImplCopyWith(
          _$NumberImpl value, $Res Function(_$NumberImpl) then) =
      __$$NumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int number});
}

/// @nodoc
class __$$NumberImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$NumberImpl>
    implements _$$NumberImplCopyWith<$Res> {
  __$$NumberImplCopyWithImpl(
      _$NumberImpl _value, $Res Function(_$NumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
  }) {
    return _then(_$NumberImpl(
      null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberImpl implements Number {
  const _$NumberImpl(this.number, {final String? $type})
      : $type = $type ?? 'number';

  factory _$NumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberImplFromJson(json);

  @override
  final int number;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Union.number(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberImpl &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberImplCopyWith<_$NumberImpl> get copyWith =>
      __$$NumberImplCopyWithImpl<_$NumberImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name) $default, {
    required TResult Function(String name, int legs) animal,
    required TResult Function(int number) number,
  }) {
    return number(this.number);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name)? $default, {
    TResult? Function(String name, int legs)? animal,
    TResult? Function(int number)? number,
  }) {
    return number?.call(this.number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name)? $default, {
    TResult Function(String name, int legs)? animal,
    TResult Function(int number)? number,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(this.number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Person value) $default, {
    required TResult Function(Animal value) animal,
    required TResult Function(Number value) number,
  }) {
    return number(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Person value)? $default, {
    TResult? Function(Animal value)? animal,
    TResult? Function(Number value)? number,
  }) {
    return number?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Person value)? $default, {
    TResult Function(Animal value)? animal,
    TResult Function(Number value)? number,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberImplToJson(
      this,
    );
  }
}

abstract class Number implements Union {
  const factory Number(final int number) = _$NumberImpl;

  factory Number.fromJson(Map<String, dynamic> json) = _$NumberImpl.fromJson;

  int get number;
  @JsonKey(ignore: true)
  _$$NumberImplCopyWith<_$NumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
