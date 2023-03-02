import 'package:flutter_demo/bloc/base_event.dart';

class ListEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class GetInvoiceList extends ListEvent {
  Map<String, dynamic> header;
  Map<String, dynamic> body;

  @override
  List<Object?> get props => [];

  GetInvoiceList({required this.header, required this.body});
}


