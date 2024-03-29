/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:config/config.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';
import '../ui/screen/screens.dart';

class ValueNotifierSubCategoryPresenter extends ChangeNotifier
    implements SubCategoryPresenter {
  GetSubCategoryItems? getItemsSubCategorySelected;
  GetConfigsScreen? getConfigsScreen;
  SharedPreferenceStorage? sharedPreference;

  ValueNotifierSubCategoryPresenter(
      {this.getItemsSubCategorySelected,
      this.getConfigsScreen,
      this.sharedPreference});

  @override
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  @override
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemDistrictSelectedNotifier;

  @override
  ValueNotifier<List<String>?>? listDistrictNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  ValueNotifier<ItemSubCategoryEntity>? itemSubCategoryNotifier;

  @override
  ValueNotifier<String>? suggestionSelectedNotifier;

  @override
  ValueNotifier<bool>? isMaxFavoritesNotifier;

  int _maxFavorites = 0;
  int get maxFavorites => _maxFavorites;

  @override
  void disposeNotifier() {
    state!.dispose();
    listItemsSubCategoriesNotifier!.dispose();
    listDistrictNotifier!.dispose();
    listItemDistrictSelectedNotifier!.dispose();
    suggestionSelectedNotifier!.dispose();
    itemSubCategoryNotifier!.dispose();
    isMaxFavoritesNotifier!.dispose();
  }

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    listItemsSubCategoriesNotifier = ValueNotifier(null);
    listItemDistrictSelectedNotifier = ValueNotifier(null);
    listDistrictNotifier = ValueNotifier(null);
    suggestionSelectedNotifier = ValueNotifier('');
    itemSubCategoryNotifier = ValueNotifier(ItemSubCategoryEntity(
        district: null, titleTip: null, urlInstagram: null, isFavorite: false));
    isMaxFavoritesNotifier = ValueNotifier(false);
  }

  _loadSharedPreferences() async {
    await sharedPreference!.initializeInstance();
  }

  @override
  Future<ConfigsScreenEntity?>? loadMaxFavorites() async {
    ConfigsScreenEntity? configsScreenEntity;

    try {
      state!.value = UILoadingState();

      configsScreenEntity = await getConfigsScreen!();
      _maxFavorites = configsScreenEntity!.maxFavorites!;

      state!.value = UISucessState(LabelsApp.sucessMessageFavoriteMax);
    } catch (error) {
      _maxFavorites = 10;
      configsScreenEntity = null;

      state!.value = UISucessState(LabelsApp.errorMessageFavoriteMax);
    }

    return configsScreenEntity;
  }

  @override
  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected}) async {
    try {
      state!.value = UILoadingState();

      await _loadSharedPreferences();

      listItemDistrictSelectedNotifier!.value = [];

      listItemsSubCategoriesNotifier!.value =
          await getItemsSubCategorySelected!(
              GetSubCategoryParams(idSubCategory: idSubCategorySelected));

      listItemsSubCategoriesNotifier!.value!
          .sort((a, b) => a.district!.compareTo(b.district!));

      List<String>? listFavorites = getListFavorites();

      for (ItemSubCategoryEntity item
          in listItemsSubCategoriesNotifier!.value!) {
        if (listFavorites != null && listFavorites.isNotEmpty) {
          final favorite = listFavorites
              .where((element) => element.contains(item.titleTip!))
              .isNotEmpty;

          if (favorite == true) {
            item.isFavorite = true;
          } else {
            item.isFavorite = false;
          }
        } else {
          item.isFavorite = false;
        }
      }

      state!.value = UISucessState(LabelsApp.sucessMessageTips);

      return listItemsSubCategoriesNotifier!.value;
    } catch (error) {
      state!.value =
          UIErrorState(LabelsApp.errorMessageTips, TypeUsecase.subCategory);
    }
    return listItemsSubCategoriesNotifier!.value;
  }

  @override
  void updateFavoriteSubCategory(ItemSubCategoryEntity itemSubCategory) {
    isMaxFavoritesNotifier!.value = false;

    bool isFavorite = !itemSubCategory.isFavorite!;

    List<String>? listFavorites =
        sharedPreference!.getStringList(LabelsApp.nameFavoriteList);

    if (isFavorite) {
      if (listFavorites != null && listFavorites.isNotEmpty) {
        if (maxFavorites <= listFavorites.length) {
          isMaxFavoritesNotifier!.value = true;
        }
      }
    }

    if (isMaxFavoritesNotifier!.value != true) {
      itemSubCategory.isFavorite = !itemSubCategory.isFavorite!;

      listItemsSubCategoriesNotifier!.notifyListeners();

      Map<String, dynamic> itemSubCategoryMap = {
        'titleTip': itemSubCategory.titleTip,
        'district': itemSubCategory.district,
        'urlInstagram': itemSubCategory.urlInstagram,
        'isFavorite': itemSubCategory.isFavorite
      };

      if (itemSubCategory.isFavorite!) {
        if (listFavorites == null || listFavorites.isEmpty) {
          listFavorites = [];
          listFavorites.add(jsonEncode(itemSubCategoryMap.toString()));
          sharedPreference!
              .setStringList(LabelsApp.nameFavoriteList, listFavorites);
        } else {
          listFavorites.add(jsonEncode(itemSubCategoryMap.toString()));
          sharedPreference!
              .setStringList(LabelsApp.nameFavoriteList, listFavorites);
        }
      } else {
        listFavorites!.removeWhere(
            (element) => element.contains(itemSubCategoryMap['titleTip']));

        sharedPreference!
            .setStringList(LabelsApp.nameFavoriteList, listFavorites);
      }
    }
  }

  @override
  List<String>? getListFavorites() {
    return sharedPreference!.getStringList(LabelsApp.nameFavoriteList);
  }

  @override
  List<String>? loadDistricts() {
    try {
      state!.value = UILoadingState();

      listDistrictNotifier!.value = listItemsSubCategoriesNotifier!.value!
          .map((subCategory) => subCategory.district!)
          .toSet()
          .toList();

      listDistrictNotifier!.value!.sort((a, b) => a.compareTo(b));

      state!.value = UISucessState(LabelsApp.sucessMessageDistricts);
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageDistricts, TypeUsecase.subCategory);
    }
    return listDistrictNotifier!.value;
  }

  @override
  List<ItemSubCategoryEntity>? getItemsSubCategoryByDistrict(
      {required String districtSelected}) {
    try {
      state!.value = UILoadingState();

      listItemDistrictSelectedNotifier!.value = listItemsSubCategoriesNotifier!
          .value!
          .where((subCategory) => subCategory.district == districtSelected)
          .toList();

      state!.value = UISucessState(LabelsApp.sucessMessageFilterDistricts);
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageFilterDistricts, TypeUsecase.subCategory);
    }
    return listItemsSubCategoriesNotifier!.value;
  }
}
