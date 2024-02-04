import 'dart:convert';
import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rio_tudo/src/data/usecases/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:http/testing.dart' as httpTest;
import 'package:rio_tudo/src/domain/usecases/usecases.dart';
import '../../../mock/mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  var faker = Faker();

  List<ItemSubCategoryEntity>? response;

  late ApiGetSubCategory getSubCategory;
  late String baseUrl;

  dynamic clientMock;

  setUp(() {
    clientMock = MockClient;

    baseUrl = faker.internet.httpUrl();

    getSubCategory =
        ApiGetSubCategory(baseUrl: baseUrl, httpClient: clientMock);

    getSubCategory.httpClient = httpTest.MockClient((request) async {
      return http.Response(
          MockListSubCategoryJson.mockListSubCategoryJson(), 200,
          request: request);
    });
  });

  test('Test request get Subcategories response 200', () async {
    response = await getSubCategory(
        GetSubCategoryParams(idSubCategory: faker.lorem.toString()));

    expect(response!.isEmpty, false);
    expect(response!, isA<List<ItemSubCategoryEntity>>());
  });

  test('Test request get info erro Exception', () async {
    getSubCategory =
        ApiGetSubCategory(baseUrl: baseUrl, httpClient: clientMock);

    getSubCategory.httpClient = httpTest.MockClient((request) async {
      return http.Response(faker.lorem.word(), 200, request: request);
    });

    Future<List<ItemSubCategoryEntity>?> exception = getSubCategory(
        GetSubCategoryParams(idSubCategory: faker.lorem.toString()));

    expect(exception, throwsA(FormatException));
  });

  test('Test request get all categories erro Exception', () async {
    getSubCategory = ApiGetSubCategory(baseUrl: '', httpClient: null);

    getSubCategory.httpClient = null;

    Future<List<ItemSubCategoryEntity>?> exception = getSubCategory(
        GetSubCategoryParams(idSubCategory: faker.lorem.toString()));

    expect(exception, throwsA(HttpException));
  });
}
