import 'package:flutter/material.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String title;
  final TextInputType type;
  final bool? obscureText;

  // ignore: prefer_const_constructors_in_immutables
  TextForm(
      {Key? key,
      required this.controller,
      required this.title,
      required this.validator,
      required this.type,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
        
        fillColor: white1,
        filled: true,
        label: Text(title),
        focusColor: white1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
