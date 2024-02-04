import 'package:faker/faker.dart';

class MockListSubCategoryJson {
  static String mockListSubCategoryJson() {
    var faker = Faker();

    StringBuffer fakerJson = StringBuffer();
    fakerJson.write(
        '{"itemSubCategories":[{"titleTip":"${faker.lorem.word()}","district":"${faker.lorem.word()}","urlInstagram":"${faker.lorem.word()}"},');

    fakerJson.write(
        '{"titleTip":"${faker.lorem.word()}","district":"${faker.lorem.word()}","urlInstagram":"${faker.lorem.word()}"}]}');

    return fakerJson.toString();
  }
}
