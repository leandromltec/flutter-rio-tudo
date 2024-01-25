import 'package:config/config.dart';

import '../../../data/usecases/api/api.dart';

makeGetAllCategories() {
  return ApiGetAllCategories(baseUrl: Urls.endPointCategory);
}
