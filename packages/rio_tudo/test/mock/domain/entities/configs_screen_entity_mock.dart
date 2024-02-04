import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockConfigsScreenEntity {
  static ConfigsScreenEntity mockConfigsScreenEntity() {
    var faker = Faker();

    ConfigsScreenEntity configsScreenEntityMock = ConfigsScreenEntity(
      titleTopHome: faker.lorem.toString(),
      titleTopInfluencer: faker.lorem.toString(),
      titleTopFavorites: faker.lorem.toString(),
      maxFavorites: 10,
    );

    return configsScreenEntityMock;
  }
}
