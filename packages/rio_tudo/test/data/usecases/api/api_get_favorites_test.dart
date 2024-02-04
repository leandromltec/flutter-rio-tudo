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
  late ApiGetFavorites getFavorites;
  FavoritesEntity? response;

  late String baseUrl;
  dynamic clientMock;

  setUp(() {
    clientMock = MockClient;

    baseUrl = faker.internet.httpUrl();

    getFavorites = ApiGetFavorites(baseUrl: baseUrl, httpClient: clientMock);

    getFavorites.httpClient = httpTest.MockClient((request) async {
      return http.Response(MockFavoritesJson.mockFavoritesJson(), 200,
          request: request);
    });
  });

  test('Test request get favorites response 200', () async {
    response = await getFavorites();

    expect(response!, isA<FavoritesEntity>());
  });

  test('Test request get favorites erro FormatException', () async {
    getFavorites.httpClient = httpTest.MockClient((request) async {
      return http.Response(faker.lorem.word(), 200, request: request);
    });

    Future<FavoritesEntity?>? exception = getFavorites();

    expect(exception, throwsA(FormatException));
  });

  test('Test request get favorites erro HttpException', () async {
    getFavorites = ApiGetFavorites(baseUrl: '', httpClient: null);

    getFavorites.httpClient = null;

    Future<FavoritesEntity?>? exception = getFavorites();

    expect(exception, throwsA(HttpException));
  });
}
