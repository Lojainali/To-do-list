// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task_manager/main.dart';

void main() {
  testWidgets('Task manager smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TaskManagerApp());

    // Verify that the app title is shown.
    expect(find.text('My Tasks'), findsOneWidget);

    // Verify that the empty state is shown initially.
    expect(find.text('No tasks yet'), findsOneWidget);

    // Verify that the 'Add Task' button is present.
    expect(find.text('Add Task'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
