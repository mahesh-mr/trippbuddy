import 'package:flutter/material.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class AppName extends StatelessWidget {
  const AppName({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title:TextLines(title: "Ture Buddy", size: 30, fontfamly: headline),
    );
  }
}