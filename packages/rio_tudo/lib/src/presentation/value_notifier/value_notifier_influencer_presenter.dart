/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';

import '../../../rio_tudo.dart';
import '../../domain/entities/influencer_entity.dart';
import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';

class ValueNotifierInfluencerPresenter implements InfluencerPresenter {
  GetInfluencers? getInfluencers;

  ValueNotifierInfluencerPresenter({required this.getInfluencers});

  @override
  ValueNotifier<UIState>? state;

  @override
  ValueNotifier<List<InfluencerEntity>?>? listInfluencersNotifier;

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    listInfluencersNotifier = ValueNotifier(null);
  }

  @override
  void disposeNotifier() {
    state!.dispose();
    listInfluencersNotifier!.dispose();
  }

  @override
  Future<List<InfluencerEntity>?> getAllInfluencers() async {
    try {
      state!.value = UILoadingState();

      listInfluencersNotifier!.value = await getInfluencers!();

      state!.value = UISucessState(LabelsApp.sucessMessageInfluencers);

      return listInfluencersNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageInfluencers, TypeUsecase.influencer);
    }
    return listInfluencersNotifier!.value;
  }
}
