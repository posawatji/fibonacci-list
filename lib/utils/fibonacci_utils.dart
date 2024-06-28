import 'package:fibonacci_list/enums/fibonacci_type.dart';
import 'package:flutter/material.dart';
import '../models/fibonacci_item.dart';

class FibonacciUtils {
  static List<FibonacciItem> generateFibonacciList(int count) {
    if (count <= 0) return [];
    if (count == 1) return [FibonacciItem(index: 0, number: 0, type: getTypeForNumber(0))];

    List<int> numbers = [0, 1];
    for (int i = 2; i < count; i++) {
      numbers.add(numbers[i - 1] + numbers[i - 2]);
    }
    return numbers.asMap().entries.map((entry) {
      return FibonacciItem(
        index: entry.key,
        number: entry.value,
        type: getTypeForNumber(entry.value),
      );
    }).toList();
  }

  static FibonacciType getTypeForNumber(int number) {
    if (number % 3 == 0) return FibonacciType.circle;
    if (number % 3 == 1) return FibonacciType.square;
    return FibonacciType.cross;
  }

  static IconData getIconForType(FibonacciType type) {
    switch (type) {
      case FibonacciType.circle:
        return Icons.circle_rounded;
      case FibonacciType.square:
        return Icons.square_outlined;
      case FibonacciType.cross:
        return Icons.close;
    }
  }
}
