import 'package:config/config.dart';
import '../../../data/usecases/api/api.dart';

makeGetSubCategory() {
  return ApiGetSubCategory(baseUrl: Urls.endPointSubCategory);
}
