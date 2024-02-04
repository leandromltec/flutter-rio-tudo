import 'package:faker/faker.dart';

class MockConfiScreenJson {
  static String mockConfiScreenJson() {
    var faker = Faker();

    String fakerJson =
        '[{"titleTopHome":"${faker.lorem.word().toString()}","titleTopInfluencer":"${faker.lorem.word().toString()}","titleTopFavorites":"${faker.lorem.word().toString()}", "maxFavorites":${10}}]';

    return fakerJson;
  }
}
