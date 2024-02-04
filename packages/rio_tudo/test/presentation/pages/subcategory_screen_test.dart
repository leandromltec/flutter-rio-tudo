import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rio_tudo/rio_tudo.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';
import 'package:rio_tudo/src/main/factories/screens/screens_factories.dart';
import 'package:rio_tudo/src/presentation/value_notifier/value_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mock/mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  ValueNotifierSubCategoryPresenter? presenter;
  ValueNotifierSubCategoryPresenter? presenterError;
  ValueNotifierSubCategoryPresenter? presenterShared;

  GetSubCategoryParams? params;
  GetConfigsScreenMock? getConfigsScreen;
  GetSubCategoryItemsMock? getSubCategoryItemsMock;

  GetFavoritesMock? getFavoritesMock;

  SharedPreferenceStorage? sharedPreferenceStorageMock;

  Map<String, dynamic> itemSubCategoryMap1 = {
    'titleTip': faker.lorem.toString(),
    'district': 'districtSelected',
    'urlInstagram': faker.lorem.toString(),
    'isFavorite': true
  };

  Map<String, dynamic> itemSubCategoryMap2 = {
    'titleTip': faker.lorem.toString(),
    'district': 'districtSelected',
    'urlInstagram': faker.lorem.toString(),
    'isFavorite': false
  };

  setUp(() {
    getFavoritesMock = GetFavoritesMock();

    sharedPreferenceStorageMock = SharedPreferenceStorage();
    SharedPreferences.setMockInitialValues({'key': 'value'});
    getSubCategoryItemsMock = GetSubCategoryItemsMock();
    getConfigsScreen = GetConfigsScreenMock();

    params = const GetSubCategoryParams(idSubCategory: 'subcategory');

    getSubCategoryItemsMock!.mockResponse(
        MockListSubCategoryEntity.mockListSubCategoryEntity(), params);

    getConfigsScreen!
        .mockResponse(MockConfigsScreenEntity.mockConfigsScreenEntity());

    presenter = ValueNotifierSubCategoryPresenter(
        getItemsSubCategorySelected: getSubCategoryItemsMock!,
        getConfigsScreen: getConfigsScreen!,
        sharedPreference: sharedPreferenceStorageMock!);
  });

  setUpAll(() {
    //HttpOverrides.global = null;

    makeSubCategoryScreen();

    InjectorGetIt.instance
        .registerLazySingleton<HomeScreenPresenter>(makeHomePresenter());

    InjectorGetIt.instance.registerLazySingleton<SubCategoryPresenter>(
        makeSubCategoryPresenter());

    InjectorGetIt.instance.get<HomeScreenPresenter>().idSubCategorySelected =
        ValueNotifier('');

    InjectorGetIt.instance
        .get<HomeScreenPresenter>()
        .idSubCategorySelected!
        .value = 'subcategory';

    InjectorGetIt.instance.get<HomeScreenPresenter>().titleSubCategorySelected =
        ValueNotifier('');

    InjectorGetIt.instance
        .get<HomeScreenPresenter>()
        .titleSubCategorySelected!
        .value = 'districtSelected';
  });

  Future<void> loadPage(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: SubCategoryScreen(
        presenterSubCategory: presenter!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageError(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: SubCategoryScreen(
        presenterSubCategory: presenterError!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  Future<void> loadPageLoad(WidgetTester tester) async {
    Widget page = MaterialApp(
      home: SubCategoryScreen(
        presenterSubCategory: presenterShared!,
      ),
    );
    await tester.pumpWidget(page, const Duration(seconds: 1));
  }

  testWidgets('Test Subcategory Screen', (tester) async {
    await loadPage(tester);
    await tester.pump(const Duration(seconds: 1));

    List<ItemSubCategoryEntity> listItemDistrictSelectedMock = [
      ItemSubCategoryEntity(
          titleTip: faker.lorem.word(),
          district: 'districtSelected',
          urlInstagram: faker.lorem.word(),
          isFavorite: true)
    ];

    presenter!.listItemDistrictSelectedNotifier = ValueNotifier(null);

    presenter!.listItemDistrictSelectedNotifier!.value =
        listItemDistrictSelectedMock;

    presenter!
        .getItemsSubCategoryByDistrict(districtSelected: 'districtSelected');

    GestureDetector? gestureDetectorButton() =>
        find.byKey(Key('selected_favorite')).evaluate().first.widget
            as GestureDetector;

    gestureDetectorButton()!.onTap!();

    await tester.pumpAndSettle();

    GestureDetector? gestureDetectorButtonCloseTextFieldDistrict() => find
        .byKey(
          Key('close_texfield_district'),
        )
        .evaluate()
        .first
        .widget as GestureDetector;

    gestureDetectorButtonCloseTextFieldDistrict()!.onTap!();

    await tester.pumpAndSettle();

    TextButton? textButton() =>
        find.byKey(Key('button_see_all')).evaluate().first.widget as TextButton;

    textButton()!.onPressed!();

    await tester.pumpAndSettle();
  });

  testWidgets('Test Subcategory Screen insert Shared Preferences',
      (tester) async {
    List<String>? listFavorites = [];

    for (int index = 0; index < 10; index++) {
      listFavorites.add(jsonEncode(itemSubCategoryMap1.toString()));
    }

    await sharedPreferenceStorageMock!.initializeInstance();

    sharedPreferenceStorageMock!.clearAll();

    sharedPreferenceStorageMock!
        .setStringList(LabelsApp.nameFavoriteList, listFavorites);

    presenterShared = ValueNotifierSubCategoryPresenter(
        getItemsSubCategorySelected: getSubCategoryItemsMock!,
        getConfigsScreen: getConfigsScreen!,
        sharedPreference: sharedPreferenceStorageMock!);

    await loadPageLoad(tester);
    await tester.pump(const Duration(seconds: 1));

    presenterShared!.updateFavoriteSubCategory(ItemSubCategoryEntity(
        titleTip: faker.lorem.word(),
        district: 'districtSelected',
        urlInstagram: faker.lorem.word(),
        isFavorite: false));

    GestureDetector? gestureDetectorButton() =>
        find.byKey(Key('selected_favorite')).evaluate().first.widget
            as GestureDetector;

    gestureDetectorButton()!.onTap!();

    await tester.pumpAndSettle();
  });

  testWidgets('Test Subcategory Screen with Error get Items Subcategory',
      (tester) async {
    getSubCategoryItemsMock!.mockResponse(null, params);

    presenterError = ValueNotifierSubCategoryPresenter(
        getItemsSubCategorySelected: null,
        getConfigsScreen: getConfigsScreen!,
        sharedPreference: sharedPreferenceStorageMock!);

    await loadPageError(tester);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Test Subcategory Screen Error get Shared Preferences',
      (tester) async {
    getSubCategoryItemsMock!.mockResponse(null, params);

    presenterError = ValueNotifierSubCategoryPresenter(
        getItemsSubCategorySelected: getSubCategoryItemsMock,
        getConfigsScreen: getConfigsScreen!,
        sharedPreference: null);

    await loadPageError(tester);
    await tester.pump(const Duration(seconds: 1));
  });
}
