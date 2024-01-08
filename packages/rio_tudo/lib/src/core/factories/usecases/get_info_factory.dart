import 'package:config/config.dart';
import 'package:rio_tudo/src/data/usecases/api/api_get_info.dart';

makeGetInfo() {
  return ApiGetInfo(baserUrl: Urls.endPointInfo);
}
