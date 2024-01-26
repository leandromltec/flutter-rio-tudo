/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

import 'entities.dart';

class InfoEntity extends Equatable {
  final String? titleInfo;
  final String? firstDescription;
  final String? secondDescription;
  final String? observation;
  final String? titleDev;
  final String? devDescription;
  final String? copyRights;
  final String? developedBy;
  final String? firstDescriptionDev;
  final String? secondDescriptionDev;
  final String? titleContact;
  final String? contact;
  final String? textSnackBarContact;
  final List<ImageEntity>? listImages;

  const InfoEntity(
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

  @override
  List<Object?> get props => [
        titleInfo,
        firstDescription,
        secondDescription,
        observation,
        titleDev,
        devDescription,
        copyRights,
        developedBy,
        firstDescriptionDev,
        secondDescriptionDev,
        titleContact,
        contact,
        textSnackBarContact,
        listImages
      ];
}
