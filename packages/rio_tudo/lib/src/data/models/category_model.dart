import '../../domain/entities/entities.dart';
import 'models.dart';

class CategoryModel {
  final String title;
  final List<SubCategoryModel> subCategory;

  const CategoryModel({required this.title, required this.subCategory});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
        title: map['title'],
        subCategory: (map['subCategory'] as List)
            .map((e) => SubCategoryModel.fromJson(e))
            .toList());
  }

  CategoryEntity toEntity() => CategoryEntity(
      title: title,
      subCategory:
          (subCategory).map<SubCategoryEntity>((e) => e.toEntity()).toList());
}
