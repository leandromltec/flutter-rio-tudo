import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockListSubCategoryEntity {
  static List<ItemSubCategoryEntity>? mockListSubCategoryEntity() {
    var faker = Faker();

    List<ItemSubCategoryEntity> mockLisSubCategory = [];

    ItemSubCategoryEntity subCategoryMock = ItemSubCategoryEntity(
      titleTip: faker.lorem.toString(),
      district: 'districtSelected',
      urlInstagram: faker.image.toString(),
    );

    mockLisSubCategory.add(subCategoryMock);

    return mockLisSubCategory;
  }
}
