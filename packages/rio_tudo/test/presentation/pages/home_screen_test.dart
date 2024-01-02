import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/presentation/screen/screens.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: HomeScreen(
        presenterHomeScreen: makeHomePresenter(),
      ),
    );
    await tester.pumpWidget(page, Duration(seconds: 1));
  }

  setUp(() {
    //
  });

  testWidgets('Home Page', (tester) async {
    await loadPage(tester);

    expect(find.text(LabelsApp.homeText), findsOneWidget);
  });
}
