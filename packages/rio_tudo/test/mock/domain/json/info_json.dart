import 'package:faker/faker.dart';

class MockInfoJson {
  static String mockInfoJson() {
    var faker = Faker();

    StringBuffer fakerJson = StringBuffer();
    fakerJson.write(
        '[{"titleInfo":"${faker.lorem.word()}","firstDescription":"${faker.lorem.word()}","secondDescription":"${faker.lorem.word()}","titleDev":"${faker.lorem.word()}",');
    fakerJson.write(
        '"devDescription":"${faker.lorem.word()}","copyRights":"${faker.lorem.word()}","developedBy":"${faker.lorem.word()}","firstDescriptionDev":"${faker.lorem.word()}",');
    fakerJson.write(
        '"titleContact":"${faker.lorem.word()}","contact":"${faker.lorem.word()}","textSnackBarContact":"${faker.lorem.word()}",');
    fakerJson.write(
        '"images":[{"titleImage":"${faker.lorem.word()}","urlImage":"${faker.lorem.word()}"}]}]');

    return fakerJson.toString();
  }
}
