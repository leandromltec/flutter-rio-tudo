/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:config/config.dart';
import '../../../data/usecases/api/api.dart';

makeGetFavorites() {
  return ApiGetFavorites(baseUrl: Urls.endPointFavorites);
}
