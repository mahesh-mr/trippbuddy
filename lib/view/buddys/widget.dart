import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/controller/userprofile_controller.dart';

import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class AddFriendProfile extends StatelessWidget {
  AddFriendProfile({Key? key, required this.profileImage, required this.name})
      : super(key: key);
  String profileImage;
  String name;

 AllUsercontroll allUsercontroll = Get.put(AllUsercontroll());
  @override
  Widget build(BuildContext context) {
    return Obx(
     () {
      if(allUsercontroll.isLoding.value){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
        return Container(
            height: 150,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextLines(
                          title: name,
                          size: 20,
                          fontfamly: logbtn,
                          fw: FontWeight.w900),
                      TextLines(
                          title: "",
                          size: 20,
                          fontfamly: logbtn,
                          fw: FontWeight.w900),
                    ],
                  ),
                )
              ],
            ),
          );
      }
    );
    
  }
}
