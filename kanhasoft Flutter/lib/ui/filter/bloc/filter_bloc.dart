import 'package:flutter_demo/bloc/base_bloc.dart';
import 'package:flutter_demo/bloc/base_event.dart';
import 'package:flutter_demo/bloc/base_state.dart';

import 'filter_event.dart';

class FilterBloc extends BaseBlock<BaseEvent, BaseState> {
  FilterBloc() : super(UnInitiatedState()) {
    on<FilterEvent>((event, emit) => (event, emit) {});
  }
}
