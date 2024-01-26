/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

import 'package:config/config.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/models.dart';

class ApiGetInfluencers extends GetInfluencers {
  String urlBase;

  ApiGetInfluencers({required this.urlBase});

  @override
  Future<List<InfluencerEntity>?> call() async {
    dynamic response;
    try {
      response = await http.get(Uri.parse(urlBase));

      List<InfluencerModel> listInfluencers = [];

      listInfluencers = (jsonDecode(response.body) as List)
          .map((e) => InfluencerModel.fromJson(e))
          .toList();

      return listInfluencers
          .map<InfluencerEntity>((e) => e.toEntity())
          .toList();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
      rethrow;
    }
  }
}
