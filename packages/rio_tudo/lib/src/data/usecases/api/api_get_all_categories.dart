/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

import 'package:config/config.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/models.dart';

class ApiGetAllCategories implements GetAllCategories {
  final String baseUrl;
  dynamic httpClient = http.Client();

  ApiGetAllCategories({required this.baseUrl, httpClient});

  @override
  Future<List<CategoryEntity>?> call() async {
    dynamic response;

    try {
      response = await httpClient!.get(Uri.parse(baseUrl));

      List<CategoryModel>? listCategoryModel = [];

      listCategoryModel = (jsonDecode(response.body) as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return listCategoryModel
          .map<CategoryEntity>((e) => e.toEntity())
          .toList();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
    }
  }
}
