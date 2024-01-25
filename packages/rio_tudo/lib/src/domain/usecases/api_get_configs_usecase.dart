import '../entities/entities.dart';

abstract class GetConfigsScreen {
  Future<ConfigsScreenEntity?>? call();
}
