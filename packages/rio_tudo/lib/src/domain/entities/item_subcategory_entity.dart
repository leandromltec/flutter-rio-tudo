import 'package:equatable/equatable.dart';

class ItemSubCategoryEntity extends Equatable {
  String? titleTip;
  String? district;
  String? urlInstagram;

  ItemSubCategoryEntity({this.titleTip, this.district, this.urlInstagram});

  @override
  List<Object?> get props => [titleTip, district, urlInstagram];
}
