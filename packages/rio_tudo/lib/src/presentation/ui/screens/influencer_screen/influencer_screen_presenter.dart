/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import '../../../base_presenter.dart';

abstract class InfluencerPresenter extends BasePresenter {
  ValueNotifier<List<InfluencerEntity>?>? listInfluencersNotifier;

  Future<List<InfluencerEntity>?> getAllInfluencers();
}
