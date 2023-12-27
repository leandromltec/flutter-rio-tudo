import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class GetSubCategory {
  Future<SubCategoryEntity?>? call(GetSubCategoryParams? params);
}

class GetSubCategoryParams extends Equatable {
  final String idSubCategory;

  const GetSubCategoryParams({required this.idSubCategory});

  @override
  List<Object?> get props => [idSubCategory];
}
