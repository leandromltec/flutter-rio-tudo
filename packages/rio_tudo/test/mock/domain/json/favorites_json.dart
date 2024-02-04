import 'package:faker/faker.dart';

class MockFavoritesJson {
  static String mockFavoritesJson() {
    var faker = Faker();

    String fakerJson =
        '[{"titleNoFavorites":"${faker.lorem.word().toString()}","descriptionFavorites":"${faker.lorem.word().toString()}","textNumberMaxFavorites":"${faker.lorem.word().toString()}"}]';

    return fakerJson;
  }
}

String mapJson =
    '[{"titleNoFavorites":"* Nenhuma dica favorita","descriptionFavorites":"Para","textNumberMaxFavorites": "teste"}]';
