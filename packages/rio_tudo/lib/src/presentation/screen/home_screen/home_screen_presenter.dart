import 'package:flutter/material.dart';
import '../../base_presenter.dart';
import '../../../domain/entities/entities.dart';

abstract class HomeScreenPresenter extends BasePresenter {
  ValueNotifier<List<CategoryEntity>?>? listAllCategoriesNotifier;

  Future<List<CategoryEntity>?> getListCategories();
}
