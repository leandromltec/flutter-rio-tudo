import 'dart:async';

import 'package:flutter/material.dart';

import '../service_locator/injector_getit.dart';

abstract class SetupGetItInterface {
  Map<String, WidgetBuilder>? routes();
  List<Widget>? providers(InjectorGetIt injectorGetIt);
  FutureOr<void> loadServices(InjectorGetIt injectorGetIt);
}
