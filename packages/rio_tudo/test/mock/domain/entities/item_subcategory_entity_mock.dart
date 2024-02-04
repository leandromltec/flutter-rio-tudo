import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockItemSubCategoryEntity {
  static ItemSubCategoryEntity mockItemSubCategoryEntity() {
    var faker = Faker();

    ItemSubCategoryEntity itemSubCategoryEntityMock = ItemSubCategoryEntity(
      titleTip: faker.lorem.toString(),
      district: faker.lorem.toString(),
      urlInstagram: faker.lorem.toString(),
      isFavorite: true,
    );

    return itemSubCategoryEntityMock;
  }
}
