/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class GetSubCategoryItems {
  Future<List<ItemSubCategoryEntity>?> call(GetSubCategoryParams? params);
}

class GetSubCategoryParams extends Equatable {
  final String idSubCategory;

  const GetSubCategoryParams({required this.idSubCategory});

  @override
  List<Object?> get props => [idSubCategory];
}
