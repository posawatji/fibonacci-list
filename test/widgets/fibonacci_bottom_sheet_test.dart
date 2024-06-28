import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fibonacci_list/widgets/fibonacci_bottom_sheet.dart';
import 'package:fibonacci_list/models/fibonacci_item.dart';
import 'package:fibonacci_list/enums/fibonacci_type.dart';

void main() {
  testWidgets('FibonacciBottomSheet displays items correctly', (WidgetTester tester) async {
    const items = [
      FibonacciItem(index: 0, number: 0, type: FibonacciType.circle),
      FibonacciItem(index: 1, number: 1, type: FibonacciType.square),
      FibonacciItem(index: 2, number: 1, type: FibonacciType.cross),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FibonacciBottomSheet(
            items: items,
            lastAddedItem: null,
            onItemTap: (item) {},
          ),
        ),
      ),
    );

    expect(find.text('Number: 0'), findsOneWidget);
    expect(find.text('Number: 1'), findsNWidgets(2));
    expect(find.text('Index: 0'), findsOneWidget);
    expect(find.text('Index: 1'), findsOneWidget);
    expect(find.text('Index: 2'), findsOneWidget);
  });

  testWidgets('FibonacciBottomSheet highlights last added item', (WidgetTester tester) async {
    const items = [
      FibonacciItem(index: 0, number: 0, type: FibonacciType.circle),
      FibonacciItem(index: 1, number: 1, type: FibonacciType.square),
    ];

    final lastAddedItem = items[1];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FibonacciBottomSheet(
            items: items,
            lastAddedItem: lastAddedItem,
            onItemTap: (item) {},
          ),
        ),
      ),
    );

    final ListTile lastAddedTile = tester.widget(find.byType(ListTile).last);
    expect(lastAddedTile.selectedTileColor, Colors.green);
  });

  //NOTE: add more tests
  // testWidgets('Tapping an item in bottom sheet for moves it to main list and highlights it with red',
  //     (WidgetTester tester) async {
  //
  // });
}
