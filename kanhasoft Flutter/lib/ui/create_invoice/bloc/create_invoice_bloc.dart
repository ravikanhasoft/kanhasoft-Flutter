
import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/base_bloc.dart';
import 'package:flutter_demo/bloc/base_event.dart';
import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/api_client.dart';
import 'package:flutter_demo/services/response/api_constant.dart';
import 'package:flutter_demo/services/response/base_response.dart';
import 'package:flutter_demo/ui/create_invoice/bloc/create_invoice_event.dart';
import 'package:flutter_demo/ui/create_invoice/bloc/create_invoice_state.dart';

import 'package:flutter_demo/utils/utils.dart';

class CreateInvoiceBlock extends BaseBlock<BaseEvent, BaseState> {
  CreateInvoiceBlock() : super(UnInitiatedState()) {
    on<CreateInvoiceEvent>(
      (event, emit) {
        if (event is CreateInvoice) {
          callApiCreateInvoice(event.header, event.body);
        }
      },
    );
  }

  void callApiCreateInvoice(header, body) async {
    if (await isConnectionAvailable()) {
      emit(LoadingState());
      var getListresponse = await ApiClient.instance.call(
          method: ApiMethod.POST,
          mHeader: header,
          url: ApiConstant.END_POINT_CREATE_INVOICE,
          param: body);
      if (getListresponse is BaseResponse) {
        emit(CreateInvoceResponse(responseMessage: getListresponse.data["status"]["message"]));
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
