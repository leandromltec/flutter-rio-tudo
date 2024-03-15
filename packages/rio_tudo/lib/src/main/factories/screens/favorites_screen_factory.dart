/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import '../../../../rio_tudo.dart';

import 'favorites_screen_presenter_factory.dart';

makeFavoritesScreen() => FavoriteScreen(
      presenterFavorites: makeFavoritesPresenter(),
    );
