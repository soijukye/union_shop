import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  group('Product Card Widget Tests', () {
    testWidgets('should display product name and price', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: ProductCard(
            title: 'Test Product',
            price: '\u00a310.00',
            imageUrl: '',
          ),
        ),
      ));
      await tester.pump();
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('\u00a310.00'), findsOneWidget);
    });
  });
}
