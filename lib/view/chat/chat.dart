// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
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
   
    return Scaffold(
      body: ListView(

      shrinkWrap: true,
    //  physics: const NeverScrollableScrollPhysics(),
      children: [

          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       Get.to(SearchField);
          //     },
          //     child: Container(
          //       child: Row(
          //         children: [
          //           Icon(Icons.search),
          //           Text("Search....")
          //         ],
          //       ),
          //     height: 50,
          //     decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: gray2) ,
          //     ),
          //   ),
          // ),
      
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
// class Search extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//    return [
//       IconButton(
//         color: Colors.white,
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//         icon: const Icon(
//           Icons.clear,
//         ),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//      return Column(
//       children: [
//         IconButton(
//           onPressed: () {
//             close(context, null);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//    return Center(
//       child: Text(
//         query,
//         style: const TextStyle(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
   
//   }

// }



