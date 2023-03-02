// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/widget/my_text.dart';

var actualScreenWidth = window.physicalSize.width / window.devicePixelRatio;
var actualScreenHeight = window.physicalSize.height / window.devicePixelRatio;
var textScale = actualScreenWidth / (actualScreenWidth < 600 ? 414 : 600);

var isTablet = actualScreenWidth > 600;

Color colorFromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

showSnackBar(message, {color = Colors.red}) {
  if (scaffoldState.currentContext != null) {
    ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(SnackBar(
      backgroundColor: color ?? Colors.black,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
      content: MyText(
        message,
        color: Colors.white,
        fontSize: 12,
        maxLines: 5,
        fontWeight: FontWeight.normal,
      ),
    ));
  }
}

double rWidth(double percentage) {
  return actualScreenWidth * (percentage / 100);
}

double rHeight(double percentage) {
  return actualScreenHeight * (percentage / 100);
}

checkNullString(String str) {
  return str != '' ? str : '';
}

getCallBackEvent(BuildContext context,
    {bool setCancalable = true,
    required VoidCallback onYes,
    required VoidCallback onNo}) {
  showDialog(
    barrierLabel: "This is a label",
    barrierDismissible: setCancalable,
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        FloatingActionButton.extended(
          onPressed: onNo,
          elevation: 10,
          icon: const Icon(Icons.close),
          label: MyText("Cancel", color: Colors.white),
        ),
        FloatingActionButton.extended(
          elevation: 10,
          label: MyText("Save", color: Colors.white),
          icon: const Icon(Icons.approval),
          onPressed: onYes,
        )
      ],
    ),
  );
}

showLoder(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

printLog(message) {
  // if (kDebugMode) {
  // ignore: avoid_print
  return log(message);
  // }
}

isAndroid() {
  try {
    return Platform.isAndroid;
  } catch (e) {
    return false;
  }
}

isIOS() {
  try {
    return Platform.isIOS;
  } catch (e) {
    return false;
  }
}

List<BottomNavigationBarItem> bottemNavMenu() {
  List<BottomNavigationBarItem> mapData = [];
  mapData.add(
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"));
  mapData.add(const BottomNavigationBarItem(
      icon: Icon(Icons.audiotrack_rounded), label: "Audio"));

  return mapData;
}

loadingState() {
  return SizedBox(
    height: 20,
    width: 20,
    child: CircularProgressIndicator(
      backgroundColor: Colors.amberAccent[600],
    ),
  );
}

showDateDailog(context, {required Function(DateTime) callback, firstDate}) {
  showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: firstDate ?? DateTime(1950),
          lastDate: DateTime.now())
      .then(
    (value) {
      if (value == null) {
        return;
      }
      callback(value);
    },
  );
}

Widget myDropdoun({
  required List<String> list,
  required String? selectedValue,
  required String hint,
  required Function(String) onChnage,
  Widget? underline,
  Widget? icon,
  TextStyle? style,
  TextStyle? hintStyle,
  Color? dropdownColor,
  Color? iconEnabledColor,
}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Card(
      color: Colors.white,
      child: DropdownButton<String>(
          value: selectedValue,
          icon: icon,
          underline: const SizedBox(),
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (String? newValue) {
            onChnage(newValue!);
          },
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.all(7),
            child: MyText(
              hint,
              color: Colors.grey,
            ),
          ),
          items: list
              .map((fruit) => DropdownMenuItem<String>(
                    value: fruit,
                    child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: MyText(
                          fruit,
                          color: Colors.black,
                          fontSize: 14,
                        )),
                  ))
              .toList()),
    )
  ]);
}

enum DailogAction { CANCEL, OKAY, SAVE }
