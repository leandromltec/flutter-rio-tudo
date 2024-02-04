import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockListInfluencerEntity {
  static List<InfluencerEntity> mockListInfluencerEntity() {
    var faker = Faker();

    List<InfluencerEntity> mockListInfluencer = [];

    InfluencerEntity mocInfluencer = InfluencerEntity(
        titleInfluencer: faker.lorem.toString(),
        urlLinkInfluencer: faker.lorem.toString());

    mockListInfluencer.add(mocInfluencer);

    return mockListInfluencer;
  }
}
