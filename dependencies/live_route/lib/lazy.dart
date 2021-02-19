class Lazy<T> {
  Lazy(this.create);

  final T Function() create;
  late final T _value = create();

  T call() => _value;
}

extension ComputeX<T> on T Function() {
  Lazy<T> get lazy => Lazy<T>(this);
}
