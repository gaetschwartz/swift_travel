import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
// No warning of unimplemented class, not suggestion in
// autocomplete
abstract class Person with NamedEntity implements _$Person {
  const factory Person(String firstName, String lastName, int age) = _$_Person;
  const Person._();

  @override
  String get name => '$firstName $lastName';
}

mixin NamedEntity {
  String get name;
}

class Person2 with NamedEntity {
  const Person2(this.firstName, this.lastName, this.age);

  final String firstName;
  final String lastName;
  final int age;

  @override
  String get name => '$firstName $lastName';
}

void main() {
  const n1 = Person2('Gaëtan', 'S.', 20);
  print(n1.name);
  const n2 = Person('Remi', 'R.', 1234);
  print(n2.name);
}
