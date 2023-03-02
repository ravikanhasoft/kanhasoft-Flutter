import 'package:flutter_demo/bloc/base_state.dart';

class CreateInvoiceState extends BaseState {
  @override
  List<Object?> get props => [];
}

class CreateInvoiceResponseState extends CreateInvoiceState {}

class CreateInvoceResponse extends CreateInvoiceState {
  String? responseMessage;
  CreateInvoceResponse({this.responseMessage});
}
