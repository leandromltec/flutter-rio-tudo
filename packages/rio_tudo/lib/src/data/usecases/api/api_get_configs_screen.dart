import 'dart:convert';
import 'package:config/config.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

class ApiGetConfigsScreen extends GetConfigsScreen {
  final String baseUrl;

  ApiGetConfigsScreen({required this.baseUrl});

  @override
  Future<ConfigsScreenEntity?>? call() async {
    var response;
    try {
      response = await http.get(Uri.parse(baseUrl));

      ConfigsScreenModel? configsScreenModel;

      configsScreenModel =
          ConfigsScreenModel.fromJson((jsonDecode(response.body)[0]));

      return configsScreenModel.toEntity();
    } catch (error) {
      ValidateTypeException().typeException(response: response, error: error);
    }
  }
}
