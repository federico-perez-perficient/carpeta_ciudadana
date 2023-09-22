import 'package:flutter/material.dart';

import 'package:carpeta_ciudadana/my_app.dart';
import 'package:carpeta_ciudadana/core/di/dependency_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final injectionContainerImpl = InjectionContainerImpl();
  await injectionContainerImpl.init();

  runApp(AppState(injectionContainerImpl: injectionContainerImpl));
}
