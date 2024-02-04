import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';

class GetConfigsScreenMock extends Mock implements GetConfigsScreen {
  When mockRequestCall() => when(() => call());
  void mockResponse(ConfigsScreenEntity response) =>
      mockRequestCall().thenAnswer((_) async => response);
}
