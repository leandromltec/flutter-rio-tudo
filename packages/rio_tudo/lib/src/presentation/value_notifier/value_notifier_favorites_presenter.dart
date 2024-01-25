import 'dart:convert';

import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:rio_tudo/src/data/models/models.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';
import '../../../rio_tudo.dart';

class ValueNotifierFavoritesPresenter extends FavoritesPresenter {
  GetFavorites getFavorites;

  SharedPreferenceStorage _sharedPreference = SharedPreferenceStorage();

  ValueNotifierFavoritesPresenter({required this.getFavorites});

  @override
  ValueNotifier<FavoritesEntity?>? favoritesNotifier;

  @override
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    favoritesNotifier = ValueNotifier(null);
    listItemsSubCategoriesNotifier = ValueNotifier(null);
  }

  @override
  void dispose() {
    state!.dispose();
    favoritesNotifier!.dispose();
    listItemsSubCategoriesNotifier!.dispose();
  }

  _loadSharedPreferences() async {
    await _sharedPreference.initializeInstance();
  }

  @override
  Future<FavoritesEntity?>? getFavoritesText() async {
    try {
      state!.value = UILoadingState();

      favoritesNotifier!.value = await getFavorites();

      state!.value = UISucessState(LabelsApp.sucessMessageFavorites);
    } catch (error) {
      state!.value =
          UIErrorState(LabelsApp.errorMessageFavorites, TypeUsecase.favorites);
    }
  }

  @override
  Future<List<ItemSubCategoryEntity>?>? getListFavorites() async {
    try {
      state!.value = UILoadingState();

      await _loadSharedPreferences();

      List<String>? listFavoritesSharedPreferences =
          _sharedPreference.getStringList(LabelsApp.nameFavoriteList);

      if (listFavoritesSharedPreferences != null &&
          listFavoritesSharedPreferences.isNotEmpty) {
        List<String> listMapsFavorites = [];

        for (String itemFavoritesSharedPreferences
            in listFavoritesSharedPreferences) {
          listMapsFavorites.add(itemFavoritesSharedPreferences
              .replaceAll('"{', '{"')
              .replaceAll('}"', '"}')
              .replaceAll(':', '":"')
              .replaceAll(',', '","')
              .replaceAll('" ', '"')
              .replaceAll(' "', '"')
              .replaceAll('"https"', '"https')
              .replaceAll('"//', '//'));
        }

        List<ItemSubCategoryModel>? listItemSubCategoryModel;

        listItemSubCategoryModel =
            (jsonDecode(listMapsFavorites.toString()) as List)
                .map((e) => ItemSubCategoryModel.fromJson(e))
                .toList();

        listItemsSubCategoriesNotifier!.value = listItemSubCategoryModel
            .map<ItemSubCategoryEntity>((e) => e.toEntity())
            .toList();

        for (ItemSubCategoryEntity item
            in listItemsSubCategoriesNotifier!.value!) {
          item.isFavorite = true;
        }

        state!.value = UISucessState(LabelsApp.sucessMessageFavorites);
      } else {
        getFavoritesText();
      }
    } catch (error) {
      state!.value =
          UIErrorState(LabelsApp.errorMessageFavorites, TypeUsecase.favorites);
    }
  }

  @override
  Future<void> removeFavorite(ItemSubCategoryEntity itemSubCategory) async {
    try {
      state!.value = UILoadingState();

      itemSubCategory.isFavorite = !itemSubCategory.isFavorite!;

      listItemsSubCategoriesNotifier!.notifyListeners();

      Map<String, dynamic> itemSubCategoryMap = {
        'titleTip': itemSubCategory.titleTip,
        'district': itemSubCategory.district,
        'urlInstagram': itemSubCategory.urlInstagram,
        'isFavorite': itemSubCategory.isFavorite
      };

      List<String>? listFavorites =
          _sharedPreference.getStringList(LabelsApp.nameFavoriteList);

      listFavorites!.removeWhere(
          (element) => element.contains(itemSubCategoryMap['titleTip']));

      _sharedPreference.setStringList(
          LabelsApp.nameFavoriteList, listFavorites);

      await getListFavorites();

      state!.value = UISucessState(LabelsApp.sucessMessageFavoritesRemove);
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageFavoritesRemove, TypeUsecase.favorites);
    }
  }
}
