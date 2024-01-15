import 'package:config/config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BasePresenter {
  ValueNotifier<UIState>? get state;

  void init();
  void dispose();
}

abstract class UIState extends Equatable {
  final String descriptionState;
  final TypeUsecase? typeUsecaseState;

  const UIState(this.descriptionState, this.typeUsecaseState);
}

class UIInitialState extends UIState {
  UIInitialState() : super('', null);

  @override
  List<Object> get props => [descriptionState];
}

class UILoadingState extends UIState {
  UILoadingState() : super('', null);

  @override
  List<Object> get props => [descriptionState];
}

class UISucessState extends UIState {
  UISucessState(String descriptionState) : super('', null);

  @override
  List<Object> get props => [descriptionState];
}

class UIErrorState extends UIState {
  final String errorMessage;
  final TypeUsecase typeUsecase;

  UIErrorState(this.errorMessage, this.typeUsecase)
      : super(errorMessage, typeUsecase);

  @override
  List<Object> get props => [descriptionState, typeUsecase];
}
