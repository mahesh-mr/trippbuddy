import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLines extends StatelessWidget {
   TextLines(
      {Key? key,
      required this.title,
      required this.size,
       this.fw,
       this.color,
      this.fontfamly})
      : super(key: key);
  final String title;
  final double size;
  final FontWeight? fw;
   String? fontfamly;
   Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
          fontSize: size,
          fontWeight: fw,
          fontFamily:fontfamly),
    );
  }
}
