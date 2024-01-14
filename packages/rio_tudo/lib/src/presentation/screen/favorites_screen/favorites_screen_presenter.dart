import 'package:flutter/material.dart';
import '../../../domain/entities/favorites_entity.dart';

import '../../base_presenter.dart';

abstract class FavoritesPresenter extends BasePresenter {
  ValueNotifier<FavoritesEntity?>? favoritesNotifier;

  Future<FavoritesEntity?>? getFavoritesText();
}
