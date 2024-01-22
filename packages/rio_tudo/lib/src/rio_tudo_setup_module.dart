import 'dart:async';
import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:flutter/material.dart';
import 'package:rio_tudo/src/core/factories/screens/favorites_screen_factory.dart';

import 'presentation/screen/screens.dart';
import 'core/factories/screens/screens_factories.dart';

class RioTudoSetupModule implements SetupGetItInterface {
  @override
  FutureOr<void> loadServices(InjectorGetIt injectorGetIt) async {
    injectorGetIt
        .registerLazySingleton<HomeScreenPresenter>(makeHomePresenter());
  }

  @override
  List<Widget>? providers(InjectorGetIt injectorGetIt) => [];

  @override
  Map<String, WidgetBuilder>? routes() {
    return {
      RoutesApp.HomeScreen: (BuildContext context) => makeHomeHomeScreen(),
      RoutesApp.SubCategoryScreen: (BuildContext context) =>
          makeSubCategoryScreen(),
      RoutesApp.InfluencerScreen: (BuildContext context) =>
          makeInfluencerScreen(),
      RoutesApp.FavoriteScreen: (BuildContext context) => makeFavoritesScreen(),
      RoutesApp.InfoScreen: (BuildContext context) => makeInfoScreen(),
    };
  }
}
