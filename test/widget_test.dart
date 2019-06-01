import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:space_person/main.dart';


void main() {
  testWidgets('Test that app works correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // Verify that our counter starts at 0.

    await tester.pump(Duration(seconds: 2));


    expect(find.byType(Text), findsOneWidget);
  });
}
