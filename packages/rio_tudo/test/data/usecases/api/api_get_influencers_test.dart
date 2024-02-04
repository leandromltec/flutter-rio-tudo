import 'dart:convert';
import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rio_tudo/src/data/usecases/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:http/testing.dart' as httpTest;
import '../../../mock/mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  var faker = Faker();
  late ApiGetInfluencers getInfluencers;
  List<InfluencerEntity>? response;

  late String baseUrl;
  dynamic clientMock;

  setUp(() {
    clientMock = MockClient;

    baseUrl = faker.internet.httpUrl();

    getInfluencers =
        ApiGetInfluencers(baseUrl: baseUrl, httpClient: clientMock);

    getInfluencers.httpClient = httpTest.MockClient((request) async {
      return http.Response(MockInfencerJson.mockInfencerJson(), 200,
          request: request);
    });
  });

  test('Test request get influencers response 200', () async {
    response = await getInfluencers();

    expect(response!.isEmpty, false);
    expect(response!, isA<List<InfluencerEntity>>());
  });

  test('Test request get influencers erro FormatException', () async {
    getInfluencers.httpClient = httpTest.MockClient((request) async {
      return http.Response(faker.lorem.word(), 200, request: request);
    });

    Future<List<InfluencerEntity>?> exception = getInfluencers();

    expect(exception, throwsA(FormatException));
  });

  test('Test request get influencers erro HttpException', () async {
    getInfluencers = ApiGetInfluencers(baseUrl: '', httpClient: null);

    getInfluencers.httpClient = null;

    Future<List<InfluencerEntity>?> exception = getInfluencers();

    expect(exception, throwsA(HttpException));
  });
}
