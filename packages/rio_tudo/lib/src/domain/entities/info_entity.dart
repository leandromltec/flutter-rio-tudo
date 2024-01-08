import 'entities.dart';

class InfoEntity {
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
  List<ImageEntity>? listImages;

  InfoEntity(
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
}
