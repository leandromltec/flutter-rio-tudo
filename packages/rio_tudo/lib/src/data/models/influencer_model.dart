import '../../domain/entities/entities.dart';

class InfluencerModel {
  String titleInfluencer;
  String urlLinkInfluencer;

  InfluencerModel(
      {required this.titleInfluencer, required this.urlLinkInfluencer});

  factory InfluencerModel.fromJson(Map<String, dynamic> map) {
    return InfluencerModel(
        titleInfluencer: map['titleInfluencer'],
        urlLinkInfluencer: map['urlLinkInfluencer']);
  }
  InfluencerEntity toEntity() => InfluencerEntity(
      titleInfluencer: titleInfluencer, urlLinkInfluencer: urlLinkInfluencer);
}
