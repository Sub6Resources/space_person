import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:space_person/main.dart';
import 'package:space_person/pages/home_page.dart';
import 'package:space_person/pages/person_detail_page.dart';
import 'package:space_person/repository/spaceperson_service.dart';
import 'package:space_person/repository/spacepersondetail_service.dart';

import 'repository_test.dart';

import 'package:image_test_utils/image_test_utils.dart';


void main() {
  testWidgets('Test that app works correctly', (WidgetTester tester) async {

    provideMockedNetworkImages(() async {
      spacePersonRepository = TestSpacePersonRepository();
      spacePersonDetailRepository = TestSpacePersonDetailRepository();


      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());
      tester.state(find.byType(HomePage));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // Verify that our counter starts at 0.

      await tester.pump(Duration.zero);

      expect(find.byType(Text), findsWidgets);
      expect(find.byType(ListTile), findsWidgets);

      await tester.tap(find.byType(ListTile));
      await tester.pumpAndSettle();

      expect(find.byType(PersonDetailPage), findsOneWidget);
    });

  });
}
