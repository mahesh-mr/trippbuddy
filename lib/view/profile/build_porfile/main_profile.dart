
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/myprofile/myprofile.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class CoverPic extends StatelessWidget {
   CoverPic({Key? key}) : super(key: key);
  MyProfileController myrofileciontroller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
              height: 150,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 40),
                    child: CircleAvatar(
                    //  backgroundImage:NetworkImage(allUsercontroll.allUsers![index].pic!),
                      radius: 60,
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(top: 30,left: 10.0),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                       TextLines(
                        title: "Nakul",
                        size: 20,
                        fontfamly: logbtn,
                        fw: FontWeight.w900),
                    TextLines(
                        title: "Nakul",
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
