// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Union _$UnionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return Person.fromJson(json);
    case 'animal':
      return Animal.fromJson(json);
    case 'number':
      return Number.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$UnionTearOff {
  const _$UnionTearOff();

  Person call(String name) {
    return Person(
      name,
    );
  }

  Animal animal(String name, int legs) {
    return Animal(
      name,
      legs,
    );
  }

  Number number(int number) {
    return Number(
      number,
    );
  }

  Union fromJson(Map<String, Object> json) {
    return Union.fromJson(json);
  }
}

/// @nodoc
const $Union = _$UnionTearOff();

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
      _$UnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnionCopyWithImpl<$Res> implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._value, this._then);

  final Union _value;
  // ignore: unused_field
  final $Res Function(Union) _then;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(Person _value, $Res Function(Person) _then)
      : super(_value, (v) => _then(v as Person));

  @override
  Person get _value => super._value as Person;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(Person(
      name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$Person implements Person {
  const _$Person(this.name);

  factory _$Person.fromJson(Map<String, dynamic> json) =>
      _$_$PersonFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Union(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Person &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  $PersonCopyWith<Person> get copyWith =>
      _$PersonCopyWithImpl<Person>(this, _$identity);

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
    return _$_$PersonToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class Person implements Union {
  const factory Person(String name) = _$Person;

  factory Person.fromJson(Map<String, dynamic> json) = _$Person.fromJson;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalCopyWith<$Res> {
  factory $AnimalCopyWith(Animal value, $Res Function(Animal) then) =
      _$AnimalCopyWithImpl<$Res>;
  $Res call({String name, int legs});
}

/// @nodoc
class _$AnimalCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $AnimalCopyWith<$Res> {
  _$AnimalCopyWithImpl(Animal _value, $Res Function(Animal) _then)
      : super(_value, (v) => _then(v as Animal));

  @override
  Animal get _value => super._value as Animal;

  @override
  $Res call({
    Object? name = freezed,
    Object? legs = freezed,
  }) {
    return _then(Animal(
      name == freezed ? _value.name : name as String,
      legs == freezed ? _value.legs : legs as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$Animal implements Animal {
  const _$Animal(this.name, this.legs);

  factory _$Animal.fromJson(Map<String, dynamic> json) =>
      _$_$AnimalFromJson(json);

  @override
  final String name;
  @override
  final int legs;

  @override
  String toString() {
    return 'Union.animal(name: $name, legs: $legs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Animal &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.legs, legs) ||
                const DeepCollectionEquality().equals(other.legs, legs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(legs);

  @JsonKey(ignore: true)
  @override
  $AnimalCopyWith<Animal> get copyWith =>
      _$AnimalCopyWithImpl<Animal>(this, _$identity);

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
    return _$_$AnimalToJson(this)..['runtimeType'] = 'animal';
  }
}

abstract class Animal implements Union {
  const factory Animal(String name, int legs) = _$Animal;

  factory Animal.fromJson(Map<String, dynamic> json) = _$Animal.fromJson;

  String get name => throw _privateConstructorUsedError;
  int get legs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimalCopyWith<Animal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberCopyWith<$Res> {
  factory $NumberCopyWith(Number value, $Res Function(Number) then) =
      _$NumberCopyWithImpl<$Res>;
  $Res call({int number});
}

/// @nodoc
class _$NumberCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $NumberCopyWith<$Res> {
  _$NumberCopyWithImpl(Number _value, $Res Function(Number) _then)
      : super(_value, (v) => _then(v as Number));

  @override
  Number get _value => super._value as Number;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(Number(
      number == freezed ? _value.number : number as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$Number implements Number {
  const _$Number(this.number);

  factory _$Number.fromJson(Map<String, dynamic> json) =>
      _$_$NumberFromJson(json);

  @override
  final int number;

  @override
  String toString() {
    return 'Union.number(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Number &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(number);

  @JsonKey(ignore: true)
  @override
  $NumberCopyWith<Number> get copyWith =>
      _$NumberCopyWithImpl<Number>(this, _$identity);

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
    return _$_$NumberToJson(this)..['runtimeType'] = 'number';
  }
}

abstract class Number implements Union {
  const factory Number(int number) = _$Number;

  factory Number.fromJson(Map<String, dynamic> json) = _$Number.fromJson;

  int get number => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NumberCopyWith<Number> get copyWith => throw _privateConstructorUsedError;
}
