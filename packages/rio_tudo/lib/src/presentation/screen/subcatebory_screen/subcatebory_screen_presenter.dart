import 'package:flutter/material.dart';

import '../../base_presenter.dart';
import '../../../domain/entities/entities.dart';

abstract class SubCategoryPresenter extends BasePresenter {
  ValueNotifier<SubCategoryEntity?>? subCategoryNotifier;
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  Future<SubCategoryEntity?> getSubCategory(
      {required String idSubCategorySelected});
}
