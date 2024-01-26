import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:equatable/equatable.dart';

abstract class BasePresenter {
  ValueNotifier<UIState>? get state;

  void init();
  void disposeNotifier();
}

abstract class UIState extends Equatable {
  final String descriptionState;
  final TypeUsecase? typeUsecaseState;
  // ignore: prefer_const_constructors_in_immutables
  UIState(this.descriptionState, this.typeUsecaseState);
}

class UIInitialState extends UIState {
  // ignore: prefer_const_constructors_in_immutables
  UIInitialState() : super('', null);

  @override
  List<Object> get props => [descriptionState];
}

class UILoadingState extends UIState {
  // ignore: prefer_const_constructors_in_immutables
  UILoadingState() : super('', null);

  @override
  List<Object> get props => [descriptionState];
}

class UISucessState extends UIState {
  // ignore: prefer_const_constructors_in_immutables
  UISucessState(String descriptionState) : super('', null);

  @override
  List<Object> get props => [descriptionState];
}

class UIErrorState extends UIState {
  final String errorMessage;
  final TypeUsecase typeUsecase;

  // ignore: prefer_const_constructors_in_immutables
  UIErrorState(this.errorMessage, this.typeUsecase)
      : super(errorMessage, typeUsecase);

  @override
  List<Object> get props => [descriptionState, typeUsecase];
}
