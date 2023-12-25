import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String title;
  final String urlImage;
  final String idCategory;

  const SubCategoryEntity(
      {required this.title, required this.urlImage, required this.idCategory});

  @override
  List<Object> get props => [title, urlImage, idCategory];
}
