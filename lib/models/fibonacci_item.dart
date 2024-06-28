import 'package:fibonacci_list/enums/fibonacci_type.dart';

class FibonacciItem {
  final int index;
  final int number;
  final FibonacciType type;

  const FibonacciItem({
    required this.index,
    required this.number,
    required this.type,
  });
}
