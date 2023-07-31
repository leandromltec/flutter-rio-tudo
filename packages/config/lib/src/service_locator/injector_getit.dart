

import 'package:get_it/get_it.dart';

import 'injector_getit_interface.dart';

//._() - construtor privado nomeado (não permite ser instanciada fora da biblioteca)

class InjectorGetIt implements InjectorGetItInterface {
  late GetIt _getIt;
  static InjectorGetIt? _instance;

   InjectorGetIt._(){
    _getIt = GetIt.instance;
  }

  static InjectorGetIt get instance{
    _instance ??= InjectorGetIt._();
    return _instance!;
  }

 

  @override
  T get<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(T instance,
          {String? instanceName}) =>
      _getIt.registerLazySingleton<T>(() => instance,
          instanceName: instanceName);

  @override
  void registerSingleton<T extends Object>(T instance,
          {String? instanceName}) =>
      _getIt.registerLazySingleton<T>(() => instance,
          instanceName: instanceName);
}
