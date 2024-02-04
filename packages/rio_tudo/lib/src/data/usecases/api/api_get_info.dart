/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/info_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/info_model.dart';

class ApiGetInfo extends GetInfo {
  String baseUrl;
  dynamic httpClient = http.Client();

  ApiGetInfo({required this.baseUrl, httpClient});

  @override
  Future<InfoEntity?>? call() async {
    dynamic response;

    try {
      response = await httpClient.get(Uri.parse(baseUrl));

      InfoModel? infoModel;

      infoModel = InfoModel.fromJson((jsonDecode(response.body)[0]));

      return infoModel.toEntity();
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
