import 'package:flutter/material.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){
  Navigator.pop(context);
}, icon: Icon(Icons.close,color: black1,));
  }
}