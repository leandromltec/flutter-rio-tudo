import 'package:faker/faker.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

class MockListInfoEntity {
  static InfoEntity mockInfoEntity() {
    var faker = Faker();

    List<ImageEntity>? listImagesMock = [];
    listImagesMock.add(ImageEntity(
        titleImage: faker.lorem.toString(), urlImage: faker.lorem.toString()));

    InfoEntity infoEntityMock = InfoEntity(
      titleInfo: faker.lorem.toString(),
      firstDescription: faker.lorem.toString(),
      secondDescription: faker.lorem.toString(),
      observation: faker.lorem.toString(),
      titleDev: faker.lorem.toString(),
      devDescription: faker.lorem.toString(),
      copyRights: faker.lorem.toString(),
      developedBy: faker.lorem.toString(),
      firstDescriptionDev: faker.lorem.toString(),
      secondDescriptionDev: faker.lorem.toString(),
      titleContact: faker.lorem.toString(),
      contact: faker.lorem.toString(),
      textSnackBarContact: faker.lorem.toString(),
      listImages: listImagesMock,
    );

    return infoEntityMock;
  }

  static InfoEntity mockInfoEntityEmptyInfo() {
    var faker = Faker();

    List<ImageEntity>? listImagesMock = [];
    listImagesMock.add(ImageEntity(
        titleImage: faker.lorem.toString(), urlImage: faker.lorem.toString()));

    InfoEntity infoEntityMock = InfoEntity(
      titleInfo: '',
      firstDescription: faker.lorem.toString(),
      secondDescription: faker.lorem.toString(),
      observation: faker.lorem.toString(),
      titleDev: '',
      devDescription: faker.lorem.toString(),
      copyRights: '',
      developedBy: faker.lorem.toString(),
      firstDescriptionDev: faker.lorem.toString(),
      secondDescriptionDev: faker.lorem.toString(),
      titleContact: faker.lorem.toString(),
      contact: faker.lorem.toString(),
      textSnackBarContact: faker.lorem.toString(),
      listImages: listImagesMock,
    );

    return infoEntityMock;
  }
}
