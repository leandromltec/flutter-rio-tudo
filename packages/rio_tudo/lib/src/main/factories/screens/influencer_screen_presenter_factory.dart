import 'package:rio_tudo/src/main/factories/usecases/usecases_factories.dart';

import '../../../presentation/value_notifier/value_notifier.dart';

makeInfluencerPresenter() =>
    ValueNotifierInfluencerPresenter(getInfluencers: makeAllInfluencers());
