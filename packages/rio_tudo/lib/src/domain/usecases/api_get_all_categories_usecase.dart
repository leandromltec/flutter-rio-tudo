import '../entities/entities.dart';

abstract class GetAllCategories {
  Future<List<CategoryEntity>?> call();
}
