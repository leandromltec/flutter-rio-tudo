/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:config/config.dart';

import '../../../data/usecases/api/api.dart';

makeGetConfigsScreen() {
  return ApiGetConfigsScreen(baseUrl: Urls.endPointConfigsScreen);
}
