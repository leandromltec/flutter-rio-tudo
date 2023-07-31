import 'dart:async';

import 'package:config/src/setup_getit/setup.dart';
import 'package:flutter/material.dart';

abstract class SetupGetItLoadInterface {
 Map<String, WidgetBuilder>? get routes;
 List<Widget>? get providers;
 Future<void> setupServices(List<SetupGetItInterface> setupModules);
}
