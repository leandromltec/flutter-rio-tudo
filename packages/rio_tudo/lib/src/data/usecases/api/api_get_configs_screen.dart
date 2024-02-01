/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

/* Contato - riotudorj@gmail.com */
/* 2024 - Todos os direitos reservados */

import 'dart:convert';

import 'package:config/config.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/models.dart';

class ApiGetConfigsScreen extends GetConfigsScreen {
  final String baseUrl;
  dynamic httpClient = http.Client();

  ApiGetConfigsScreen({required this.baseUrl, httpClient});

  @override
  Future<ConfigsScreenEntity?>? call() async {
    dynamic response;
    try {
      response = await httpClient.get(Uri.parse(baseUrl));

      ConfigsScreenModel? configsScreenModel;

      configsScreenModel =
          ConfigsScreenModel.fromJson((jsonDecode(response.body)[0]));

      return configsScreenModel.toEntity();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
      rethrow;
    }
  }
}
