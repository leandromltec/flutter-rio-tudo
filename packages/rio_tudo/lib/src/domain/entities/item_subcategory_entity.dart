/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ItemSubCategoryEntity extends Equatable {
  final String? titleTip;
  final String? district;
  final String? urlInstagram;
  bool? isFavorite;

  ItemSubCategoryEntity(
      {this.titleTip, this.district, this.urlInstagram, this.isFavorite});

  @override
  List<Object?> get props => [titleTip, district, urlInstagram, isFavorite];
}
