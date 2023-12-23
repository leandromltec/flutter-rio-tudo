import '../entities/category_entity.dart';

abstract class GetAllCategories {
  Future<List<CategoryEntity>?> call();
}
