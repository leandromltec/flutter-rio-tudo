import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:rio_tudo/src/presentation/base_presenter.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../screen/screens.dart';

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
  void dispose() {
    state!.dispose();
    listAllCategoriesNotifier!.dispose();
    idSubCategorySelected!.dispose();
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

      state!.value = UISucessState('Lista de Categorias carregada com sucesso');

      return listAllCategoriesNotifier!.value!.toList();
    } catch (error) {
      state!.value = UIErrorState('error');
    }
  }
}
