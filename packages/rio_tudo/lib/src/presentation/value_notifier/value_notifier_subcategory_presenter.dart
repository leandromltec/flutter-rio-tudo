import 'package:flutter/src/foundation/change_notifier.dart';

import 'package:rio_tudo/src/domain/entities/item_subcategory_entity.dart';
import '../base_presenter.dart';
import '../../domain/usecases/usecases.dart';
import '../screen/screens.dart';

class ValueNotifierSubCategoryPresenter implements SubCategoryPresenter {
  GetSubCategoryItems getItemsSubCategorySelected;

  ValueNotifierSubCategoryPresenter(
      {required this.getItemsSubCategorySelected});

  @override
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  void dispose() {}
  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    listItemsSubCategoriesNotifier = ValueNotifier(null);
  }

  @override
  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected}) async {
    try {
      state!.value = UILoadingState();

      listItemsSubCategoriesNotifier!.value = await getItemsSubCategorySelected(
          GetSubCategoryParams(idSubCategory: idSubCategorySelected));

      state!.value =
          UISucessState('Items da Subcategoria carregada com sucesso !');

      return listItemsSubCategoriesNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState('errorMessage');
    }
  }
}
