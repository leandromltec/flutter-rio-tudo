/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import '../../../presentation/value_notifier/value_notifier.dart';
import '../usecases/usecases_factories.dart';

makeFavoritesPresenter() =>
    ValueNotifierFavoritesPresenter(getFavorites: makeGetFavorites());
