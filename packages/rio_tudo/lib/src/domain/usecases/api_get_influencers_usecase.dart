import '../entities/entities.dart';

abstract class GetInfluencers {
  Future<List<InfluencerEntity>?> call();
}
