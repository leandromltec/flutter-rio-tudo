import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as httpTest;
import 'package:mockito/mockito.dart';
import 'package:rio_tudo/src/data/usecases/api/api.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

import '../../../mock/mock.dart';

//Classe para criar o mock do http
class MockClient extends Mock implements http.Client {}

void main() {
  //Usar dados faker
  var faker = Faker();
  //Uscase
  late ApiGetAllCategories getAllCategories;
  //Define baseUrl que será passado no usecase
  late String baseUrl;
  //Response que será retornardo
  List<CategoryEntity>? response;
  //Define mock cliente
  dynamic clientMock;

  //Executa antes de iniciar os testes
  setUp(() {
    //Define mock cliente
    clientMock = MockClient;
    //baseUrl recebe http fake que será passado para o usecase
    baseUrl = faker.internet.httpUrl();

    //Usecase com parâmetros mockados
    getAllCategories =
        ApiGetAllCategories(baseUrl: baseUrl, httpClient: clientMock);

    //httclient do usecase irá receber o response formato json mockado
    getAllCategories.httpClient = httpTest.MockClient((request) async {
      return http.Response(MockCategoryJson.mockListCategoryJson(), 200,
          request: request);
    });
  });

  //Test verifica se retorna as categorias com response no status code 200 de sucesso
  test('Test request get all categories response 200', () async {
    //Response recebe lista de Cateogrias
    response = await getAllCategories();

    //Verifica se o response possui categorias
    expect(response!.isEmpty, false);
    //Verifica se o que foi retonardo é uma lista de categorias
    expect(response!, isA<List<CategoryEntity>>());
  });

  //Test verifica se tem algum erro do body no response
  test(
      'Test request get all categories erro response with error FormatException',
      () async {
    getAllCategories.httpClient = httpTest.MockClient((request) async {
      return http.Response(faker.lorem.word(), 200, request: request);
    });

    Future<List<CategoryEntity>?> exception = getAllCategories();

    expect(exception, throwsA(FormatException));
  });

  //Verifica se tem algum erro de http
  test('Test request get all categories erro Exception', () async {
    getAllCategories = ApiGetAllCategories(baseUrl: '', httpClient: null);

    getAllCategories.httpClient = null;

    Future<List<CategoryEntity>?> exception = getAllCategories();

    expect(exception, throwsA(HttpException));
  });
}
