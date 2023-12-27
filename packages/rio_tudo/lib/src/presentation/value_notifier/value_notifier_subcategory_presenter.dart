import 'package:flutter/src/foundation/change_notifier.dart';

import 'package:rio_tudo/src/domain/entities/item_subcategory_entity.dart';

import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';
import '../../domain/entities/subcategory_entity.dart';
import '../screen/screens.dart';

class ValueNotifierSubCategoryPresenter implements SubCategoryPresenter {
  GetSubCategory getSubCategorySelected;

  ValueNotifierSubCategoryPresenter({required this.getSubCategorySelected});

  @override
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemsSubCategoriesNotifier;

  @override
  ValueNotifier<SubCategoryEntity?>? subCategoryNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  void dispose() {}
  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    subCategoryNotifier = ValueNotifier(const SubCategoryEntity(
        idSubCategory: null, subCategory: null, listItemSubCategory: null));
    listItemsSubCategoriesNotifier = ValueNotifier(null);
  }

  @override
  Future<SubCategoryEntity?> getSubCategory(
      {required String idSubCategorySelected}) async {
    try {
      state!.value = UILoadingState();

      subCategoryNotifier!.value = await getSubCategorySelected(
          GetSubCategoryParams(idSubCategory: idSubCategorySelected));

      listItemsSubCategoriesNotifier!.value =
          subCategoryNotifier!.value!.listItemSubCategory;

      state!.value = UISucessState('Subcategoria carregada com sucesso !');

      return subCategoryNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState('errorMessage');
    }
  }
}
