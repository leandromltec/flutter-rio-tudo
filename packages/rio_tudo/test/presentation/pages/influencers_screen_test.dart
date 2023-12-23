import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/src/presentation/screen/screens.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    Widget page = const MaterialApp(
      home: InfluencersScreen(),
    );

    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  testWidgets('description', (widgetTester) async {
    await loadPage(widgetTester);

    expect(find.text(LabelsApp.influencersText), findsOneWidget);
  });
}
