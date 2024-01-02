import '../../domain/entities/entities.dart';

class ItemSubCategoryModel {
  String? titleTip;
  String? district;
  String? urlInstagram;

  ItemSubCategoryModel({this.titleTip, this.district, this.urlInstagram});

  factory ItemSubCategoryModel.fromJson(Map<String, dynamic> map) {
    return ItemSubCategoryModel(
        titleTip: map['titleTip'],
        district: map['district'],
        urlInstagram: map['urlInstagram']);
  }

  ItemSubCategoryEntity toEntity() => ItemSubCategoryEntity(
      titleTip: titleTip, district: district, urlInstagram: urlInstagram);
}
