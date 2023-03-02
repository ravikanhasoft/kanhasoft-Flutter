import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/response/response/get_invoice_list.dart';

class ListState extends BaseState {
  @override
  List<Object?> get props => [];
}

class GetInvoiceResponse extends ListState {
  GetInvoiceListResponse response;

  GetInvoiceResponse({required this.response});

  @override
  List<Object?> get props => [];
}
