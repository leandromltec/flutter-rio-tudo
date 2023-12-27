import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rio_tudo/src/data/models/models.dart';
import '../../../domain/entities/subcategory_entity.dart';
import '../../../domain/usecases/usecases.dart';

class ApiGetSubCategory implements GetSubCategory {
  final String baseUrl;

  ApiGetSubCategory({required this.baseUrl});

  @override
  Future<SubCategoryEntity?>? call(GetSubCategoryParams? params) async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + params!.idSubCategory));

      SubCategoryModel? subCategoryModel;

      subCategoryModel = SubCategoryModel.fromJson((jsonDecode(response.body)));

      return subCategoryModel.toEntity();
    } catch (error) {
      print(error);
    }
  }
}
