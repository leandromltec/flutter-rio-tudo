/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

/* Contato - riotudorj@gmail.com */
/* 2024 - Todos os direitos reservados */

import '../../domain/entities/entities.dart';

class InfluencerModel {
  String titleInfluencer;
  String urlLinkInfluencer;

  InfluencerModel(
      {required this.titleInfluencer, required this.urlLinkInfluencer});

  factory InfluencerModel.fromJson(Map<String, dynamic> map) {
    return InfluencerModel(
        titleInfluencer: map['titleInfluencer'],
        urlLinkInfluencer: map['urlLinkInfluencer']);
  }
  InfluencerEntity toEntity() => InfluencerEntity(
      titleInfluencer: titleInfluencer, urlLinkInfluencer: urlLinkInfluencer);
}
