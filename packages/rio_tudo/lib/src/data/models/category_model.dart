/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

/* Contato - riotudorj@gmail.com */
/* 2024 - Todos os direitos reservados */

import '../../domain/entities/entities.dart';

import 'models.dart';

//Model - responsável pela criação do objeto
class CategoryModel {
  final String title;
  final List<SubCategoryModel> subCategory;

  const CategoryModel({required this.title, required this.subCategory});

//factory - cria objeto vindo da api do tipo map
  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
        title: map['title'],
        subCategory: (map['subCategory'] as List)
            .map((e) => SubCategoryModel.fromJson(e))
            .toList());
  }

  //toEntity - recebe o objeto do tipo model e converte para Enity
  //Enity - chamado pela gerencia de estado e informações exibidas na tela
  CategoryEntity toEntity() => CategoryEntity(
      title: title,
      subCategory:
          (subCategory).map<SubCategoryEntity>((e) => e.toEntity()).toList());
}
