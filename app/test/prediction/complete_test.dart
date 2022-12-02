import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/prediction/complete.dart';

void main() {
  test('top k', () {
    // 3 smallest
    final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final List<int> topK = list.topK(3, (a, b) => b.compareTo(a));
    expect(topK, [1, 2, 3]);
    // 3 biggest
    final List<int> topK2 = list.topK(3, (a, b) => a.compareTo(b));
    expect(topK2, [10, 9, 8]);
  });
}
