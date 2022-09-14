
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class LogButton extends StatelessWidget {
  const LogButton(
      {Key? key,
      required this.onpressed,
      required this.text_or_icon,
      this.edgeInsets,
      required this.size})
      : super(key: key);

  final VoidCallback onpressed;
  final Widget text_or_icon;
  final EdgeInsets? edgeInsets;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: blue1,
        onPrimary:white1,
        shadowColor: blue2,
        elevation: 3,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        minimumSize: size,
      ),
      onPressed: onpressed,
      child: Padding(padding: edgeInsets!, child: text_or_icon),
    );
  }
}
