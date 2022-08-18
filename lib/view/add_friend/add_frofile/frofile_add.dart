import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/add_friend/add_friend_post/add_friend_post.dart';
import 'package:trippbuddy/view/add_friend/add_frofile/add_profile.dart';

import 'package:trippbuddy/view/widgets/follow/follow.dart';

class FriendProfile extends StatelessWidget {
  const FriendProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: white1,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              const SliverToBoxAdapter(
                child: AddFriendProfile(),
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
                
                  tabs:const [
                     Tab(
                      text: "Post",
                    ),
                     Tab(
                      text: "Followers",
                    ),
                     Tab(text: "Following"),
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
