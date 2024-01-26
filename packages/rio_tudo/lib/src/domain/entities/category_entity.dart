/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

import 'entities.dart';

//Entity - recebe o model e se conecta ao gerencia de estado para exibição de informações na tela
class CategoryEntity extends Equatable {
  final String title;
  final List<SubCategoryEntity> subCategory;

  const CategoryEntity({required this.title, required this.subCategory});

  @override
  List<Object> get props => [title, subCategory];
}
