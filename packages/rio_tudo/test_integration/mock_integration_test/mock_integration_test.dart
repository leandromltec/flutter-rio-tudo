import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockCategoryEntityIntegrationTest {
  static List<CategoryEntity>? mockCategoryEntityIntegrationTest() {
    List<CategoryEntity> mockListCategory = [];
    List<SubCategoryEntity> mockListSub = [];

    SubCategoryEntity subCategoryMock = const SubCategoryEntity(
        title: 'Restaurante com vista',
        idSubCategory: 'almocovista',
        urlImage:
            'https://www.carpemundi.com.br/wp-content/uploads/2022/12/aprazivel.jpg');

    mockListSub.add(subCategoryMock);

    CategoryEntity categoryMock =
        CategoryEntity(title: 'Vista', subCategory: mockListSub);

    mockListCategory.add(categoryMock);

    return mockListCategory;
  }
}
