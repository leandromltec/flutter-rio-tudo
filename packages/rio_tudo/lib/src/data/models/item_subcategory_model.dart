import '../../domain/entities/entities.dart';

class ItemSubCategoryModel {
  String? titleTip;
  String? district;
  String? urlInstagram;
  bool? isFavorite;

  ItemSubCategoryModel(
      {this.titleTip, this.district, this.urlInstagram, this.isFavorite});

  factory ItemSubCategoryModel.fromJson(Map<String, dynamic> map) {
    return ItemSubCategoryModel(
        titleTip: map['titleTip'],
        district: map['district'],
        urlInstagram: map['urlInstagram']);
  }

  ItemSubCategoryEntity toEntity() => ItemSubCategoryEntity(
      titleTip: titleTip,
      district: district,
      urlInstagram: urlInstagram,
      isFavorite: isFavorite);
}
