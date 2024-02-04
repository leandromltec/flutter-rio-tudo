import 'package:faker/faker.dart';

class MockCategoryJson {
  static String mockListCategoryJson() {
    var faker = Faker();

    StringBuffer fakerJson = StringBuffer();
    fakerJson.write(
        '[{"title":"${faker.lorem.word().toString()}","subCategory":[{"title":"${faker.lorem.word().toString()}",');

    fakerJson.write(
        '"urlImage":"${faker.lorem.word().toString()}","idSubCategory":"${faker.lorem.word().toString()}"},');

    fakerJson.write(
        '{"title":"${faker.lorem.word().toString()}","urlImage":"${faker.lorem.word().toString()}","idSubCategory":"${faker.lorem.word().toString()}"},');

    fakerJson.write(
        '{"title":"${faker.lorem.word().toString()}","urlImage":"${faker.lorem.word().toString()}","idSubCategory":"rooftop"}]}]');

    return fakerJson.toString();
  }
}
