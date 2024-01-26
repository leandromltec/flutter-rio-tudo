/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

/* Contato - riotudorj@gmail.com */
/* 2024 - Todos os direitos reservados */

import '../../domain/entities/entities.dart';

class ConfigsScreenModel {
  String? titleTopHome;
  String? titleTopInfluencer;
  String? titleTopFavorites;
  int? maxFavorites;

  ConfigsScreenModel(
      {this.titleTopHome,
      this.titleTopInfluencer,
      this.titleTopFavorites,
      this.maxFavorites});

  factory ConfigsScreenModel.fromJson(Map<String, dynamic> map) {
    return ConfigsScreenModel(
        titleTopHome: map['titleTopHome'],
        titleTopInfluencer: map['titleTopInfluencer'],
        titleTopFavorites: map['titleTopFavorites'],
        maxFavorites: map['maxFavorites']);
  }

  ConfigsScreenEntity toEntity() => ConfigsScreenEntity(
      titleTopHome: titleTopHome,
      titleTopInfluencer: titleTopInfluencer,
      titleTopFavorites: titleTopFavorites,
      maxFavorites: maxFavorites);
}
