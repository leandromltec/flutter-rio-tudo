import 'dart:io';

import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/ui/screen/screens.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';
import 'package:config/src/service_locator/injector_getit.dart';

import '../../mock/mock.dart';

class NavigatorObserverMock extends Mock implements NavigatorObserver {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  NavigatorObserverMock? navigatorMock;
  ValueNotifierHomePresenter? presenter;
  GetAllCategoriesMock? getAllCategoriesMock;

  Future<void> loadPage(WidgetTester widgetTester) async {
    Widget page = MaterialApp(
      home: HomeScreen(
        presenterHomeScreen: presenter,
      ),
      routes: {
        RoutesApp.SubCategoryScreen: (_) => const MaterialApp(),
      },
      navigatorObservers: [navigatorMock!],
    );
    await widgetTester.pumpWidget(page, const Duration(seconds: 1));
  }

  setUp(() {
    getAllCategoriesMock = GetAllCategoriesMock();
    navigatorMock = NavigatorObserverMock();

    getAllCategoriesMock!
        .mockResponse(MockListCategoryEntity.mockCategoryEntity());

    presenter =
        ValueNotifierHomePresenter(getAllCategories: getAllCategoriesMock!);
  });

  setUpAll(() {
    HttpOverrides.global = null;

    makeHomeHomeScreen();

    InjectorGetIt.instance
        .registerLazySingleton<HomeScreenPresenter>(makeHomePresenter());
  });

  testWidgets('Test button selected subcategory in Subcategory Screen',
      (widgetTester) async {
    await loadPage(widgetTester);

    await widgetTester.pump();

    InkWell? inkWellButton() =>
        find.byKey(Key('selected_subcategory')).evaluate().first.widget
            as InkWell;

    inkWellButton()!.onTap!();

    await widgetTester.pumpAndSettle();
  });
}
