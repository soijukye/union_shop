import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/home_screen.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('Home Screen Widget Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: HomeScreen(cartModel: CartModel()),
      );
    }

    testWidgets('should display home screen header', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.textContaining('Home'), findsWidgets);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}
