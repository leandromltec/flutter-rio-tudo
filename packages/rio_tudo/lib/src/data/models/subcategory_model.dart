import '../../domain/entities/entities.dart';
import 'models.dart';

class SubCategoryModel {
  String? subCategory;
  String? idSubCategory;
  List<ItemSubCategoryModel>? listItemSubCategory;

  SubCategoryModel(
      {this.subCategory, this.idSubCategory, this.listItemSubCategory});

  factory SubCategoryModel.fromJson(Map<String, dynamic> map) {
    return SubCategoryModel(
        subCategory: map['subCategory'],
        idSubCategory: map['idSubCategory'],
        listItemSubCategory: (map['subCategories'] as List)
            .map((e) => ItemSubCategoryModel.fromJson(e))
            .toList());
  }

  SubCategoryEntity toEntity() => SubCategoryEntity(
      subCategory: subCategory,
      idSubCategory: idSubCategory,
      listItemSubCategory:
          listItemSubCategory!.map((e) => e.toEntity()).toList());
}
