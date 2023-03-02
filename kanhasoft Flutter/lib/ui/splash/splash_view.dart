import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/base_state.dart';
import 'package:flutter_demo/services/response/response/get_token_response.dart';
import 'package:flutter_demo/ui/splash/bloc/splash_block.dart';
import 'package:flutter_demo/ui/splash/bloc/splash_event.dart';
import 'package:flutter_demo/ui/splash/bloc/splash_state.dart';

import 'package:flutter_demo/utils/navigator.dart';
import 'package:flutter_demo/utils/preference.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/widget/my_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashView> {
  late SplashBloc _splashBloc;
  late GetTokenResponse? response = null;
  @override
  void initState() {
    _splashBloc = SplashBloc();
    getUserAurthToken();
    super.initState();
  }

  getUserAurthToken() {
    Map<String, dynamic>? requestParam = {
      "client_id": "Enter Your ID",
      "client_secret": "Enter Your Secret"
    };

    Map<String, dynamic>? head = {
      "Content-type": "application/x-www-form-urlencoded"
    };
    Map<String, dynamic>? body = {
     "client_id": "Enter Your ID",
      "client_secret": "Enter Your Secret",
      "grant_type": "password",
      "scope": "openid",
      "username": "dung+octopus4@101digital.io",
      "password": "Abc@123456"
    };
    _splashBloc
        .add(GetToken(requestParam: requestParam, headser: head, body: body));
  }

  moveToNext(bearerToken, orgToken) {
    Timer(
      const Duration(seconds: 3),
      () {
        MyNavigator.pushReplacedNamed(Routes.strListScreenRoute,
            argument: {"bearerToken": bearerToken, "orgToken": orgToken});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<SplashBloc>(
            create: (context) => _splashBloc,
            child: BlocListener<SplashBloc, BaseState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  // ignore: void_checks
                  return loadingState();
                } else if (state is ErrorState) {
                  showSnackBar("${state.errorMessage}");
                } else if (state is GetTokenRespons) {
                  response = state.response;
                  var bearerToken = "Bearer ${response?.accessToken}";
                  MyPreference.add(MyPreference.BEARER_TOKEN, bearerToken,
                      SharePrefType.String);
                  Map<String, dynamic> head = {
                    "Content-Type": "application/json",
                    "Authorization": bearerToken
                  };
                  _splashBloc.add(GetOrgToken(headser: head));
                } else if (state is GetOrgTokenRespons) {
                  setState(() {});
                  var orgToken = state.response?.data?.memberships?[0].token;
                  MyPreference.add(
                      MyPreference.ORG_TOKEN, orgToken, SharePrefType.String);
                  moveToNext("Bearer ${response?.accessToken}", orgToken);
                }
              },
              child: splashLoading(),
            )));
  }

  splashLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: MyText("Splash Screen"),
        ),
        SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            color: Colors.amberAccent[600],
          ),
        )
      ],
    );
  }
}
