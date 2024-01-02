import 'package:flutter/material.dart';

import '../../base_presenter.dart';
import '../../../domain/entities/entities.dart';

abstract class SubCategoryPresenter extends BasePresenter {
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected});
}
