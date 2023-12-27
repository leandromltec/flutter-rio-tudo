import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/src/presentation/screen/screens.dart';
import 'package:rio_tudo/src/presentation/widgets/widgets.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    Widget page = const MaterialApp(
      home: SubCategoryScreen(),
    );

    await tester.pumpWidget(page, Duration(seconds: 1));
  }

  testWidgets('description', (widgetTester) async {
    await loadPage(widgetTester);

    ButtonText buttonText() =>
        find.byType(ButtonText).evaluate().first.widget as ButtonText;
  });
}
