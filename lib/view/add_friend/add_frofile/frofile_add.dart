import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/alluser/alluser.dart';
import 'package:trippbuddy/controller/userprofile/userprofile.dart';
import 'package:trippbuddy/model/allbuddys/allbuddys.dart';
import 'package:trippbuddy/model/userpost/userpost.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/add_friend/add_friend_post/add_friend_post.dart';
import 'package:trippbuddy/view/add_friend/add_frofile/add_profile.dart';


import 'package:trippbuddy/view/widgets/follow/follow.dart';

class FriendProfile extends StatelessWidget {
   FriendProfile({ Key? key ,required this.userDetails,}) : super(key: key);
  


   AllUsercontroll allUsercontroll =Get.put(AllUsercontroll());
   UserPostcontroll userpostcontroller = Get.put(UserPostcontroll());


Users userDetails;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: white1,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
               SliverToBoxAdapter(
                child:  AddFriendProfile(profileImage: userDetails.pic!,name: userDetails.name!,),
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
                      text:
                   "  userpostcontroller.userPosts![postIndex].photo!.length.toString()",
                    ),
                     Tab(
                      text:"${userDetails.followers!.length.toString()} Followers " ,
                    ),
                     Tab(text:"${userDetails.following!.length.toString()} Following"),
                  ],
                ),
              ),
            ];
          },
          body:  TabBarView(
            children: [
            AddFriendPost(),
              Follow(image: "assets/3.jpg", title: "Nithin"),
              Follow(image: "assets/3.jpg", title: "Amal"),
              
              
              ],
          ),
        ),
      ),
    );

   
  }
}
