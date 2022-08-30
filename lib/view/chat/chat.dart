// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/recentController/recent_controller.dart';
import 'package:trippbuddy/view/add_friend/add_friends.dart';
import 'package:trippbuddy/view/chat/massages/massage.dart';

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
