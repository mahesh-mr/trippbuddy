import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/personal_msg_controller.dart';
import 'package:trippbuddy/controller/controller/personalchat_controll.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/personalchat.dart';
import 'package:trippbuddy/model/posatchat.dart';
import 'package:trippbuddy/model/recentchat.dart';

class PeronalChats extends StatelessWidget {
  PeronalChats({Key? key, required this.allchats, required this.chatindex})
      : super(key: key);
  int chatindex;
  RecentChats allchats;
  final msgcontroller = TextEditingController();
  final fomkey = GlobalKey<FormState>();
  final pmsg = PersonalMsgController();
  var msgs = false.obs;
  @override
  Widget build(BuildContext context) {
    PersonalChatController personalChatController =
        Get.put(PersonalChatController(postId: allchats.id!.toString()));
    String userId = TokenStorage.getUserIdAndToken("uId")!;
    // String username =  TokenStorage.getUserIdAndToken("name")!;
    RecentChatController recentChatController = Get.put(RecentChatController());
 //   PostchatControll controll =Get.put(PostchatControll());
    final listChat = recentChatController.allRecentChats![chatindex];

    String userPic = listChat.users[0].id != userId
        ? listChat.users[0].pic
        : listChat.users[1].pic;

    String userName = listChat.users[0].id != userId
        ? listChat.users[0].name
        : listChat.users[1].name;
    //   final listChat = personalChatController.personalchat;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Obx(() {
              if (personalChatController.isloding.value) {
                // String usercontent = listChat.users[0].id != userId
                //     ? listChat.users[0].name
                //     : listChat.users[1].name;
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //  print(personalChatController.personalchat!.content!.length);
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(userPic.toString()),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName.toString(),
                          style: TextStyle(
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
      ),
      body: Stack(
        children: [
          Obx(() {
            if (personalChatController.isloding.value) {
              // String usercontent = listChat.users[0].id != userId
              //     ? listChat.users[0].name
              //     : listChat.users[1].name;
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: personalChatController.personalchats!.length,
              //  recentChatController.allRecentChats!.length,

              shrinkWrap: true,

              padding: EdgeInsets.only(top: 10, bottom: 10),
              //    physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final r = personalChatController.personalchats!.length;
                print("${r} +hjkjhkjfjghkjghkljghkjh");
                String userid = listChat.users[0].id != userId
                    ? listChat.users[0].pic
                    : listChat.users[1].pic;
                String myid = listChat.users[0].id != userId
                    ? listChat.users[0].pic
                    : listChat.users[1].pic;

                final chatids =
                    personalChatController.personalchats![index].chat!;
                print("${chatids}=======================");
                print(
                    "${personalChatController.personalchats![index].chat!.id}======...............................................kittyyyyyyy");
                print(
                    "${personalChatController.personalchats![index].sender!.id!},,,,,,,,,,,,,,,,,,,,,,,,,////////cnerid");
                print(
                    personalChatController.personalchats![index].sender!.name);
                print(
                    "${userId}..................................................................");
                // print(personalChatController.personalchats![index].content);
                print(
                    "${personalChatController.personalchats![index].id}/////////99999999=========================");
                print(
                    "${personalChatController.personalchats![index].chat!.users!}=========================");

             //   print("${controll.postchat!.id!}");

                ("${chatids}===============================");

                // final listChats = recentChatController.allRecentChats![index].id;
                // print("${listChats}........000000000000000000000000000000000000000");
                PersonalChat pchat =
                    personalChatController.personalchats![index];
                final messageList = pmsg.Pmessage[chatindex];
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (personalChatController
                                    .personalchats![index].sender!.id ==
                                userId
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft
                        //  messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight
                        ),
                    child: personalChatController
                                .personalchats![index].sender!.id !=
                            userId
                        ? Wrap(
                            children: [
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      personalChatController
                                          .personalchats![index].sender!.pic!)),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (personalChatController
                                                  .personalchats![index]
                                                  .sender!
                                                  .id ==
                                              userId
                                          ? Colors.grey.shade200
                                          : Colors.blue[200]

                                      //  // messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]
                                      ),
                                ),
                                padding: EdgeInsets.all(16),
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
                                                  .personalchats![index]
                                                  .sender!
                                                  .id ==
                                              userId
                                          ? Colors.grey.shade200
                                          : Colors.blue[200]

                                      //  // messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]
                                      ),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(pchat.content!),
                                //  messages[index].messageContent, style: TextStyle(fontSize: 15),
                              ),
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      personalChatController
                                          .personalchats![index].sender!.pic!)),
                            ],
                          ),
                  ),
                );
              },
            );
          }),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Form(
                key: fomkey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                      PersonalChat? prlChat =personalChatController.personalchats![chatindex];
                      RecentChats? chats =recentChatController.allRecentChats![chatindex];

                        if (fomkey.currentState!.validate()) {
                          
                       personalChatController.postChat(chatId:prlChat.chat!.id!, content: msgcontroller.text);
                        }
                     //   print(chats.id!);
                      },
                      child: Icon(
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
            ),
          ),
        ],
      ),
    );

//      Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(65),
//           child: AppBar(
//             leadingWidth: 70,
//             // toolbarHeight: 50,
//             toolbarHeight: 75,
//             elevation: 0,
//             backgroundColor: white1,
//             leading:

//                 //
//                 const Padding(
//               padding: EdgeInsets.symmetric(vertical: 5),
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/3.jpg'),
//              //   radius: 15.0,
//               ),
//             ),

//             title: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 0),
//               child: Column(
//                 children: [
//                   TextLines(
//                     title: "Hari",
//                     size: 20,
//                     fontfamly: logbtn,
//                     color: black1,fw: FontWeight.bold,
//                   ),
//                   TextLines(
//                     title: "Online",
//                     size: 16,
//                     fontfamly: logbtn,
//                     color: black1,
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: const Icon(CupertinoIcons.arrow_left),
//               )
//             ],
//           ),
//         ),
//         body: Column(
//         //  shrinkWrap: true,
//           children: [
//            Expanded(child: PMessages()),
//          // Spacer(),
//             Positioned(
//               child: Container(
//                 color: white1,
//                 padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
//                 child: SafeArea(

//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width:320,
//                         height: 70,

//                         child: TextField(
//                           decoration: InputDecoration(
//                             fillColor: white1,
//                             filled: true,
//                             hintText: "type......",
//                             focusColor: white1,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: IconButton(onPressed: (){}, icon: const Icon(Icons.send,size: 40,color: blue1,)),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
  }
}
