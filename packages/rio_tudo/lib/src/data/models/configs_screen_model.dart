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
