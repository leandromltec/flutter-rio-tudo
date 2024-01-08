import 'package:flutter/material.dart';
import 'package:rio_tudo/src/domain/entities/entities.dart';

import '../../base_presenter.dart';

abstract class InfoPresenter extends BasePresenter {
  ValueNotifier<InfoEntity?>? infoEntityNotifier;

  Future<InfoEntity?>? getAllInfo();
}
