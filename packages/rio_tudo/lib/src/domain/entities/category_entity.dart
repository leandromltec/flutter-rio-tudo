import 'package:equatable/equatable.dart';
import 'entities.dart';

class CategoryEntity extends Equatable {
  final String title;
  final String urlImage;
  final String idSubCategory;

  const CategoryEntity(
      {required this.title,
      required this.urlImage,
      required this.idSubCategory});

  @override
  List<Object> get props => [title, urlImage, idSubCategory];
}
