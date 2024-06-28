import 'package:fibonacci_list/enums/fibonacci_type.dart';
import 'package:fibonacci_list/models/fibonacci_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FibonacciItem', () {
    test('creates FibonacciItem with correct properties', () {
      const item = FibonacciItem(index: 5, number: 8, type: FibonacciType.square);
      expect(item.index, 5);
      expect(item.number, 8);
      expect(item.type, FibonacciType.square);
    });

    test('FibonacciType enum has correct values', () {
      expect(FibonacciType.values.length, 3);
      expect(FibonacciType.values, contains(FibonacciType.circle));
      expect(FibonacciType.values, contains(FibonacciType.square));
      expect(FibonacciType.values, contains(FibonacciType.cross));
    });
  });
}
