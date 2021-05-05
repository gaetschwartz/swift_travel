extension ListX<T> on List<T> {
  int modulo(int i) => i % length;
  int clamp(int i) => i.clamp(0, length - 1);
}
