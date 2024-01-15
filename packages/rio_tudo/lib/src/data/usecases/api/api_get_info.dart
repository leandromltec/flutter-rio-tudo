import 'dart:convert';

import 'package:config/config.dart';
import 'package:rio_tudo/src/data/models/info_model.dart';

import '../../../domain/entities/info_entity.dart';
import '../../../domain/usecases/usecases.dart';

import 'package:http/http.dart' as http;

class ApiGetInfo extends GetInfo {
  String baserUrl;

  ApiGetInfo({required this.baserUrl});

  @override
  Future<InfoEntity?>? call() async {
    var response;

    try {
      response = await http.get(Uri.parse(baserUrl));

      InfoModel? infoModel;

      infoModel = InfoModel.fromJson((jsonDecode(response.body)[0]));

      return infoModel.toEntity();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
    }
  }
}
