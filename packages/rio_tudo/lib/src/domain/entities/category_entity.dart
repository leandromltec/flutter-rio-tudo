/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */
import 'entities.dart';

//Entity - recebe o model e se conecta ao gerencia de estado para exibição de informações na tela
class CategoryEntity {
  final String title;
  final List<SubCategoryEntity> subCategory;

  const CategoryEntity({required this.title, required this.subCategory});
}
