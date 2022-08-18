import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/profile/build_porfile/main_profile.dart';
import 'package:trippbuddy/view/profile/follow/followings/followings.dart';
import 'package:trippbuddy/view/profile/post/post.dart';
import 'package:trippbuddy/view/widgets/follow/follow.dart';

class viewAddFriend extends StatelessWidget {
  const viewAddFriend({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              const SliverToBoxAdapter(
                child: CoverPic(),
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
            children: [const Post(),  Follow(image: "assets/pr1.jpg", title: "Anil"),
              Follow(image: "assets/3.jpg", title: "Austin"),],
          ),
        ),
      ),
    );
  }
}