import '../usecases/usecases_factories.dart';
import '../../../presentation/value_notifier/value_notifier.dart';

makeFavoritesPresenter() =>
    ValueNotifierFavoritesPresenter(getFavorites: makeGetFavorites());
