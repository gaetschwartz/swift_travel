import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/prediction/predict.dart';

void main() {
  test("sums work", () {
    final s = Sum();
    s.add(const WeighedAddend(2, 1, "a")); // 2
    s.add(const WeighedAddend(3, 2, "b")); // 6
    s.add(const WeighedAddend(1.5, 2, "c")); // 3
    s.add(const WeighedAddend(0, 1, "d")); // 0
    expect(s.value, 11);
    final computed = ComputedSum(s);
    expect(computed.value, 11);
  });
}
