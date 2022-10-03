import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/personalchat_controll.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/postchat_service.dart';
import 'package:trippbuddy/model/personalchat.dart';
import 'package:trippbuddy/model/recentchat.dart';


class PeronalChats extends StatelessWidget {
  PeronalChats({Key? key, required this.allchats, required this.chatindex})
      : super(key: key);
  int chatindex;
  RecentChats allchats;
  final _msgcontroller = TextEditingController();
  final _fomkey = GlobalKey<FormState>();


  //var msgs = false.obs;
  @override
  Widget build(BuildContext context) {
    PersonalChatController personalChatController =
        Get.put(PersonalChatController(postId: allchats.id!.toString()));
    String userId = TokenStorage.getUserIdAndToken("uId")!;

    RecentChatController recentChatController = Get.put(RecentChatController());

    personalChatController.onInit();
    final listChat = recentChatController.allRecentChats.value[chatindex];

    String userPic = listChat.users[0].id != userId
        ? listChat.users[0].pic
        : listChat.users[1].pic;
    String userName = listChat.users[0].id != userId
        ? listChat.users[0].name
        : listChat.users[1].name;

    return Scaffold(
      appBar: appbar(personalChatController, context, userPic, userName),
      body: Column(
        children: [
        
          Obx(() {
            if (personalChatController.isloding.value) {
              return const Center(
                child: const CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: personalChatController.personalchats.value.length,
                //  reverse: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  PersonalChat pchat =
                      personalChatController.personalchats.value[index];
                  return messege(personalChatController, index, userId, pchat);
                },
              ),
            );
          }),
          inputField(personalChatController)
        ],
      ),
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<< input Feild >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  Container inputField(PersonalChatController personalChatController) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Form(
        key: _fomkey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _msgcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "minimum  1 length";
                  } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                    return 'Please enter a valid Location';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    hintText: "Write message...",
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                PersonalChat? prlChat =
                    personalChatController.personalchats.value[chatindex];
                bool isValid = _fomkey.currentState!.validate();

                if (isValid) {
                  PostChatService.postChats(
                      chatId: prlChat.chat!.id!, content: _msgcontroller.text);
                  _msgcontroller.clear();
                }
              },
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<< Message >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  Container messege(PersonalChatController personalChatController, int index,
      String userId, PersonalChat pchat) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment:
            (personalChatController.personalchats.value[index].sender!.id ==
                    userId
                ? Alignment.bottomRight
                : Alignment.bottomLeft
            //  messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight
            ),
        child: personalChatController.personalchats.value[index].sender!.id !=
                userId
            ? Wrap(
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(personalChatController
                          .personalchats.value[index].sender!.pic!)),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (personalChatController
                                      .personalchats.value[index].sender!.id ==
                                  userId
                              ? Colors.grey.shade200
                              : Colors.blue[200]

                          //  // messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]
                          ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(pchat.content!),
                    //  messages[index].messageContent, style: TextStyle(fontSize: 15),
                  ),
                ],
              )
            : Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (personalChatController
                                      .personalchats.value[index].sender!.id ==
                                  userId
                              ? Colors.grey.shade200
                              : Colors.blue[200]

                          //  // messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]
                          ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(pchat.content!),
                    //  messages[index].messageContent, style: TextStyle(fontSize: 15),
                  ),
                  CircleAvatar(
                      backgroundImage: NetworkImage(personalChatController
                          .personalchats.value[index].sender!.pic!)),
                ],
              ),
      ),
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<< Appbar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  AppBar appbar(PersonalChatController personalChatController,
      BuildContext context, String userPic, String userName) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Obx(() {
            if (personalChatController.isloding.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(userPic.toString()),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
