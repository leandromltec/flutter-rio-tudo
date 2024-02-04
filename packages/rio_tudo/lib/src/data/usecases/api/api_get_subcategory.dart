/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:rio_tudo/src/data/models/models.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class ApiGetSubCategory implements GetSubCategoryItems {
  final String baseUrl;
  dynamic httpClient = http.Client();

  ApiGetSubCategory({required this.baseUrl, httpClient});

  @override
  Future<List<ItemSubCategoryEntity>?> call(
      GetSubCategoryParams? params) async {
    dynamic response;

    try {
      response =
          await httpClient.get(Uri.parse(baseUrl + params!.idSubCategory));

      List<ItemSubCategoryModel>? listItemSubCategoryModel = [];

      listItemSubCategoryModel =
          (jsonDecode(response.body)['itemSubCategories'] as List)
              .map((e) => ItemSubCategoryModel.fromJson(e))
              .toList();

      return listItemSubCategoryModel
          .map<ItemSubCategoryEntity>((e) => e.toEntity())
          .toList();
    } catch (error) {
      if (response == null) {
        throw HttpException;
      } else if (response.statusCode == 404) {
        throw HttpException;
      } else {
        throw FormatException;
      }
    }
  }
}
