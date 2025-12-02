import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_us_page.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('About Us Page Widget Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: AboutUsPage(cartModel: CartModel()),
      );
    }

    testWidgets('should display About Us heading and text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('About Us'), findsOneWidget);
      expect(find.textContaining('Welcome to the Union Shop!'), findsOneWidget);
    });

    testWidgets('should display white box and correct heading color', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      final aboutUsBox = tester.widget<Container>(find.byType(Container).at(1));
      final decoration = aboutUsBox.decoration as BoxDecoration?;
      expect(decoration?.color, Colors.white);
      final heading = tester.widget<Text>(find.text('About Us'));
      expect((heading.style?.color), const Color(0xFF4d2963));
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}
