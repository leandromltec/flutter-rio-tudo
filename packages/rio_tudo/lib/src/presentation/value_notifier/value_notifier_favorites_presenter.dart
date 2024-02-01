/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:rio_tudo/src/data/models/models.dart';

import '../../../rio_tudo.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';

class ValueNotifierFavoritesPresenter extends ChangeNotifier
    implements FavoritesPresenter {
  GetFavorites? getFavorites;
  SharedPreferenceStorage? sharedPreference;
  ValueNotifierFavoritesPresenter({this.getFavorites, this.sharedPreference});

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
  void disposeNotifier() {
    state!.dispose();
    favoritesNotifier!.dispose();
    listItemsSubCategoriesNotifier!.dispose();
  }

  _loadSharedPreferences() async {
    await sharedPreference!.initializeInstance();
  }

  @override
  Future<FavoritesEntity?>? getFavoritesText() async {
    try {
      state!.value = UILoadingState();

      favoritesNotifier!.value = await getFavorites!();

      state!.value = UISucessState(LabelsApp.sucessMessageFavorites);
    } catch (error) {
      state!.value =
          UIErrorState(LabelsApp.errorMessageFavorites, TypeUsecase.favorites);
    }
    return favoritesNotifier!.value;
  }

  @override
  Future<List<ItemSubCategoryEntity>?>? getListFavorites() async {
    try {
      state!.value = UILoadingState();

      await _loadSharedPreferences();

      List<String>? listFavoritesSharedPreferences =
          sharedPreference!.getStringList(LabelsApp.nameFavoriteList);

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
    return listItemsSubCategoriesNotifier!.value;
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
          sharedPreference!.getStringList(LabelsApp.nameFavoriteList);

      listFavorites!.removeWhere(
          (element) => element.contains(itemSubCategoryMap['titleTip']));

      sharedPreference!
          .setStringList(LabelsApp.nameFavoriteList, listFavorites);

      await getListFavorites();

      state!.value = UISucessState(LabelsApp.sucessMessageFavoritesRemove);
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageFavoritesRemove, TypeUsecase.favorites);
    }
  }
}
