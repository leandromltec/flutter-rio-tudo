import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/src/presentation/ui/screen/screens.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    Widget page = const MaterialApp(
      home: FavoriteScreen(),
    );

    await tester.pumpWidget(page, Duration(seconds: 1));
  }

  testWidgets('description', (tester) async {
    await loadPage(tester);

    expect(find.text(LabelsApp.titleSeeUourFavoriteTips), findsOneWidget);
    expect(find.text(LabelsApp.textNoTipAsAavorite), findsOneWidget);
    expect(find.text(LabelsApp.textNumberFavorites), findsOneWidget);
  });
}
