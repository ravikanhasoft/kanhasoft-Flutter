import 'package:flutter/material.dart';
import 'package:flutter_demo/theme/style.dart';

class MyTextInput extends StatefulWidget {
  TextEditingController? controller;
  String? hintText;
  String? labelText;
  Color color;
  int? maxLines;
  int? minLines;

  TextAlign textAlign;
  FontWeight fontWeight;
  Widget? prefixIcon;
  Widget? unPrefixIcon;
  TextInputType? textInputType;
  bool obscureText;
  bool isTextEditable;
  Function(String)? onChange;

  MyTextInput(
      {this.hintText,
      required this.controller,
      required this.labelText,
      this.prefixIcon,
      this.unPrefixIcon,
      this.color = Colors.black,
      this.maxLines,
      this.minLines = 1,
      this.onChange,
      this.textAlign = TextAlign.left,
      this.textInputType,
      this.obscureText = false,
      this.isTextEditable = true,
      this.fontWeight = FontWeight.w400});

  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.white,
          child: TextField(
            cursorColor: Colors.black,
            obscureText: widget.obscureText,
            keyboardType: widget.textInputType,
            controller: widget.controller,
            enabled: widget.isTextEditable,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              iconColor: Colors.grey,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.unPrefixIcon,
            ),
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            showCursor: true,
            style: Style.normal
                .copyWith(color: widget.color, fontWeight: widget.fontWeight),
          ),
        ),
      ],
    );
  }
}
