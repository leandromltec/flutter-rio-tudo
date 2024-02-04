import 'package:mocktail/mocktail.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';

class GetInfluencersMock extends Mock implements GetInfluencers {
  When mockRequestCall() => when(() => call());
  void mockResponse(List<InfluencerEntity>? response) =>
      mockRequestCall().thenAnswer((_) async => response);
}
