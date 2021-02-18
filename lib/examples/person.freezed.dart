// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PersonTearOff {
  const _$PersonTearOff();

  Person call(String firstName, String lastName, int age) {
    return Person(
      firstName,
      lastName,
      age,
    );
  }
}

/// @nodoc
const $Person = _$PersonTearOff();

/// @nodoc
abstract class _$Person {
  const _$Person();

  String get firstName => throw Exception();
  String get lastName => throw Exception();
  int get age => throw Exception();

  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw Exception();
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) = _$PersonCopyWithImpl<$Res>;
  $Res call({String firstName, String lastName, int age});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res> implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  final Person _value;
  // ignore: unused_field
  final $Res Function(Person) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      age: age == freezed ? _value.age : age as int,
    ));
  }
}

/// @nodoc
abstract class _$PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$PersonCopyWith(Person value, $Res Function(Person) then) = __$PersonCopyWithImpl<$Res>;
  @override
  $Res call({String firstName, String lastName, int age});
}

/// @nodoc
class __$PersonCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements _$PersonCopyWith<$Res> {
  __$PersonCopyWithImpl(Person _value, $Res Function(Person) _then)
      : super(_value, (v) => _then(v));

  @override
  Person get _value => super._value;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
  }) {
    return _then(Person(
      firstName == freezed ? _value.firstName : firstName as String,
      lastName == freezed ? _value.lastName : lastName as String,
      age == freezed ? _value.age : age as int,
    ));
  }
}

/// @nodoc
class _$_Person extends Person {
  const _$_Person(this.firstName, this.lastName, this.age) : super._();

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int age;

  @override
  String toString() {
    return 'Person(firstName: $firstName, lastName: $lastName, age: $age)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Person &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality().equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality().equals(other.lastName, lastName)) &&
            (identical(other.age, age) || const DeepCollectionEquality().equals(other.age, age)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(age);

  @JsonKey(ignore: true)
  @override
  _$PersonCopyWith<Person> get copyWith => __$PersonCopyWithImpl<Person>(this, _$identity);
}
