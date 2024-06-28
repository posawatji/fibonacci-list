import 'package:fibonacci_list/enums/fibonacci_type.dart';
import 'package:fibonacci_list/utils/fibonacci_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FibonacciUtils', () {
    test('generateFibonacciList returns correct list with 0 items', () {
      final list = FibonacciUtils.generateFibonacciList(0);
      expect(list.length, 0);
      expect(list.map((item) => item.number).toList(), []);
    });

    test('generateFibonacciList returns correct list with 1 items', () {
      final list = FibonacciUtils.generateFibonacciList(1);
      expect(list.length, 1);
      expect(list.map((item) => item.number).toList(), [0]);
    });

    test('generateFibonacciList returns correct list with 2 items', () {
      final list = FibonacciUtils.generateFibonacciList(2);
      expect(list.length, 2);
      expect(list.map((item) => item.number).toList(), [0, 1]);
    });

    test('generateFibonacciList returns correct list with 3 items', () {
      final list = FibonacciUtils.generateFibonacciList(3);
      expect(list.length, 3);
      expect(list.map((item) => item.number).toList(), [0, 1, 1]);
    });

    test('generateFibonacciList returns correct list with 10 items', () {
      final list = FibonacciUtils.generateFibonacciList(10);
      expect(list.length, 10);
      expect(list.map((item) => item.number).toList(), [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]);
    });

    test('generateFibonacciList returns correct list with 40 items', () {
      final list = FibonacciUtils.generateFibonacciList(40);
      expect(list.length, 40);
      expect(list.map((item) => item.number).toList(), [
        0,
        1,
        1,
        2,
        3,
        5,
        8,
        13,
        21,
        34,
        55,
        89,
        144,
        233,
        377,
        610,
        987,
        1597,
        2584,
        4181,
        6765,
        10946,
        17711,
        28657,
        46368,
        75025,
        121393,
        196418,
        317811,
        514229,
        832040,
        1346269,
        2178309,
        3524578,
        5702887,
        9227465,
        14930352,
        24157817,
        39088169,
        63245986,
      ]);
    });

    test('getTypeForNumber returns correct type', () {
      expect(FibonacciUtils.getTypeForNumber(0), FibonacciType.circle);
      expect(FibonacciUtils.getTypeForNumber(1), FibonacciType.square);
      expect(FibonacciUtils.getTypeForNumber(2), FibonacciType.cross);
      expect(FibonacciUtils.getTypeForNumber(3), FibonacciType.circle);
      expect(FibonacciUtils.getTypeForNumber(4), FibonacciType.square);
      expect(FibonacciUtils.getTypeForNumber(5), FibonacciType.cross);
    });

    test('getIconForType returns correct icon', () {
      expect(FibonacciUtils.getIconForType(FibonacciType.circle), Icons.circle_rounded);
      expect(FibonacciUtils.getIconForType(FibonacciType.square), Icons.square_outlined);
      expect(FibonacciUtils.getIconForType(FibonacciType.cross), Icons.close);
    });
  });
}
