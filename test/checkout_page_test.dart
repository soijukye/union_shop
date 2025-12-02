import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/checkout_page.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('Checkout Page Widget Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: CheckoutPage(cartModel: CartModel()),
      );
    }

    testWidgets('should display checkout heading', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.textContaining('Checkout'), findsWidgets);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}
