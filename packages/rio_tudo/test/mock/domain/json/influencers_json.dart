import 'package:faker/faker.dart';

class MockInfencerJson {
  static String mockInfencerJson() {
    var faker = Faker();

    String fakerJson =
        '[{"titleInfluencer":"${faker.lorem.word().toString()}","urlLinkInfluencer":"${faker.lorem.word().toString()}"}]';

    return fakerJson;
  }
}
