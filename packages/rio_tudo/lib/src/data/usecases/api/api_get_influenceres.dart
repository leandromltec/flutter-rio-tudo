import 'dart:convert';

import 'package:config/config.dart';
import 'package:rio_tudo/src/data/models/influencer_model.dart';
import 'package:rio_tudo/src/domain/entities/influencer_entity.dart';

import '../../../domain/usecases/usecases.dart';

import 'package:http/http.dart' as http;

class ApiGetInfluencers extends GetInfluencers {
  String urlBase;

  ApiGetInfluencers({required this.urlBase});

  @override
  Future<List<InfluencerEntity>?> call() async {
    var response;
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
    }
  }
}
