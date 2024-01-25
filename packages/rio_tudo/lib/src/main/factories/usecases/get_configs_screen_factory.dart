import 'package:config/config.dart';

import '../../../data/usecases/api/api.dart';

makeGetConfigsScreen() {
  return ApiGetConfigsScreen(baseUrl: Urls.endPointConfigsScreen);
}
