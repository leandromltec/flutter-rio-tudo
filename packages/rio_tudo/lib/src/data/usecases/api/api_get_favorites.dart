import 'dart:convert';

import 'package:config/config.dart';

import '../../../domain/entities/favorites_entity.dart';
import '../../../domain/usecases/usecases.dart';
import 'package:http/http.dart' as http;

import '../../models/favorites_model.dart';

class ApiGetFavorites extends GetFavorites {
  String baserUrl;

  ApiGetFavorites({required this.baserUrl});

  @override
  Future<FavoritesEntity?>? call() async {
    var response;
    try {
      response = await http.get(Uri.parse(baserUrl));

      FavoritesModel? favoritesModel;

      favoritesModel = FavoritesModel.fromJson((jsonDecode(response.body)[0]));

      return favoritesModel.toEntity();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
    }
  }
}
