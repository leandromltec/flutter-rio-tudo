import '../../domain/entities/entities.dart';
import 'models.dart';

class CategoryModel {
  final String title;
  final String urlImage;
  final String idSubCategory;

  const CategoryModel(
      {required this.title,
      required this.urlImage,
      required this.idSubCategory});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
        title: map['title'],
        urlImage: map['urlImage'],
        idSubCategory: map['idSubCategory']);
  }

  CategoryEntity toEntity() => CategoryEntity(
      title: title, urlImage: urlImage, idSubCategory: idSubCategory);
}
