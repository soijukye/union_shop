import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/dropdown_menu.dart';

void main() {
  group('Dropdown Menu Widget Tests', () {
    testWidgets('should display dropdown menu items when shown', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SimpleDropdownMenu(
            child: Text('Open Menu'),
          ),
        ),
      ));
      await tester.pump();
      // Simulate showing the menu
      SimpleDropdownMenu.show(tester.element(find.text('Open Menu')), 0);
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop Collections'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });
  });
}
