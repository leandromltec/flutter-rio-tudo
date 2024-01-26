/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

/* Contato - riotudorj@gmail.com */
/* 2024 - Todos os direitos reservados */

import '../../domain/entities/entities.dart';

class ImageModel {
  String? titleImage;
  String? urlImage;

  ImageModel({this.titleImage, this.urlImage});

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(titleImage: map['titleImage'], urlImage: map['urlImage']);
  }

  ImageEntity toEntity() =>
      ImageEntity(titleImage: titleImage, urlImage: urlImage);
}
