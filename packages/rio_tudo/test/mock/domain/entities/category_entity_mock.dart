import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockListCategoryEntity {
  static List<CategoryEntity>? mockCategoryEntity() {
    var faker = Faker();

    List<CategoryEntity> mockListCategory = [];
    List<SubCategoryEntity> mockListSub = [];

    SubCategoryEntity subCategoryMock = SubCategoryEntity(
        title: faker.lorem.toString(),
        idSubCategory: 'subcategory',
        urlImage: faker.image.toString());

    mockListSub.add(subCategoryMock);

    CategoryEntity categoryMock = CategoryEntity(
        title: faker.lorem.random.toString(), subCategory: mockListSub);

    mockListCategory.add(categoryMock);

    return mockListCategory;
  }
}
