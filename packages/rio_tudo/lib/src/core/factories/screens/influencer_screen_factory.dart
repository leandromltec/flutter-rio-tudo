import 'influencer_screen_presenter_factory.dart';
import '../../../../rio_tudo.dart';

makeInfluencerScreen() => InfluencersScreen(
      presenterInfluencer: makeInfluencerPresenter(),
    );
