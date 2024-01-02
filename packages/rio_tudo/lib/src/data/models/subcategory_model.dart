import '../../domain/entities/entities.dart';

class SubCategoryModel {
  final String title;
  final String urlImage;
  final String idSubCategory;

  const SubCategoryModel(
      {required this.title,
      required this.urlImage,
      required this.idSubCategory});

  factory SubCategoryModel.fromJson(Map<String, dynamic> map) {
    return SubCategoryModel(
        title: map['title'],
        urlImage: map['urlImage'],
        idSubCategory: map['idSubCategory']);
  }

  SubCategoryEntity toEntity() => SubCategoryEntity(
      title: title, urlImage: urlImage, idSubCategory: idSubCategory);
}
