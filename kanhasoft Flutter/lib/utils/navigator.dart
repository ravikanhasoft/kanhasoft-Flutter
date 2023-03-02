import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';

class MyNavigator {
  static var navState = navigatorState.currentState;

  static Future? pushNamed(String name,
      {Object? argument = Map<dynamic, dynamic>}) {
    return navState?.pushNamed(name, arguments: argument);
  }

  static Future? pushReplacedNamed(String name,
      {Object? argument = Map<dynamic, dynamic>}) {
    return navState?.pushReplacementNamed(name, arguments: argument);
  }

  static Future? pushAndRemove(String redirectionScreen, String oldScreenName,
      {Object? argument = Map<dynamic, dynamic>, bool refreshScreen = false}) {
    return navState?.pushNamedAndRemoveUntil(
        redirectionScreen, ModalRoute.withName(oldScreenName),
        arguments: argument);
  }

  static getArgument(context) {
    return ModalRoute.of(context)?.settings.arguments;
  }
}
