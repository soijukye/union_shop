import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/product_details_page.dart';
import 'package:union_shop/models/cart_model.dart';

void main() {
  group('Product Details Page Widget Tests', () {
    Widget createTestWidget() {
      return MaterialApp(
        home: ProductDetailsPage(
          product: {
            'title': 'Test Product',
            'imageUrl': '',
            'price': '\u00a310.00',
            'description': 'Test description',
            'category': 'Clothing',
            'sizes': ['S', 'M', 'L'],
            'colors': ['Red', 'Blue'],
            'cartModel': CartModel(),
          },
        ),
      );
    }

    testWidgets('should display product title and description', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('Test description'), findsOneWidget);
    });

    testWidgets('should display Add to Cart button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Add to Cart'), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });
  });
}
