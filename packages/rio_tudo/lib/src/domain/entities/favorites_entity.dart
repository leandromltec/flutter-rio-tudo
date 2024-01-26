/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

class FavoritesEntity extends Equatable {
  final String? titleNoFavorites;
  final String? descriptionFavorites;
  final String? textNumberMaxFavorites;

  const FavoritesEntity(
      {this.titleNoFavorites,
      this.descriptionFavorites,
      this.textNumberMaxFavorites});

  @override
  List<Object?> get props =>
      [titleNoFavorites, descriptionFavorites, textNumberMaxFavorites];
}
