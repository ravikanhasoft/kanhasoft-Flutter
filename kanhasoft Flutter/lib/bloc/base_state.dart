import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class UnInitiatedState extends BaseState {
  @override
  List<Object> get props => [];
}

class LoadingState extends BaseState {
  @override
  List<Object> get props => [];

  LoadingState();
}

class DataState<T extends Object> extends BaseState {
  final T data;
  const DataState(this.data);

  @override
  List<Object?> get props => [data];
}

// ignore: must_be_immutable
class ErrorState extends BaseState {
  String? errorMessage;
  int? errorCode;

  ErrorState({this.errorMessage = "", this.errorCode = 0});

  @override
  List<Object> get props => [];
}

class NoInterNetConnectionState extends BaseState {
  @override
  List<Object> get props => [];
}

class LoadingView extends BaseState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SucessErrorMessageView extends BaseState {
  @override
  List<Object> get props => [];
  // ignore: prefer_typing_uninitialized_variables
  var sucessErrorMessage;
  SucessErrorMessageView({this.sucessErrorMessage});
}
