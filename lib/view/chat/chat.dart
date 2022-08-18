// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/personal_msg_controller/personal_msg_controller.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/add_friend/add_friends.dart';
import 'package:trippbuddy/view/chat/buddys/buddys.dart';
import 'package:trippbuddy/view/chat/massages/massage.dart';
import 'package:trippbuddy/view/chat/online/online.dart';
import 'package:trippbuddy/view/widgets/text.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  //final _controller = PersonalMsgController();
  bool isOPening = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextLines(title: "Online", size: 18,fw: FontWeight.bold,),
        ),
        Online(),
        AddFrendsList(),
        Massages(),
      ],
    );
  }
}
