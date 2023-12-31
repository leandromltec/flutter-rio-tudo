import 'package:flutter/material.dart';

import '../../base_presenter.dart';
import '../../../domain/entities/entities.dart';

abstract class SubCategoryPresenter extends BasePresenter {
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;
  ValueNotifier<List<String>?>? listDistrictNotifier;
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemDistrictSelectedNotifier;
  ValueNotifier<bool>? isFavoriteNotifier;
  ValueNotifier<String>? suggestionSelectedNotifier;

  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected});
  List<String>? loadDistricts();
  List<ItemSubCategoryEntity>? getItemsSubCategoryByDistrict(
      {required String districtSelected});
}
