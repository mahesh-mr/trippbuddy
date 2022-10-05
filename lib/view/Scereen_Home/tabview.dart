import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/view/buddys/alluser.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/Markets/markets.dart';
import 'package:trippbuddy/view/chat/chat.dart';
import 'package:trippbuddy/view/home/fied.dart';
import 'package:trippbuddy/view/profile/profile.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class TabView extends StatelessWidget {
  TabView({
    Key? key,
  }) : super(key: key);
  MyProfileController myrofileciontroller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final height = size.height;
    final width = size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: white1,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 15),
              child: IconButton(
                onPressed: () {
                  Get.to(ChatScreen());
                },
                icon: Icon(
                  CupertinoIcons.ellipses_bubble_fill,
                  color: blue1,
                ),
              ),
            )
          ],
          centerTitle: true,
          title: TextLines(
            title: "Tripbuddy",
            size: width * .09,
            fontfamly: head,
            fw: FontWeight.bold,
            color: black1,
          ),
          elevation: 0,
          backgroundColor: white1,
          bottom: TabBar(
            labelColor: blue1,
            unselectedLabelColor: blue2,
            tabs: [
              Tab(
                icon: Icon(
                  CupertinoIcons.house_fill,
                ),
              ),
            
              Tab(
                icon: Icon(CupertinoIcons.person_2_fill),
              ),
              Tab(
                icon: Icon(CupertinoIcons.shopping_cart),
              ),
              Tab(icon: Icon(CupertinoIcons.person_alt_circle)),
            
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewFeid(),
            //  ChatScreen(),
            FrendsList(),
            Markets(),
            Profile(),
          ],
        ),
      ),
    );
  }
}
