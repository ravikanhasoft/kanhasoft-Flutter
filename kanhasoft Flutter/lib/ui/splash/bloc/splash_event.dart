import 'package:flutter_demo/bloc/base_event.dart';

class SplashEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class GetToken extends SplashEvent {
  Map<String, dynamic>? requestParam;
  Map<String, dynamic>? headser;
  Map<String, dynamic>? body;

  @override
  List<Object?> get props => [];

  GetToken(
      {required this.requestParam, required this.headser, required this.body});
}

class GetOrgToken extends SplashEvent {
  Map<String, dynamic>? headser;
  @override
  List<Object?> get props => [];

  GetOrgToken({required this.headser});
}
