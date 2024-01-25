import 'package:flutter/material.dart';
import 'package:rio_tudo/src/presentation/base_presenter.dart';

import '../../../../domain/entities/entities.dart';

abstract class InfluencerPresenter extends BasePresenter {
  ValueNotifier<List<InfluencerEntity>?>? listInfluencersNotifier;

  Future<List<InfluencerEntity>?> getAllInfluencers();
}
