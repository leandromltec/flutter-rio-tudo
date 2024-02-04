import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';

class GetAllCategoriesMock extends Mock implements GetAllCategories {
  When mockRequestCall() => when(() => call());
  void mockResquestError() => mockRequestCall().thenThrow(Exception());
  void mockResponse(List<CategoryEntity>? response) =>
      mockRequestCall().thenAnswer((_) async => response);
}
