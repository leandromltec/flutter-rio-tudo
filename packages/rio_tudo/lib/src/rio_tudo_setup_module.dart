import 'dart:async';

import 'package:config/config.dart';
import 'package:config/src/service_locator/injector_getit.dart';
import 'package:flutter/material.dart';

import 'package:rio_tudo/src/presentation/pages/pages.dart';

class RioTudoSetupModule implements SetupGetItInterface {
  @override
  FutureOr<void> loadServices(InjectorGetIt injectorGetIt) => [];

  @override
  List<Widget>? providers(InjectorGetIt injectorGetIt) => [];

  @override
  Map<String, WidgetBuilder>? routes() {
    return {
      RoutesApp.HomeScreen: (BuildContext context) => HomeScreen(),
      RoutesApp.InfluencerScreen: (BuildContext context) => InfluencersScreen(),
      RoutesApp.FavoriteScreen: (BuildContext context) => FavoriteScreen(),
      RoutesApp.InfoScreen: (BuildContext context) => InfoScreen(),
    };
  }
}
