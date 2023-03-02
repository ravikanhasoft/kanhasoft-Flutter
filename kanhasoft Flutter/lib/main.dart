import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/ui/list/bloc/list_block.dart';
import 'package:flutter_demo/ui/splash/bloc/splash_block.dart';

import 'package:flutter_demo/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

var navigatorState = GlobalKey<NavigatorState>();
var scaffoldState = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SplashBloc(),
          ),
          BlocProvider(
            create: (context) => ListBloc(),
          )
        ],
        child: MaterialApp(
          navigatorKey: navigatorState,
          title: 'Flutter Pro',
          theme: ThemeData(),
          routes: Routes.appRoutes(),
          initialRoute: Routes.strSplashScreenRoute,
          builder: (context, child) {
            return Scaffold(
              key: scaffoldState,
              body: SafeArea(child: child!),
            );
          },
        ));
  }
}
