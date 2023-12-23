import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BasePresenter {
  ValueNotifier<UIState>? get state;

  void init();
  void dispose();
}

abstract class UIState extends Equatable {
  final String description;

  const UIState(this.description);
}

class UIInitialState extends UIState {
  UIInitialState() : super('');

  @override
  List<Object> get props => [description];
}

class UILoadingState extends UIState {
  UILoadingState() : super('');

  @override
  List<Object> get props => [description];
}

class UISucessState extends UIState {
  UISucessState(String description) : super('');

  @override
  List<Object> get props => [description];
}

class UIErrorState extends UIState {
  final String errorMessage;

  UIErrorState(this.errorMessage) : super(errorMessage);

  @override
  List<Object> get props => [description];
}
