import 'package:equatable/equatable.dart';

class InfluencerEntity extends Equatable {
  final String titleInfluencer;
  final String urlLinkInfluencer;

  const InfluencerEntity(
      {required this.titleInfluencer, required this.urlLinkInfluencer});

  @override
  List<Object?> get props => [titleInfluencer, urlLinkInfluencer];
}
