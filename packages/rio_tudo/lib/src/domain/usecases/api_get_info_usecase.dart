import '../entities/entities.dart';

abstract class GetInfo {
  Future<InfoEntity?>? call();
}
