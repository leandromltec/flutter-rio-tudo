import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';

class GetFavoritesMock extends Mock implements GetFavorites {
  When mockRequestCall() => when(() => call());
  void mockResponse(FavoritesEntity? response) =>
      mockRequestCall().thenAnswer((_) async => response);
}
