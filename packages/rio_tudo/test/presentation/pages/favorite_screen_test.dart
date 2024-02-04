import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../mock/mock.dart';

class NavigatorObserverMock extends Mock implements NavigatorObserver {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  NavigatorObserverMock? navigatorMock;

  var faker = Faker();

  SharedPreferenceStorage? sharedPreferenceStorageMock;

  ValueNotifierFavoritesPresenter? presenter;
  ValueNotifierFavoritesPresenter? presenterShared;
  ValueNotifierFavoritesPresenter? presenterError;

  GetFavoritesMock? getFavoritesMock;

  setUp(() async {
    getFavoritesMock = GetFavoritesMock();

    navigatorMock = NavigatorObserverMock();

    sharedPreferenceStorageMock = SharedPreferenceStorage();
    SharedPreferences.setMockInitialValues({'key': 'value'});
    await sharedPreferenceStorageMock!.initializeInstance();
    sharedPreferenceStorageMock!.clearAll();

    getFavoritesMock!.mockResponse(MockFavoriteEntity.mockFavoriteEntity());

    presenter = ValueNotifierFavoritesPresenter(
        getFavorites: getFavoritesMock!,
        sharedPreference: sharedPreferenceStorageMock!);
  });

  setUpAll(() {
    //HttpOverrides.global = null;

    makeFavoritesScreen();
    //makeFavoritesPresenter();

    /*InjectorGetIt.instance
        .registerLazySingleton<FavoritesPresenter>(makeFavoritesPresenter());*/
  });

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: FavoriteScreen(
        presenterFavorites: presenter!,
      ),
      routes: {
        RoutesApp.HomeScreen: (_) => const MaterialApp(),
      },
      navigatorObservers: [navigatorMock!],
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageSharedPreferences(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: FavoriteScreen(
        presenterFavorites: presenterShared!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageLoadError(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: FavoriteScreen(
        presenterFavorites: presenterError!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  testWidgets(
      'Test Favorites Screen load information (No Favorites in Shared Preference)',
      (tester) async {
    await loadPage(tester);
    await tester.pump(const Duration(seconds: 1));

    PopScope? popScopeFavorite() =>
        find.byKey(const Key('pop_scope_favorites')).evaluate().first.widget
            as PopScope;

    popScopeFavorite()!.onPopInvoked!(false);

    await tester.pumpAndSettle();
  });

  testWidgets('Test Favorites Screen  with Shared Preferences', (tester) async {
    Map<String, dynamic> itemSubCategoryMap = {
      'titleTip': 'itemCategoria',
      'district': faker.lorem.toString(),
      'urlInstagram': faker.lorem.toString(),
      'isFavorite': true
    };

    List<String>? listFavorites = [];
    listFavorites.add(jsonEncode(itemSubCategoryMap.toString()));

    sharedPreferenceStorageMock!
        .setStringList(LabelsApp.nameFavoriteList, listFavorites);

    presenterShared = ValueNotifierFavoritesPresenter(
        getFavorites: getFavoritesMock!,
        sharedPreference: sharedPreferenceStorageMock!);

    await loadPageSharedPreferences(tester);
    await tester.pump(const Duration(seconds: 1));

    presenterShared!.removeFavorite(ItemSubCategoryEntity(
        titleTip: 'itemCategoria',
        district: faker.lorem.word(),
        urlInstagram: faker.lorem.word(),
        isFavorite: false));

    GestureDetector? gestureDetectorButton() =>
        find.byKey(Key('selected_favorite')).evaluate().first.widget
            as GestureDetector;

    gestureDetectorButton()!.onTap!();

    await tester.pumpAndSettle();
  });

  testWidgets('Test Favorites Screen  with Error get Information',
      (tester) async {
    presenterError = ValueNotifierFavoritesPresenter(
        getFavorites: null, sharedPreference: sharedPreferenceStorageMock!);

    await loadPageLoadError(tester);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Test Favorites Page Screen with Error get Shared Preferences',
      (tester) async {
    presenterError = ValueNotifierFavoritesPresenter(
        getFavorites: getFavoritesMock!, sharedPreference: null);

    await loadPageLoadError(tester);
    await tester.pump(const Duration(seconds: 1));
  });
}
