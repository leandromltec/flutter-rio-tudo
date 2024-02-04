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

  late ApiGetInfo getInfo;
  InfoEntity? response;
  late String baseUrl;
  dynamic clientMock;

  setUp(() {
    clientMock = MockClient;

    baseUrl = faker.internet.httpUrl();

    getInfo = ApiGetInfo(baseUrl: baseUrl, httpClient: clientMock);

    getInfo.httpClient = httpTest.MockClient((request) async {
      return http.Response(MockInfoJson.mockInfoJson(), 200, request: request);
    });
  });

  test('Test request get Info response 200', () async {
    response = await getInfo();

    expect(response!, isA<InfoEntity>());
  });

  test('Test request get info erro FormatException', () async {
    getInfo.httpClient = httpTest.MockClient((request) async {
      return http.Response(faker.lorem.word(), 200, request: request);
    });

    Future<InfoEntity?>? exception = getInfo();

    expect(exception, throwsA(FormatException));
  });

  test('Test request get all categories erro Exception', () async {
    getInfo = ApiGetInfo(baseUrl: '', httpClient: null);

    getInfo.httpClient = null;

    Future<InfoEntity?>? exception = getInfo();

    expect(exception, throwsA(HttpException));
  });
}
