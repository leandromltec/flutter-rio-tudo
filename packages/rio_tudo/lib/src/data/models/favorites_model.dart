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
