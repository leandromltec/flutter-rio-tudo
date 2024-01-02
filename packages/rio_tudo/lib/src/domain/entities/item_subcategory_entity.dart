import 'package:equatable/equatable.dart';

class ItemSubCategoryEntity extends Equatable {
  final String? titleTip;
  final String? district;
  final String? urlInstagram;

  const ItemSubCategoryEntity(
      {this.titleTip, this.district, this.urlInstagram});

  @override
  List<Object?> get props => [titleTip, district, urlInstagram];
}
