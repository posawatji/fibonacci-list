import 'package:fibonacci_list/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Fibonacci List'), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
