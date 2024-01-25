import 'package:config/config.dart';
import '../../../data/usecases/api/api.dart';

makeGetFavorites() {
  return ApiGetFavorites(baserUrl: Urls.endPointFavorites);
}
