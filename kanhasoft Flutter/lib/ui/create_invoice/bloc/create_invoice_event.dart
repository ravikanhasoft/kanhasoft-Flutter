import 'package:flutter_demo/bloc/base_event.dart';

class CreateInvoiceEvent extends BaseEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateInvoice extends CreateInvoiceEvent {
  Map<String, dynamic>? header;
  Map<String, dynamic>? body;
  CreateInvoice({this.header, this.body});
}
