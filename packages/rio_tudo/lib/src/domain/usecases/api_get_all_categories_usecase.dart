/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import '../entities/entities.dart';

//Chamada call - pode usar qualquer nome para realizar a chamada
abstract class GetAllCategories {
  Future<List<CategoryEntity>?>? call();
}
