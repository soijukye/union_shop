import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/top_navbar.dart';

void main() {
  group('TopNavBar Widget Tests', () {
    testWidgets('should display icons', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: TopNavBar(),
        ),
      ));
      await tester.pump();
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });
  });
}
