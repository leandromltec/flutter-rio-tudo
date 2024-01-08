import 'package:rio_tudo/src/data/models/image_model.dart';

import '../../domain/entities/entities.dart';

class InfoModel {
  String? titleInfo;
  String? firstDescription;
  String? secondDescription;
  String? observation;
  String? titleDev;
  String? devDescription;
  String? copyRights;
  String? developedBy;
  String? firstDescriptionDev;
  String? secondDescriptionDev;
  String? titleContact;
  String? contact;
  String? textSnackBarContact;
  List<ImageModel>? listImages;

  InfoModel(
      {this.titleInfo,
      this.firstDescription,
      this.secondDescription,
      this.observation,
      this.titleDev,
      this.devDescription,
      this.copyRights,
      this.developedBy,
      this.firstDescriptionDev,
      this.secondDescriptionDev,
      this.titleContact,
      this.contact,
      this.textSnackBarContact,
      this.listImages});

  factory InfoModel.fromJson(Map<String, dynamic> map) {
    return InfoModel(
        titleInfo: map['titleInfo'],
        firstDescription: map['firstDescription'],
        secondDescription: map['firstDescription'],
        observation: map['observation'],
        titleDev: map['titleDev'],
        devDescription: map['devDescription'],
        copyRights: map['copyRights'],
        developedBy: map['developedBy'],
        firstDescriptionDev: map['firstDescriptionDev'],
        secondDescriptionDev: map['secondDescriptionDev'],
        titleContact: map['titleContact'],
        contact: map['contact'],
        textSnackBarContact: map['textSnackBarContact'],
        listImages: (map['images'] as List)
            .map((e) => ImageModel.fromJson(e))
            .toList());
  }

  InfoEntity toEntity() => InfoEntity(
      titleInfo: titleInfo,
      firstDescription: firstDescription,
      secondDescription: secondDescription,
      observation: observation,
      titleDev: titleDev,
      devDescription: devDescription,
      copyRights: copyRights,
      developedBy: developedBy,
      firstDescriptionDev: firstDescriptionDev,
      secondDescriptionDev: secondDescriptionDev,
      titleContact: titleContact,
      contact: contact,
      textSnackBarContact: textSnackBarContact,
      listImages: (listImages!).map<ImageEntity>((e) => e.toEntity()).toList());
}
