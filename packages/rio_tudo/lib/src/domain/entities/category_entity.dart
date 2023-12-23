import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String title;
  final String urlImage;

  const CategoryEntity({required this.title, required this.urlImage});

  @override
  List<Object> get props => [title, urlImage];
}
