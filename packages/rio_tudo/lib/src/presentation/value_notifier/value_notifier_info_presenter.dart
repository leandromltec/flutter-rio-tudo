/* Desenvolvido por Leandro M. Loureiro */
/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';

import 'package:config/config.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/api_get_info_usecase.dart';
import '../base_presenter.dart';
import '../ui/screen/screens.dart';

class ValueNotifierInfoPresenter implements InfoPresenter {
  GetInfo? getInfo;

  ValueNotifierInfoPresenter({this.getInfo});

  @override
  ValueNotifier<InfoEntity?>? infoEntityNotifier;

  @override
  ValueNotifier<UIState>? state;

  @override
  void init() {
    state = ValueNotifier(UIInitialState());
    infoEntityNotifier = ValueNotifier(null);
  }

  @override
  void disposeNotifier() {
    state!.dispose();
    infoEntityNotifier!.dispose();
  }

  @override
  Future<InfoEntity?>? getAllInfo() async {
    try {
      state!.value = UILoadingState();

      infoEntityNotifier!.value = await getInfo!();

      state!.value = UISucessState(LabelsApp.sucessMessageInfo);

      return infoEntityNotifier!.value;
    } catch (error) {
      state!.value = UIErrorState(LabelsApp.errorMessageInfo, TypeUsecase.info);
    }
    return infoEntityNotifier!.value;
  }
}
