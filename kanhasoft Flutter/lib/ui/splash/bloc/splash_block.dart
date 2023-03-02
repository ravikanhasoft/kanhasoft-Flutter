import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/base_bloc.dart';
import 'package:flutter_demo/bloc/base_event.dart';
import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/api_client.dart';
import 'package:flutter_demo/services/response/api_constant.dart';
import 'package:flutter_demo/services/response/base_response.dart';
import 'package:flutter_demo/services/response/response/get_org_token_response.dart';
import 'package:flutter_demo/services/response/response/get_token_response.dart';
import 'package:flutter_demo/ui/splash/bloc/splash_event.dart';
import 'package:flutter_demo/ui/splash/bloc/splash_state.dart';

import 'package:flutter_demo/utils/utils.dart';

class SplashBloc extends BaseBlock<BaseEvent, BaseState> {
  SplashBloc() : super(UnInitiatedState()) {
    on<SplashEvent>((event, emit) => {
          if (event is GetToken)
            {callApiGetToken(event.requestParam, event.body, event.headser)}
          else if (event is GetOrgToken)
            {callApiOrgToken(event.headser)}
        });
  }

  callApiGetToken(requestParam, Map<String, dynamic>? body,
      Map<String, dynamic>? headser) async {
    if (await isConnectionAvailable()) {
      if (body?['client_id'].toString() == "Enter Your ID" &&
          body?['client_secret'].toString() == "Enter Your Secret") {
        showSnackBar("Please Enter Client ID and client Secrat",
            color: Colors.red);
      }
      var getTokenResponse = await ApiClient.instance.call(
          method: ApiMethod.POST,
          mHeader: headser,
          url: ApiConstant.END_POINT_GET_TOKEN,
          param: body);
      if (getTokenResponse is BaseResponse) {
        GetTokenResponse responseModel =
            GetTokenResponse.fromJson(getTokenResponse.data);
        emit(GetTokenRespons(response: responseModel));
      } else if (getTokenResponse is ErrorResponse) {
        emit(ErrorState(
            errorCode: getTokenResponse.statusCode,
            errorMessage: getTokenResponse.errorMessage));
      }
    } else {
      showSnackBar("Please check internet connection.", color: Colors.red);
    }
  }

  callApiOrgToken(headser) async {
    if (await isConnectionAvailable()) {
      var getTokenResponse = await ApiClient.instance.call(
        method: ApiMethod.GET,
        mHeader: headser,
        url: ApiConstant.END_POINT_ORG_TOKEN,
      );
      if (getTokenResponse is BaseResponse) {
        emit(GetOrgTokenRespons(
            response: GetOrgResponse.fromJson(getTokenResponse.data)));
      } else if (getTokenResponse is ErrorResponse) {
        emit(ErrorState(
            errorCode: getTokenResponse.statusCode,
            errorMessage: getTokenResponse.errorMessage));
      }
    } else {
      showSnackBar("Please check internet connection.", color: Colors.red);
    }
  }
}
