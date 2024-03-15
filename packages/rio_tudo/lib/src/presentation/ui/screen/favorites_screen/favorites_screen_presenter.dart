/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import '../../../base_presenter.dart';

abstract class FavoritesPresenter extends BasePresenter {
  ValueNotifier<FavoritesEntity?>? favoritesNotifier;
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;
  ValueNotifier<bool>? isFavoriteScreenNotifier;

  Future<FavoritesEntity?>? getFavoritesText();
  Future<List<ItemSubCategoryEntity>?>? getListFavorites();
  Future<void> removeFavorite(ItemSubCategoryEntity itemSubCategory);
}
