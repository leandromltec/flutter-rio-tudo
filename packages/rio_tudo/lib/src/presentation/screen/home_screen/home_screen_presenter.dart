import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';
import '../../base_presenter.dart';

abstract class HomeScreenPresenter extends BasePresenter {
  ValueNotifier<List<CategoryEntity>?>? listAllCategoriesNotifier;

  Future<List<CategoryEntity>?> getListCategories();
}
