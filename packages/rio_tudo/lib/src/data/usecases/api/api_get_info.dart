/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:convert';

import 'package:config/config.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../domain/entities/info_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../models/info_model.dart';

class ApiGetInfo extends GetInfo {
  String baserUrl;

  ApiGetInfo({required this.baserUrl});

  @override
  Future<InfoEntity?>? call() async {
    dynamic response;

    try {
      response = await http.get(Uri.parse(baserUrl));

      InfoModel? infoModel;

      infoModel = InfoModel.fromJson((jsonDecode(response.body)[0]));

      return infoModel.toEntity();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
      rethrow;
    }
  }
}
