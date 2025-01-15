import 'package:counter_with_clean_architecture/entities/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter copyWith should return a new instance with updated value', () {
    const Counter counter = Counter(0);
    final Counter newCounter = counter.copyWith(value: 1);

    expect(newCounter.value, 1);
    expect(counter.value, 0); // Ensure immutability
  });
}
