import 'package:fibonacci_list/app.dart';
import 'package:fibonacci_list/widgets/fibonacci_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fibonacci_list/screens/fibonacci_list_screen.dart';

void main() {
  testWidgets('FibonacciListScreen displays initial list', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FibonacciListScreen()));

    // Check if the AppBar title is correct
    expect(find.text('Fibonacci List'), findsOneWidget);

    // Check if there are ListTiles present
    expect(find.byType(ListTile), findsWidgets);

    // Check if the first two Fibonacci numbers are displayed correctly
    expect(find.text('Index: 0, Number: 0'), findsOneWidget);
    expect(find.text('Index: 1, Number: 1'), findsOneWidget);

    // Scroll the list to ensure more items are loaded
    await tester.dragUntilVisible(
      find.text('Index: 39, Number: 63245986'),
      find.byType(ListView),
      const Offset(0, -150),
    );
    await tester.pump();

    // Check for a Fibonacci number that should be visible after scrolling
    // We're looking for the 11th Fibonacci number (index 10)
    expect(find.text('Index: 39, Number: 63245986'), findsOneWidget);
  });

  //NOTE: add more tests
  // testWidgets('Tapping an item opens bottom sheet', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp());
  //   await tester.pump();

  //   expect(find.text('Fibonacci List'), findsOneWidget);
  //   expect(find.byType(ListView), findsOneWidget);

  //   await tester.dragUntilVisible(
  //     find.text('Index: 10, Number: 55'),
  //     find.byType(ListView),
  //     const Offset(0, -50),
  //   );

  //   expect(find.text('Index: 10, Number: 55'), findsOneWidget);

  //   await tester.tap(find.text('Index: 10, Number: 55'), warnIfMissed: false);
  //   await tester.pumpAndSettle();
  // });

  // testWidgets('Reset functionality works correctly', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp());
  //   await tester.pump();

  //   // Check if the AppBar title is correct
  //   expect(find.text('Fibonacci List'), findsOneWidget);
  //   expect(find.byType(ListView), findsOneWidget);

  //   await tester.dragUntilVisible(
  //     find.text('Index: 10, Number: 55'),
  //     find.byType(ListView),
  //     const Offset(0, -50),
  //   );

  //   expect(find.text('Index: 10, Number: 55'), findsOneWidget);

  //   await tester.tap(find.text('Index: 10, Number: 55'), warnIfMissed: false);
  //   await tester.pumpAndSettle();

  //   await tester.tap(find.byIcon(Icons.refresh));
  //   await tester.pumpAndSettle();

  //   await tester.dragUntilVisible(
  //     find.text('Index: 10, Number: 55'),
  //     find.byType(ListView),
  //     const Offset(0, -50),
  //   );

  //   expect(find.text('Index: 10, Number: 55'), findsOneWidget);
  // });
}
