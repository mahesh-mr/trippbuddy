// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/personalchat_controll.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/personalchat.dart';
import 'package:trippbuddy/model/recentchat.dart';
import 'package:trippbuddy/view/chat/personal_msg/personal_msg.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  //final _controller = PersonalMsgController();
  RecentChatController recentChatController = Get.put(RecentChatController());

  @override
  Widget build(BuildContext context) {
    // PersonalChatController personalChatController =
    //     Get.find<PersonalChatController>();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          searchBar(),
          //  Buddys(),
          //AddFrendsList(),
          ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Divider(
          thickness: 2,
          color: gray2,
        ),
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
                RecentChats allChats =
                    recentChatController.allRecentChats![index];

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
                  
                    //  print(recentChatController.allRecentChats![index].);
                      print("${recentChatController.allRecentChats![index].id}......@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!!!!!");
                      Get.to(PeronalChats(allchats: allChats,chatindex: index,));
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userPic),
                      radius: 30,
                    ),
                    title: TextLines(
                        title: userName,
                        size: 18,
                        fontfamly: logbtn,
                        fw: FontWeight.bold),
                    subtitle: TextLines(
                      title: listChat.latestMessage.content,
                      size: 15,
                      fontfamly: logbtn,
                    ),
                    // fw: FontWeight.bold),
                  ),
                );
              },
            );
          },
        ),
      ],
    ),
        ],
      ),
    );
  }

//====================searchbar=============================================
  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade100)),
        ),
      ),
    );
  }

//================all messages====================================================
  // ListView allMeggages() {
  //   return ListView(
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     children: [
  //       Divider(
  //         thickness: 2,
  //         color: gray2,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: TextLines(title: "Recent Chats", size: 20),
  //       ),
  //       Obx(
  //         () {
  //           if (recentChatController.loding.value) {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //           if (recentChatController.allRecentChats!.isEmpty) {
  //             return Center(
  //               child: Text("Data Not Found"),
  //             );
  //           }

  //           String userId = TokenStorage.getUserIdAndToken("uId")!;

  //           return ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: recentChatController.allRecentChats!.length,
  //             itemBuilder: (context, index) {
  //               RecentChats allChats =
  //                   recentChatController.allRecentChats![index];

  //               final listChat = recentChatController.allRecentChats![index];

  //               String userPic = listChat.users[0].id != userId
  //                   ? listChat.users[0].pic
  //                   : listChat.users[1].pic;

  //               String userName = listChat.users[0].id != userId
  //                   ? listChat.users[0].name
  //                   : listChat.users[1].name;
  //               String x = "2022-05-12T15:55:03.000000Z";

  //               return Padding(
  //                 padding: const EdgeInsets.only(bottom: 5),
  //                 child: ListTile(
  //                   onTap: () {
  //                     print(personalChatController
  //                         .personalchats![index].content!.length);
  //                     print(recentChatController.allRecentChats![index].id!);
  //                     print(recentChatController.allRecentChats![index].id);
  //                     //  Get.to(PeronalChats(allchats: allChats,chatindex: index,));
  //                   },
  //                   leading: CircleAvatar(
  //                     backgroundImage: NetworkImage(userPic),
  //                     radius: 30,
  //                   ),
  //                   title: TextLines(
  //                       title: userName,
  //                       size: 18,
  //                       fontfamly: logbtn,
  //                       fw: FontWeight.bold),
  //                   subtitle: TextLines(
  //                     title: listChat.latestMessage.content,
  //                     size: 15,
  //                     fontfamly: logbtn,
  //                   ),
  //                   // fw: FontWeight.bold),
  //                 ),
  //               );
  //             },
  //           );
  //         },
  //       ),
  //     ],
  //   );
  }

