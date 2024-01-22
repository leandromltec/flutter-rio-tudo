import 'package:flutter/material.dart';

import '../../base_presenter.dart';
import '../../../domain/entities/entities.dart';

abstract class SubCategoryPresenter extends BasePresenter {
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;
  ValueNotifier<List<String>?>? listDistrictNotifier;
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemDistrictSelectedNotifier;
  ValueNotifier<String>? suggestionSelectedNotifier;
  ValueNotifier<ItemSubCategoryEntity>? itemSubCategoryNotifier;

  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected});
  List<String>? loadDistricts();
  List<ItemSubCategoryEntity>? getItemsSubCategoryByDistrict(
      {required String districtSelected});
  List<String>? getListFavorites();
  void updateFavoriteSubCategory(ItemSubCategoryEntity itemSubCategory);
}
