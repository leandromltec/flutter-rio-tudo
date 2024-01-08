import 'package:flutter/material.dart';
import 'package:rio_tudo/src/domain/entities/info_entity.dart';
import 'package:rio_tudo/src/domain/usecases/usecases.dart';
import '../base_presenter.dart';
import '../screen/screens.dart';

class ValueNotifierInfoPresenter extends InfoPresenter {
  GetInfo getInfo;

  ValueNotifierInfoPresenter({required this.getInfo});

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
  void dispose() {
    state!.dispose();
  }

  @override
  Future<InfoEntity?>? getAllInfo() async {
    try {
      state!.value = UILoadingState();

      infoEntityNotifier!.value = await getInfo();

      state!.value = UISucessState('Informçaões carregadas com sucesso');

      return infoEntityNotifier!.value;
    } catch (error) {
      print('error');
    }
  }
}
