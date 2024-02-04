/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import '../../../base_presenter.dart';

abstract class HomeScreenPresenter extends BasePresenter {
  ValueNotifier<List<CategoryEntity>?>? listAllCategoriesNotifier;
  ValueNotifier<String>? titleSubCategorySelected;
  ValueNotifier<String>? idSubCategorySelected;

  Future<List<CategoryEntity>?> getListCategories();
}
