import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/recentController/recent_controller.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/chat/personal_msg/personal_msg.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Massages extends StatelessWidget {
  Massages({Key? key}) : super(key: key);

 RecentChatController recentChatController = Get.put(RecentChatController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
      children: [
        Divider(thickness: 2,color: gray2,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextLines(title: "Recent Chats", size: 20),
        ),
        Obx(
          () {
            if (recentChatController.loding.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (recentChatController.allRecentChats!.isEmpty) {
              return Center(
                child: Text("Data Not Found"),
              );
            }

            String userId = TokenStorage.getUserIdAndToken("uId")!;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: recentChatController.allRecentChats!.length,
              itemBuilder: (context, index) {
                final listChat = recentChatController.allRecentChats![index];

                String userPic = listChat.users[0].id != userId
                    ? listChat.users[0].pic
                    : listChat.users[1].pic;

                String userName = listChat.users[0].id != userId
                    ? listChat.users[0].name
                    : listChat.users[1].name;
                String x = "2022-05-12T15:55:03.000000Z";

                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PeronalChat(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userPic),
                      radius: 30,
                    ),
                    title: TextLines(
                        title: userName,
                        size: 20,
                        fontfamly: logbtn,
                        fw: FontWeight.bold),
                    subtitle: TextLines(
                        title: listChat.latestMessage.content,
                        size: 20,
                        fontfamly: logbtn,
                        fw: FontWeight.bold),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
