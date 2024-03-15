/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import '../entities/entities.dart';

abstract class GetInfo {
  Future<InfoEntity?>? call();
}
