/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

// ignore: must_be_immutable
class ItemSubCategoryEntity {
  final String? titleTip;
  final String? district;
  final String? urlInstagram;
  bool? isFavorite;

  ItemSubCategoryEntity(
      {this.titleTip, this.district, this.urlInstagram, this.isFavorite});
}
