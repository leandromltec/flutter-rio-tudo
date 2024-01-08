import '../../../../rio_tudo.dart';
import 'info_screen_presenter_factory.dart';

makeInfoScreen() => InfoScreen(
      presenterInfo: makeInfoPresenter(),
    );
