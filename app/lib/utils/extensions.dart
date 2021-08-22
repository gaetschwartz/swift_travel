extension ListX<T> on List<T> {
  int clamp(int i) => i.clamp(0, length - 1);
}
