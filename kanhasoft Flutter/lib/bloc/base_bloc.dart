import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

abstract class BaseBlock<E, S> extends Bloc<E, S> {
  late StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult? result;
  BaseBlock(S initialState) : super(initialState) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resuult) {
      result = result;
    });
  }

  Future<bool> isConnectionAvailable() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

  bool checkFeild(strName) {
    if (strName == null) {
      return true;
    } else if (strName is String) {
      return strName.isEmpty;
    } else {
      return true;
    }
  }
}
