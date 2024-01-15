import 'package:config/config.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/usecases.dart';
import '../base_presenter.dart';
import '../../domain/entities/influencer_entity.dart';
import '../../../rio_tudo.dart';

class ValueNotifierInfluencerPresenter extends InfluencerPresenter {
  GetInfluencers getInfluencers;

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
  void dispose() {
    state!.dispose();
    listInfluencersNotifier!.dispose();
  }

  @override
  Future<List<InfluencerEntity>?> getAllInfluencers() async {
    try {
      state!.value = UILoadingState();

      listInfluencersNotifier!.value = await getInfluencers();

      state!.value = UISucessState(LabelsApp.sucessMessageInfluencers);

      return listInfluencersNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState(
          LabelsApp.errorMessageInfluencers, TypeUsecase.influencer);
    }
  }
}
