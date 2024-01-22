import 'package:equatable/equatable.dart';

class ItemSubCategoryEntity extends Equatable {
  String? titleTip;
  String? district;
  String? urlInstagram;
  bool? isFavorite;

  ItemSubCategoryEntity(
      {this.titleTip, this.district, this.urlInstagram, this.isFavorite});

  @override
  List<Object?> get props => [titleTip, district, urlInstagram, isFavorite];
}
