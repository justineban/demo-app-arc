// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_app_arc/main.dart';

void main() {
  testWidgets('AppRoot builds and counter increments', (
    WidgetTester tester,
  ) async {
    // Build the real app root.
    await tester.pumpWidget(const AppRoot());

    // Allow initial async load (service latency ~300ms) to complete.
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Value: 0'), findsOneWidget);

    // Tap the '+' button (ElevatedButton with add icon) and wait.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Value: 1'), findsOneWidget);
  });
}
