/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:rio_tudo/src/presentation/base_presenter.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../ui/screen/screens.dart';

class ValueNotifierHomePresenter implements HomeScreenPresenter {
  GetAllCategories getAllCategories;

  ValueNotifierHomePresenter({required this.getAllCategories});

  @override
  ValueNotifier<UIState>? state;

  @override
  ValueNotifier<List<CategoryEntity>?>? listAllCategoriesNotifier;

  @override
  ValueNotifier<String>? titleSubCategorySelected;

  @override
  ValueNotifier<String>? idSubCategorySelected;

  @override
  void disposeNotifier() {
    state!.dispose();
    listAllCategoriesNotifier!.dispose();
    idSubCategorySelected!.dispose();
    titleSubCategorySelected!.dispose();
  }

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    idSubCategorySelected = ValueNotifier('');
    titleSubCategorySelected = ValueNotifier('');
    listAllCategoriesNotifier = ValueNotifier(null);
  }

  @override
  Future<List<CategoryEntity>?> getListCategories() async {
    try {
      state!.value = UILoadingState();

      listAllCategoriesNotifier!.value = await getAllCategories();

      state!.value = UISucessState(LabelsApp.sucessMessageHome);

      return listAllCategoriesNotifier!.value!.toList();
    } catch (error) {
      state!.value = UIErrorState(LabelsApp.errorMessageHome, TypeUsecase.home);
    }

    return listAllCategoriesNotifier!.value;
  }
}
