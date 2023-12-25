import '../../domain/entities/entities.dart';

class SubCategoryModel {
  final String title;
  final String urlImage;
  final String idCategory;

  const SubCategoryModel(
      {required this.title, required this.urlImage, required this.idCategory});

  factory SubCategoryModel.fromJson(Map<String, dynamic> map) {
    return SubCategoryModel(
        title: map['title'],
        urlImage: map['urlImage'],
        idCategory: map['idCategory']);
  }

  SubCategoryEntity toEntity() => SubCategoryEntity(
      title: title, urlImage: urlImage, idCategory: idCategory);
}
