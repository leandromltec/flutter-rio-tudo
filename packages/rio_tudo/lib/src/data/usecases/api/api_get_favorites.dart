/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/favorites_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/favorites_model.dart';

class ApiGetFavorites extends GetFavorites {
  String baseUrl;
  dynamic httpClient = http.Client();

  ApiGetFavorites({required this.baseUrl, httpClient});

  @override
  Future<FavoritesEntity?>? call() async {
    dynamic response;
    try {
      response = await httpClient.get(Uri.parse(baseUrl));

      FavoritesModel? favoritesModel;

      favoritesModel = FavoritesModel.fromJson((jsonDecode(response.body)[0]));

      return favoritesModel.toEntity();
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
