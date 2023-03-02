// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/style.dart';

class MyText extends StatelessWidget {
  String message;
  double fontSize;
  Color color;
  int? maxLines;
  TextAlign textAlign;
  FontWeight fontWeight;
  MyText(this.message,
      {this.fontSize = 16,
      this.color = Colors.black,
      this.maxLines,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: textAlign,
      maxLines: maxLines,
      style: Style.normal
          .copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
