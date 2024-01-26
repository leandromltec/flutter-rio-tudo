/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String title;
  final String urlImage;
  final String idSubCategory;

  const SubCategoryEntity(
      {required this.title,
      required this.urlImage,
      required this.idSubCategory});

  @override
  List<Object?> get props => [title, urlImage, idSubCategory];
}
