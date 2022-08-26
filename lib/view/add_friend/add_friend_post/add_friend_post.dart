import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/userprofile/userprofile.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class AddFriendPost extends StatelessWidget {
   AddFriendPost({ Key? key }) : super(key: key);
   UserPostcontroll userpostcontroller = Get.put(UserPostcontroll());

  @override
  Widget build(BuildContext context) {
   return Scaffold(
   
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(
         () {
          if (userpostcontroller.isLoding.value) {
            Center(child: CircularProgressIndicator(),);
            
          }
          if (userpostcontroller.userPosts==null) {
            Center(child: Text("data"),);
            
          }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: userpostcontroller.userPosts!.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.network(
                         userpostcontroller.userPosts![index].photo!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextLines(
                                title:  userpostcontroller.userPosts![index].title!,
                                size: 18,
                                fontfamly: headline,
                                color: const Color.fromARGB(255, 104, 101, 101),
                                fw: FontWeight.bold),
                           
                            TextLines(
                              title:  userpostcontroller.userPosts!.length.toString(),
                              size: 18,
                              fontfamly: headline,
                              fw: FontWeight.bold,
                              color: blue1,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  CupertinoIcons.heart,
                                  size: 30,
                                  color: blue1,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  CupertinoIcons.quote_bubble,
                                  size: 30,
                                  color: blue1,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  CupertinoIcons.person_2_fill,
                                  size: 30,
                                  color: blue1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }
        ),
      ),
    );
  }
}
