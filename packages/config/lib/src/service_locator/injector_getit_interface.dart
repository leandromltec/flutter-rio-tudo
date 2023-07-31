abstract class InjectorGetItInterface{
  void registerLazySingleton<T extends Object>(T instance);
  void registerSingleton<T extends Object>(T instance);
  T get<T extends Object>();

}