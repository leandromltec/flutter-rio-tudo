import 'package:flutter/material.dart';
import '../../../../domain/entities/entities.dart';
import '../../../../domain/entities/favorites_entity.dart';

import '../../../base_presenter.dart';

abstract class FavoritesPresenter extends BasePresenter {
  ValueNotifier<FavoritesEntity?>? favoritesNotifier;
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  Future<FavoritesEntity?>? getFavoritesText();
  Future<List<ItemSubCategoryEntity>?>? getListFavorites();
  Future<void> removeFavorite(ItemSubCategoryEntity itemSubCategory);
}
