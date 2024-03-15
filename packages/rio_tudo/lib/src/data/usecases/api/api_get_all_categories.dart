/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/models.dart';

import 'dart:async';
import 'dart:io';

class ApiGetAllCategories implements GetAllCategories {
  final String baseUrl;
  dynamic httpClient = http.Client();

  ApiGetAllCategories({required this.baseUrl, httpClient});

  @override
  Future<List<CategoryEntity>?> call() async {
    dynamic response;

    try {
      response = await httpClient!.get(Uri.parse(baseUrl));

      return await compute((message) => _parseCategoryModel(response.body), response.body);


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

  static List<CategoryEntity>? _parseCategoryModel(String response) {
     List<CategoryModel>? listCategoryModel = [];

     listCategoryModel = (jsonDecode(response) as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return listCategoryModel
          .map<CategoryEntity>((e) => e.toEntity())
          .toList();
  }
}
