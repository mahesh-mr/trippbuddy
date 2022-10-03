// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/controller/search_chat.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/recentchat.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/chat/personal_msg/personal_msg.dart';
import 'package:trippbuddy/view/chat/search_chat.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  //final _controller = PersonalMsgController();
  // PostchatController postchatcontroller = Get.put(PostchatController());
  RecentChatController recentChatController = Get.put(RecentChatController());
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(TabView());
            },
            icon: Icon(
              Icons.arrow_back,
              color: black1,
            )),
        backgroundColor: white1,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SearchField());
            },
            icon: Icon(
              Icons.search,
              color: black1,
            ),
          ),
        ],
        title: TextLines(
          title: "Recent Chats",
          size: 20,
          color: black1,
        ),
      ),
      body: SingleChildScrollView(
          // shrinkWrap: true,
          child:
              // Padding(
              //   padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              //   child: TextField(
              //     controller: searchController,
              //     onChanged: (value) {
              //       postchatcontroller.findChats(value);
              //     },
              //     decoration: InputDecoration(
              //       hintText: "Search...",
              //       hintStyle: TextStyle(color: Colors.grey.shade600),
              //       prefixIcon: Icon(
              //         Icons.search,
              //         color: Colors.grey.shade600,
              //         size: 20,
              //       ),
              //       filled: true,
              //       fillColor: Colors.grey.shade100,
              //       contentPadding: EdgeInsets.all(8),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20),
              //           borderSide: BorderSide(color: Colors.grey.shade100)),
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: TextLines(title: "Recent Chats", size: 20),
              //     ),
              //     IconButton(
              //       onPressed: () {
              //          Get.to(SearchField());
              //       },
              //       icon: Icon(
              //         Icons.search,
              //         color: black1,
              //       ),
              //     ),
              //   ],
              // ),

              fetchChasts()),
    );
  }

  Obx fetchChasts() {
    return Obx(
      () {
        if (recentChatController.loding.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        String userId = TokenStorage.getUserIdAndToken("uId")!;

        return ListView.builder(
          //    physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recentChatController.allRecentChats.value.length,
          itemBuilder: (context, index) {
            RecentChats allChats =
                recentChatController.allRecentChats.value[index];

            final listChat = recentChatController.allRecentChats.value[index];

            String userPic = listChat.users[0].id != userId
                ? listChat.users[0].pic
                : listChat.users[1].pic;

            String userName = listChat.users[0].id != userId
                ? listChat.users[0].name
                : listChat.users[1].name;

            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListTile(
                onTap: () {
                  //  print(recentChatController.allRecentChats![index].);
                  print(
                      "${recentChatController.allRecentChats.value[index].id}......@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!!!!!");
                  //   recentChatController.postPersonoalChat
                  Get.to(PeronalChats(
                    allchats: allChats,
                    chatindex: index,
                  ));
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
}
