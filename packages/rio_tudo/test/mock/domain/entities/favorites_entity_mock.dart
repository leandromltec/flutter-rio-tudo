import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockFavoriteEntity {
  static FavoritesEntity mockFavoriteEntity() {
    var faker = Faker();

    FavoritesEntity favoritesEntityMock = FavoritesEntity(
        titleNoFavorites: faker.lorem.toString(),
        descriptionFavorites: faker.lorem.toString(),
        textNumberMaxFavorites: faker.lorem.toString());

    return favoritesEntityMock;
  }
}
