import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer_widget.dart';

void main() {
  group('Footer Widget Tests', () {
    testWidgets('should display placeholder footer text', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: FooterWidget(),
        ),
      ));
      await tester.pump();
      expect(find.text('Placeholder Footer'), findsOneWidget);
      expect(find.text('Students should customise this footer section'), findsOneWidget);
    });
  });
}
