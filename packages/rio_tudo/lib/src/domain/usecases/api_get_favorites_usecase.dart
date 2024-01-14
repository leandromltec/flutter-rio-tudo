import '../entities/entities.dart';

abstract class GetFavorites {
  Future<FavoritesEntity?>? call();
}
