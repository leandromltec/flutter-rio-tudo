import 'package:config/config.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';
import '../../../rio_tudo.dart';

class ValueNotifierFavoritesPresenter extends FavoritesPresenter {
  GetFavorites getFavorites;

  ValueNotifierFavoritesPresenter({required this.getFavorites});

  @override
  ValueNotifier<FavoritesEntity?>? favoritesNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    favoritesNotifier = ValueNotifier(null);
  }

  @override
  void dispose() {
    state!.dispose();
    favoritesNotifier!.dispose();
  }

  @override
  Future<FavoritesEntity?>? getFavoritesText() async {
    try {
      state!.value = UILoadingState();

      favoritesNotifier!.value = await getFavorites();

      state!.value = UISucessState(LabelsApp.sucessMessageFavorites);
    } catch (error) {
      state!.value =
          UIErrorState(LabelsApp.errorMessageFavorites, TypeUsecase.favorites);
    }
  }
}
