// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/recentController/recent_controller.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/recentChat_SERVICE/recent_chat.dart';

import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/add_friend/add_friends.dart';
import 'package:trippbuddy/view/chat/buddys/buddys.dart';
import 'package:trippbuddy/view/chat/massages/massage.dart';

import 'package:trippbuddy/view/widgets/text.dart';

import 'personal_msg/personal_msg.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key,}) : super(key: key);

  //final _controller = PersonalMsgController();
  RecentChatController recentChatController = Get.put(RecentChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView(
        shrinkWrap:  true,

        children: [
      //  Buddys(),
      AddFrendsList(),
          Massages(),
        ],
      ),
    );
  }
}
