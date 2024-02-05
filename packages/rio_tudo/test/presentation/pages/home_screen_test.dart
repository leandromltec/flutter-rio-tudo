import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';

import '../../mock/mock.dart';

class NavigatorObserverMock extends Mock implements NavigatorObserver {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  NavigatorObserverMock? navigatorMock;

  ValueNotifierHomePresenter? presenter;
  ValueNotifierHomePresenter? presenterError;

  GetAllCategoriesMock? getAllCategoriesMock;

  setUp(() {
    navigatorMock = NavigatorObserverMock();

    getAllCategoriesMock = GetAllCategoriesMock();
    getAllCategoriesMock!
        .mockResponse(MockListCategoryEntity.mockCategoryEntity());

    presenter =
        ValueNotifierHomePresenter(getAllCategories: getAllCategoriesMock!);
  });

  setUpAll(() {
    //HttpOverrides.global = null;

    makeHomeHomeScreen();

    InjectorGetIt.instance
        .registerLazySingleton<HomeScreenPresenter>(makeHomePresenter());
  });

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: HomeScreen(
        presenterHomeScreen: presenter,
      ),
      routes: {
        RoutesApp.InfoScreen: (_) => const MaterialApp(),
        RoutesApp.InfluencerScreen: (_) => const MaterialApp(),
        RoutesApp.FavoriteScreen: (_) => const MaterialApp(),
      },
      navigatorObservers: [navigatorMock!],
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageError(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: HomeScreen(
        presenterHomeScreen: presenterError,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  testWidgets('Test Home Screen', (tester) async {
    await loadPage(tester);
    await tester.pump(const Duration(seconds: 1));

    expect(find.text(LabelsApp.homeText), findsOneWidget);

    IconButton? iconButton() =>
        find.byKey(Key('redirect_info_screen')).evaluate().first.widget
            as IconButton;

    iconButton()!.onPressed!();

    await tester.pumpAndSettle();
  });

  testWidgets('test Home Screen with Error', (tester) async {
    getAllCategoriesMock!.mockResponse(null);

    presenterError =
        ValueNotifierHomePresenter(getAllCategories: getAllCategoriesMock!);

    await loadPageError(tester);
    await tester.pump(const Duration(seconds: 1));
  });
}
