import 'package:flutter/material.dart';
import '../../base_presenter.dart';
import '../../../domain/entities/entities.dart';

abstract class HomeScreenPresenter extends BasePresenter {
  ValueNotifier<List<CategoryEntity>?>? listAllCategoriesNotifier;
  ValueNotifier<String>? idSubCategorySelected;

  Future<List<CategoryEntity>?> getListCategories();
}
