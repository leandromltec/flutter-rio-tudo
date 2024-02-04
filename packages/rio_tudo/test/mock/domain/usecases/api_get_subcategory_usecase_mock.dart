import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';

class GetSubCategoryItemsMock extends Mock implements GetSubCategoryItems {
  When mockRequestCall(GetSubCategoryParams? params) =>
      when(() => call(params));
  void mockResponse(List<ItemSubCategoryEntity>? response,
          GetSubCategoryParams? params) =>
      mockRequestCall(params).thenAnswer((_) async => response);
}
