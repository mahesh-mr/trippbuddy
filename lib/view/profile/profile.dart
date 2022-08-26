import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/mypost/mypost.dart';
import 'package:trippbuddy/controller/myprofile/myprofile.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/profile/build_porfile/main_profile.dart';
import 'package:trippbuddy/view/profile/post/post.dart';
import 'package:trippbuddy/view/widgets/follow/follow.dart';

class Profile extends StatelessWidget {
   Profile({Key? key,}) : super(key: key);
  // int proIndex;
   MyPostController myPostController = Get.put(MyPostController());
   MyProfileController myrofileciontroller = Get.put(MyProfileController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, index, ) {
            return [
               SliverToBoxAdapter(
                child:
                
                
                
                
                CoverPic(),
              ),
              SliverAppBar(
                elevation: 0,
                pinned: true,
                backgroundColor: white1,
                toolbarHeight: 4,
                bottom: TabBar(
                  indicator: BoxDecoration(
                      color: blue2, borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                
                  tabs: [
                     Tab(
                      text: "${myPostController.allMyPosts.length} Posts",
                    ),
                      Tab(
                      text: "fdf",
                    ),
                     const Tab(text: "18  Following"),
                  ],
                ),
              ),
            ];
          },
          body:  TabBarView(
            children: [
              Post(),
              Follow(image: "assets/3.jpg", title: "Nithin"),
              Follow(image: "assets/3.jpg", title: "Amal"),
              
              
              ],
          ),
        ),
      ),
    );

   
  }
}
