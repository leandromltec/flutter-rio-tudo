import 'dart:convert';

import 'package:config/config.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import '../../domain/entities/entities.dart';
import '../base_presenter.dart';
import '../../domain/usecases/usecases.dart';
import '../screen/screens.dart';

class ValueNotifierSubCategoryPresenter implements SubCategoryPresenter {
  GetSubCategoryItems getItemsSubCategorySelected;
  SharedPreferenceStorage _sharedPreference = SharedPreferenceStorage();

  ValueNotifierSubCategoryPresenter({
    required this.getItemsSubCategorySelected,
  });

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
  void dispose() {
    state!.dispose();
    listItemsSubCategoriesNotifier!.dispose();
    listDistrictNotifier!.dispose();
    listItemDistrictSelectedNotifier!.dispose();
    suggestionSelectedNotifier!.dispose();
    itemSubCategoryNotifier!.dispose();
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
    _loadSharedPreferences();
  }

  _loadSharedPreferences() async {
    await _sharedPreference.initializeInstance();
  }

  @override
  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected}) async {
    try {
      state!.value = UILoadingState();

      listItemDistrictSelectedNotifier!.value = [];

      listItemsSubCategoriesNotifier!.value = await getItemsSubCategorySelected(
          GetSubCategoryParams(idSubCategory: idSubCategorySelected));

      listItemsSubCategoriesNotifier!.value!
          .sort((a, b) => a.district!.compareTo(b.district!));

      List<String>? listFavorites = getListFavorites();

      for (ItemSubCategoryEntity item
          in listItemsSubCategoriesNotifier!.value!) {
        if (listFavorites != null) {
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
  }

  @override
  void updateFavoriteSubCategory(ItemSubCategoryEntity itemSubCategory) {
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

    if (itemSubCategory.isFavorite!) {
      if (listFavorites == null || listFavorites.isEmpty) {
        listFavorites = [];
        listFavorites.add(jsonEncode(itemSubCategoryMap.toString()));
        _sharedPreference.setStringList(
            LabelsApp.nameFavoriteList, listFavorites);
      } else {
        listFavorites.add(jsonEncode(itemSubCategoryMap.toString()));
        _sharedPreference.setStringList(
            LabelsApp.nameFavoriteList, listFavorites);
      }
    } else {
      listFavorites!.removeWhere(
          (element) => element.contains(itemSubCategoryMap['titleTip']));

      _sharedPreference.setStringList(
          LabelsApp.nameFavoriteList, listFavorites);
    }
  }

  @override
  List<String>? getListFavorites() {
    return _sharedPreference.getStringList(LabelsApp.nameFavoriteList);
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

      return listDistrictNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageDistricts, TypeUsecase.subCategory);
    }
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

      return listItemsSubCategoriesNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageFilterDistricts, TypeUsecase.subCategory);
    }
  }
}
