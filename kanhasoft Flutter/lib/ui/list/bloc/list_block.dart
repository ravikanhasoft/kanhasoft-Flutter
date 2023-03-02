

import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/base_bloc.dart';
import 'package:flutter_demo/bloc/base_event.dart';
import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/api_client.dart';
import 'package:flutter_demo/services/response/api_constant.dart';
import 'package:flutter_demo/services/response/base_response.dart';
import 'package:flutter_demo/services/response/response/get_invoice_list.dart';
import 'package:flutter_demo/ui/list/bloc/list_event.dart';
import 'package:flutter_demo/ui/list/bloc/list_state.dart';

import 'package:flutter_demo/utils/utils.dart';

class ListBloc extends BaseBlock<BaseEvent, BaseState> {
  ListBloc() : super(UnInitiatedState()) {
    on<ListEvent>(
      (event, emit) => {
        if (event is GetInvoiceList)
          {callApiForListing(event.header, event.body)}      
      },
    );
  }

  callApiForListing(headser, body) async {
    if (await isConnectionAvailable()) {
      emit(LoadingState());
      var getListresponse = await ApiClient.instance.call(
          method: ApiMethod.GET,
          mHeader: headser,
          url: ApiConstant.END_POINT_FETCH_INVOICE,
          param: body);
      if (getListresponse is BaseResponse) {
        var response = GetInvoiceListResponse.fromJson(getListresponse.data);
        emit(GetInvoiceResponse(response: response));
      } else if (getListresponse is ErrorResponse) {
        emit(ErrorState(
            errorCode: getListresponse.statusCode,
            errorMessage: getListresponse.errorMessage));
      }
    } else {
      showSnackBar("Please check internet connection.", color: Colors.red);
    }
  }


  
}
