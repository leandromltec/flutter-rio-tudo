/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

/* Contato - riotudorj@gmail.com */
/* 2024 - Todos os direitos reservados */

import '../../domain/entities/entities.dart';

class FavoritesModel {
  String? titleNoFavorites;
  String? descriptionFavorites;
  String? textNumberMaxFavorites;

  FavoritesModel(
      {this.titleNoFavorites,
      this.descriptionFavorites,
      this.textNumberMaxFavorites});

  factory FavoritesModel.fromJson(Map<String, dynamic> map) {
    return FavoritesModel(
        titleNoFavorites: map['titleNoFavorites'],
        descriptionFavorites: map['descriptionFavorites'],
        textNumberMaxFavorites: map['textNumberMaxFavorites']);
  }

  FavoritesEntity toEntity() => FavoritesEntity(
      titleNoFavorites: titleNoFavorites,
      descriptionFavorites: descriptionFavorites,
      textNumberMaxFavorites: textNumberMaxFavorites);
}
