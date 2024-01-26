/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

class ConfigsScreenEntity extends Equatable {
  final String? titleTopHome;
  final String? titleTopInfluencer;
  final String? titleTopFavorites;
  final int? maxFavorites;

  const ConfigsScreenEntity(
      {this.titleTopHome,
      this.titleTopInfluencer,
      this.titleTopFavorites,
      this.maxFavorites});

  @override
  List<Object?> get props =>
      [titleTopHome, titleTopInfluencer, titleTopFavorites, maxFavorites];
}
