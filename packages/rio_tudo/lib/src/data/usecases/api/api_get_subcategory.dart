import 'dart:convert';

import 'package:config/config.dart';
import 'package:http/http.dart' as http;
import 'package:rio_tudo/src/data/models/models.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class ApiGetSubCategory implements GetSubCategoryItems {
  final String baseUrl;

  ApiGetSubCategory({required this.baseUrl});

  @override
  Future<List<ItemSubCategoryEntity>?> call(
      GetSubCategoryParams? params) async {
    var response;

    try {
      response = await http.get(Uri.parse(baseUrl + params!.idSubCategory));

      List<ItemSubCategoryModel>? listItemSubCategoryModel;

      listItemSubCategoryModel =
          (jsonDecode(response.body)['itemSubCategories'] as List)
              .map((e) => ItemSubCategoryModel.fromJson(e))
              .toList();

      return listItemSubCategoryModel
          .map<ItemSubCategoryEntity>((e) => e.toEntity())
          .toList();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
    }
  }
}
