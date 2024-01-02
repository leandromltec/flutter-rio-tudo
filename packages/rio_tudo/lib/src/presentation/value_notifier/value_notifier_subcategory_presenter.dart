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
  ValueNotifier<List<ItemSubCategoryEntity>?>? listItemDistrictSelectedNotifier;

  @override
  ValueNotifier<List<String>?>? listDistrictNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  void dispose() {
    state!.dispose();
    listItemsSubCategoriesNotifier!.dispose();
    listDistrictNotifier!.dispose();
  }

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    listItemsSubCategoriesNotifier = ValueNotifier(null);
    listItemDistrictSelectedNotifier = ValueNotifier(null);
    listDistrictNotifier = ValueNotifier(null);
  }

  @override
  Future<List<ItemSubCategoryEntity>?> getItemsSubCategory(
      {required String idSubCategorySelected}) async {
    try {
      state!.value = UILoadingState();

      listItemDistrictSelectedNotifier!.value = [];

      listItemsSubCategoriesNotifier!.value = await getItemsSubCategorySelected(
          GetSubCategoryParams(idSubCategory: idSubCategorySelected));

      listItemsSubCategoriesNotifier!.value!
          .sort((a, b) => a.district!.compareTo(b.district!));

      state!.value =
          UISucessState('Items da Subcategoria carregada com sucesso !');

      return listItemsSubCategoriesNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState('errorMessage');
    }
  }

  @override
  List<String>? loadDistricts() {
    try {
      state!.value = UILoadingState();

      listDistrictNotifier!.value = listItemsSubCategoriesNotifier!.value!
          .map((subCategory) => subCategory.district!)
          .toSet()
          .toList();

      listDistrictNotifier!.value!.sort((a, b) => a.compareTo(b));

      state!.value = UISucessState('Bairros carregados com sucesso.');

      return listDistrictNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState('errorMessage');
    }
  }

  @override
  List<ItemSubCategoryEntity>? getItemsSubCategoryByDistrict(
      {required String districtSelected}) {
    try {
      state!.value = UILoadingState();

      listItemDistrictSelectedNotifier!.value = listItemsSubCategoriesNotifier!
          .value!
          .where((subCategory) => subCategory.district == districtSelected)
          .toList();

      state!.value = UISucessState('Dicas carregadas por bairro com sucesso.');

      return listItemsSubCategoriesNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState('errorMessage');
    }
  }
}
