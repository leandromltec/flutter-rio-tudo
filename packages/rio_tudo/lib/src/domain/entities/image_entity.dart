/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String? titleImage;
  final String? urlImage;

  const ImageEntity({this.titleImage, this.urlImage});

  @override
  List<Object?> get props => [titleImage, urlImage];
}
