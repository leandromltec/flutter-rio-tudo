import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/data/usecases/api/api.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../test/mock/mock.dart';

import 'mock_integration_test/mock_integration_test.dart';

class NavigatorObserverMock extends Mock implements NavigatorObserver {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  NavigatorObserverMock? navigatorMock;

  ValueNotifierHomePresenter? presenter;
  ValueNotifierSubCategoryPresenter? presenterSubCategory;

  GetSubCategoryParams? params;

  GetAllCategoriesMock? getAllCategoriesMock;
  GetConfigsScreenMock? getConfigsScreen;
  //GetSubCategoryItemsMock? getSubCategoryItemsMock;

  SharedPreferenceStorage? sharedPreferenceStorageMock;

  late ApiGetSubCategory getSubCategory;

  setUp(() {
    navigatorMock = NavigatorObserverMock();

    getAllCategoriesMock = GetAllCategoriesMock();

    //Mock Categories
    getAllCategoriesMock!.mockResponse(
        MockCategoryEntityIntegrationTest.mockCategoryEntityIntegrationTest());
    //Presenter Categories
    presenter =
        ValueNotifierHomePresenter(getAllCategories: getAllCategoriesMock!);

    params = const GetSubCategoryParams(idSubCategory: 'almocovista');

    dynamic httpClient = http.Client();

    getSubCategory = ApiGetSubCategory(baseUrl: '', httpClient: httpClient);

    makeSubCategoryPresenter() => ValueNotifierSubCategoryPresenter(
        getItemsSubCategorySelected: getSubCategory,
        getConfigsScreen: getConfigsScreen,
        sharedPreference: sharedPreferenceStorageMock);

    presenterSubCategory = ValueNotifierSubCategoryPresenter(
        getItemsSubCategorySelected: getSubCategory,
        getConfigsScreen: getConfigsScreen!,
        sharedPreference: sharedPreferenceStorageMock);
  });

  setUpAll(() {
    //HttpOverrides.global = null;

    makeHomeHomeScreen();

    //getSubCategoryItemsMock = GetSubCategoryItemsMock();
    getConfigsScreen = GetConfigsScreenMock();

    /*getSubCategoryItemsMock!.mockResponse(
        MockListSubCategoryEntity.mockListSubCategoryEntity(), params);*/

    getConfigsScreen!
        .mockResponse(MockConfigsScreenEntity.mockConfigsScreenEntity());

    sharedPreferenceStorageMock = SharedPreferenceStorage();
    SharedPreferences.setMockInitialValues({'key': 'value'});

    InjectorGetIt.instance
        .registerLazySingleton<HomeScreenPresenter>(makeHomePresenter());

    InjectorGetIt.instance.registerLazySingleton<SubCategoryPresenter>(
        makeSubCategoryPresenter());

    InjectorGetIt.instance.get<HomeScreenPresenter>().idSubCategorySelected =
        ValueNotifier('');

    InjectorGetIt.instance
        .get<HomeScreenPresenter>()
        .idSubCategorySelected!
        .value = 'almocovista';

    InjectorGetIt.instance.get<HomeScreenPresenter>().titleSubCategorySelected =
        ValueNotifier('');

    InjectorGetIt.instance
        .get<HomeScreenPresenter>()
        .titleSubCategorySelected!
        .value = 'districtSelected';
  });

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: HomeScreen(
        presenterHomeScreen: presenter,
      ),
      routes: {
        RoutesApp.SubCategoryScreen: (BuildContext context) =>
            makeSubCategoryScreen(),
        RoutesApp.InfoScreen: (_) => const MaterialApp(),
        RoutesApp.InfluencerScreen: (_) => const MaterialApp(),
        RoutesApp.FavoriteScreen: (_) => const MaterialApp(),
      },
      navigatorObservers: [navigatorMock!],
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageSubcategory(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: SubCategoryScreen(
        presenterSubCategory: presenterSubCategory!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  group('Test Integration Home Page', () {
    testWidgets('Test button Subcategory Home PAge', (tester) async {
      await loadPage(tester);
      await tester.pump(const Duration(seconds: 1));

      //Aguarda todos os frames, animações sejam executados
      await tester.pumpAndSettle(const Duration(seconds: 2));

      InkWell? inkWellButton() =>
          find.byKey(Key('selected_subcategory')).evaluate().first.widget
              as InkWell;

      inkWellButton()!.onTap!();

      await Future.delayed(const Duration(seconds: 2));

      await tester.pumpAndSettle();
    });
  });

  /*group('Test Integration Subcategory Page', () {
    testWidgets('Test button Subcategory  Page', (tester) async {
      await loadPageSubcategory(tester);
      await tester.pump(const Duration(seconds: 1));

      //Aguarda todos os frames, animações sejam executados
      await tester.pumpAndSettle(const Duration(seconds: 3));

      GestureDetector? gestureDetectorButton() =>
          find.byKey(Key('selected_favorite')).evaluate().first.widget
              as GestureDetector;

      gestureDetectorButton()!.onTap!();

      await Future.delayed(const Duration(seconds: 2));

      await tester.pumpAndSettle();
    });
  });*/
}
