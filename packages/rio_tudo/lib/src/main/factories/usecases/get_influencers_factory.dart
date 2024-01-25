import 'package:config/config.dart';

import '../../../data/usecases/api/api.dart';

makeAllInfluencers() {
  return ApiGetInfluencers(urlBase: Urls.endPointInfluencers);
}
