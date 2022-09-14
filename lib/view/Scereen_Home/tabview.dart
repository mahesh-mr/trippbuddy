import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/buddys/alluser.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/Markets/markets.dart';
import 'package:trippbuddy/view/chat/chat.dart';
import 'package:trippbuddy/view/home/fied.dart';
import 'package:trippbuddy/view/profile/profile.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key,}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final height = size.height;
    final width = size.width;
    return  DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: white1,
          appBar: AppBar(
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
            bottom: const TabBar(
              labelColor: blue1,
              unselectedLabelColor: blue2,
              tabs: [
                Tab(
                  icon: Icon(
                    CupertinoIcons.house_fill,
                  ),
                ),
                Tab(
                  icon: Icon(
                    CupertinoIcons.ellipses_bubble_fill,
                  ),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.person_2_fill),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.shopping_cart),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.person_crop_circle),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
               NewFeid(),
              ChatScreen(),
              FrendsList(),
              Markets(),
              Profile(),
            ],
          ),
        ),
      );
    
  }
}
