import 'package:flutter_test/flutter_test.dart';
import 'package:fibonacci_list/enums/fibonacci_type.dart';

void main() {
  test('FibonacciType enum has correct values', () {
    expect(FibonacciType.values.length, 3);
    expect(FibonacciType.values, contains(FibonacciType.circle));
    expect(FibonacciType.values, contains(FibonacciType.square));
    expect(FibonacciType.values, contains(FibonacciType.cross));
  });
}
