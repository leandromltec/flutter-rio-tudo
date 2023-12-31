import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/models.dart';

class ApiGetAllCategories implements GetAllCategories {
  final String baseUrl;

  ApiGetAllCategories({required this.baseUrl});

  @override
  Future<List<CategoryEntity>?> call() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      List<CategoryModel>? listCategoryModel = [];

      listCategoryModel = (jsonDecode(response.body) as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return listCategoryModel
          .map<CategoryEntity>((e) => e.toEntity())
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
