import 'dart:async';

import 'package:config/src/service_locator/injector_getit.dart';
import 'package:config/src/setup_getit/setup.dart';
import 'package:flutter/material.dart';

class SetupGetit implements SetupGetItLoadInterface {
  Map<String, WidgetBuilder>? _routes;
  List<Widget>? _providers;

  SetupGetit(){
    _providers = [];
    _routes= {};
  }

  @override
  List<Widget>? get providers => _providers;

  @override
  Map<String, WidgetBuilder>? get routes => _routes;

  @override
  Future<void> setupServices(List<SetupGetItInterface> setupModules) async {
    for (SetupGetItInterface setupModule in setupModules) {
      await setupModule.loadServices(InjectorGetIt.instance);
      if (setupModule.providers(InjectorGetIt.instance) != null) {
        _providers!.addAll(setupModule.providers(InjectorGetIt.instance) ?? []);
      }
      if (setupModule.routes() != null) {
        _routes!.addAll(setupModule.routes()!);
      }
    }
  }
}
