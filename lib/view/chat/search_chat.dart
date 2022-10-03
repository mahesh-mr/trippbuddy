import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/controller/search_chat.dart';
import 'package:trippbuddy/model/recentchat.dart';
import 'package:trippbuddy/view/chat/chat.dart';
import 'package:trippbuddy/view/chat/personal_msg/personal_msg.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);
  RecentChatController recentChatController = Get.find<RecentChatController>();
  PostchatController postchatcontroller = Get.put(PostchatController());
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white1,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                   Get.to(ChatScreen());
              },
              icon: Icon(
                Icons.arrow_back,
                color: black1,
              )),
          title: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                postchatcontroller.findChats(value);
              },
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
          ),
        ),
        body: Obx(
          () {
            if (postchatcontroller.isLoding.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (postchatcontroller.chats.value.isEmpty) {
              return Center(
                child: Text("Data Not Found"),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
           
                shrinkWrap: true,
                itemCount: postchatcontroller.chats.value.length,
                itemBuilder: (context, index) {
                  final postchat = postchatcontroller.chats.value[index];
    RecentChats allChats = recentChatController.allRecentChats.value[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ListTile(
                      onTap: () {
                        recentChatController.PersonoalChat(
                            userId: postchatcontroller.chats.value[index].id!);
                        //  Get.to(ChatScreen())?.then((value) =>

                        Get.to(PeronalChats(
                            allchats:allChats,
                            chatindex: index));
                            print("${postchatcontroller.chats.value[index].id!}=====================");
                               print("${allChats}=====================");

                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(postchat.pic!),
                        radius: 30,
                      ),
                      title: TextLines(
                          title: postchat.name!,
                          size: 18,
                          fontfamly: logbtn,
                          fw: FontWeight.bold),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
