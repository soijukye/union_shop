import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/cart_page.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('Cart Page Widget Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: CartPage(cartModel: CartModel()),
      );
    }

    testWidgets('should display YOUR CART heading', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('YOUR CART'), findsOneWidget);
    });

    testWidgets('should show empty cart message and large box', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Your cart is empty.'), findsOneWidget);
      // Check for a Container with a SizedBox of height 370 (or greater)
      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      expect(sizedBoxes.any((box) => box.height != null && box.height! >= 370), isTrue);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}
