import '../../domain/entities/category_entity.dart';

class CategoryModel {
  final String title;
  final String urlImage;

  const CategoryModel({required this.title, required this.urlImage});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(title: map['title'], urlImage: map['urlImage']);
  }

  CategoryEntity toEntity() => CategoryEntity(title: title, urlImage: urlImage);
}
