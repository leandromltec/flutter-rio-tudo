import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';

class GetInfoMock extends Mock implements GetInfo {
  When mockRequestCall() => when(() => call());
  void mockResponse(InfoEntity? response) =>
      mockRequestCall().thenAnswer((_) async => response);
}
