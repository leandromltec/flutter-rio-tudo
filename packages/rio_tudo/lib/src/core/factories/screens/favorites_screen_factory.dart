import '../../../../rio_tudo.dart';
import 'favorites_screen_presenter_factory.dart';

makeFavoritesScreen() => FavoriteScreen(
      presenterFavorites: makeFavoritesPresenter(),
    );
