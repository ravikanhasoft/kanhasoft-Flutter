import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/response/response/get_org_token_response.dart';
import 'package:flutter_demo/services/response/response/get_token_response.dart';

class SplashState extends BaseState {
  @override
  List<Object?> get props => [];
}

class GetTokenRespons extends SplashState {
  GetTokenResponse? response;
  GetTokenRespons({this.response});
  @override
  List<Object?> get props => [];
}

class GetOrgTokenRespons extends SplashState {
  GetOrgResponse? response;
  GetOrgTokenRespons({this.response});
  @override
  List<Object?> get props => [];
}
