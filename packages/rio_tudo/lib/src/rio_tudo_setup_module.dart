/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:config/config.dart';
// ignore: implementation_imports
import 'package:config/src/service_locator/injector_getit.dart';

import 'main/factories/screens/screens_factories.dart';
import 'presentation/ui/screen/screens.dart';

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
