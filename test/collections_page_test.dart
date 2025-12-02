import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('Collections Page Widget Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: CollectionsPage(cartModel: CartModel()),
      );
    }

    testWidgets('should display collections heading', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.textContaining('Collections'), findsWidgets);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}
