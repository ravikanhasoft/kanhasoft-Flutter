import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/create_invoice/create_invoice_view.dart';
import 'package:flutter_demo/ui/filter/filter_view.dart';
import 'package:flutter_demo/ui/list/listdata.dart';
import 'package:flutter_demo/ui/splash/splash_view.dart';



class Routes {
  static const String strSplashScreenRoute = "splash_screen";
  static const String strListScreenRoute = "list_screen";
  static const String strCreateInvoiceRoute = "create_invoice";
  static const String strFilterScreenRoute = "filter_screen";

  static appRoutes() {
    Map<String, WidgetBuilder> routes = HashMap();
    routes[Routes.strSplashScreenRoute] = (context) => const SplashView();
    routes[Routes.strListScreenRoute] = (context) => const ListDataView();
    routes[Routes.strFilterScreenRoute] = (context) => const FilterView();
    routes[Routes.strCreateInvoiceRoute] =
        (context) => const CreateInvoiceView();

    return routes;
  }
}
