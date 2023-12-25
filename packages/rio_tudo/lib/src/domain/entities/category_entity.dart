import 'package:equatable/equatable.dart';
import 'entities.dart';

class CategoryEntity extends Equatable {
  final String title;
  final List<SubCategoryEntity> subCategory;

  const CategoryEntity({required this.title, required this.subCategory});

  @override
  List<Object> get props => [title, subCategory];
}
