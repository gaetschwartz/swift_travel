void main(List<String> args) {}

abstract class A {
  int get n => 5;
  int get n2;
}

abstract class B {
  String get s => 'Foo';
  String get s2;
}

abstract class AB implements A, B {}

class MyClass with A, B implements AB {
  @override
  int get n2 => throw UnimplementedError();

  @override
  String get s2 => throw UnimplementedError();
}
