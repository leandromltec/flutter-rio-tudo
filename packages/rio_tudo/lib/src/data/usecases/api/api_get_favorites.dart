/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

import 'package:config/config.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/favorites_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/favorites_model.dart';

class ApiGetFavorites extends GetFavorites {
  String baserUrl;

  ApiGetFavorites({required this.baserUrl});

  @override
  Future<FavoritesEntity?>? call() async {
    dynamic response;
    try {
      response = await http.get(Uri.parse(baserUrl));

      FavoritesModel? favoritesModel;

      favoritesModel = FavoritesModel.fromJson((jsonDecode(response.body)[0]));

      return favoritesModel.toEntity();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
      rethrow;
    }
  }
}
