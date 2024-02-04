import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as httpTest;
import 'package:mockito/mockito.dart';
import 'package:rio_tudo/src/data/usecases/api/api.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

import '../../../mock/mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  var faker = Faker();
  late ApiGetConfigsScreen getConfigsScreen;
  ConfigsScreenEntity? response;

  late String baseUrl;
  dynamic clientMock;

  setUp(() {
    clientMock = MockClient;

    baseUrl = faker.internet.httpUrl();

    getConfigsScreen =
        ApiGetConfigsScreen(baseUrl: baseUrl, httpClient: clientMock);

    getConfigsScreen.httpClient = httpTest.MockClient((request) async {
      return http.Response(MockConfiScreenJson.mockConfiScreenJson(), 200,
          request: request);
    });
  });

  test('Test request get configuration screens response 200', () async {
    response = await getConfigsScreen();

    expect(response!, isA<ConfigsScreenEntity>());
  });

  test('Test request get configuration erro FormatException', () async {
    getConfigsScreen.httpClient = httpTest.MockClient((request) async {
      return http.Response(faker.lorem.word(), 200, request: request);
    });

    Future<ConfigsScreenEntity?>? exception = getConfigsScreen();

    expect(exception, throwsA(FormatException));
  });

  test('Test request get all configuration erro HttpException', () async {
    getConfigsScreen = ApiGetConfigsScreen(baseUrl: '', httpClient: null);

    getConfigsScreen.httpClient = null;

    Future<ConfigsScreenEntity?>? exception = getConfigsScreen();

    expect(exception, throwsA(HttpException));
  });
}
