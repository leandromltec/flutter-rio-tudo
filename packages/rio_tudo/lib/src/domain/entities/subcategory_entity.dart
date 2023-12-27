import 'package:equatable/equatable.dart';
import 'entities.dart';

class SubCategoryEntity extends Equatable {
  final String? subCategory;
  final String? idSubCategory;
  final List<ItemSubCategoryEntity>? listItemSubCategory;

  const SubCategoryEntity(
      {this.subCategory, this.idSubCategory, this.listItemSubCategory});

  @override
  List<Object?> get props => [subCategory, idSubCategory, listItemSubCategory];
}
