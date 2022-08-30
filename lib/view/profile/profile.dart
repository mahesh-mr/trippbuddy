// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/mypost/mypost.dart';
import 'package:trippbuddy/controller/myprofile/myprofile.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/auth/login/log.dart';
import 'package:trippbuddy/view/profile/view_post.dart';
import 'package:trippbuddy/view/updatepassword/updatepassword.dart';
import 'package:trippbuddy/view/widgets/text.dart';

import '../../model/profile/profile.dart';

class Profile extends StatelessWidget {
  Profile({
    Key? key,
  }) : super(key: key);
  // int proIndex;

  @override
  Widget build(BuildContext context) {
    MyPostController myPostController = Get.put(MyPostController());
    MyProfileController myrofileciontroller = Get.put(MyProfileController());

    myPostController.onInit();

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (
            context,
            index,
          ) {
            return [
              SliverToBoxAdapter(
                child: coverPic(myrofileciontroller, context),
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
                    Obx(() {
                      if (myPostController.loding.value) {
                        return const Tab(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Tab(
                        text: "${myPostController.allMyPosts.length} Posts",
                      );
                    }),
                    Tab(
                      text:
                          "${myrofileciontroller.userProfile!.userData!.followers!.length.toString()} Following",
                    ),
                    Tab(
                        text:
                            "${myrofileciontroller.userProfile!.userData!.following!.length.toString()} Followers"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              myPost(myPostController),
              followers(myrofileciontroller),
              followings(myrofileciontroller),
            ],
          ),
        ),
      ),
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< coverPic >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  SizedBox coverPic(
      MyProfileController myrofileciontroller, BuildContext context) {
    return SizedBox(
      height: 200,
      child: Obx(() {
        if (myrofileciontroller.loding.value) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 290),
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                    
                        context: context,
                        builder: (context) {
                          
                          return SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                              
                                ListTile(
                                  onTap: () {},
                                  leading: Icon(Icons.edit),
                                  title: Text("Edit Profile"),
                                ),
                                ListTile(
                                  onTap: () {
                                 Get.to(UpdatedPassword());
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text("Edit Password"),
                                ),
                                ListTile(
                                  onTap: () {
                                    TokenStorage.removed("token");
                                    Get.to(LogIn());
                                  },
                                  leading: Icon(Icons.logout),
                                  title: Text("LogOut"),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon:  Icon(
                    CupertinoIcons.gear_alt_fill,
                    color: blue1,
                  )),
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        myrofileciontroller.userProfile!.userData!.pic!),
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
                          title:
                              myrofileciontroller.userProfile!.userData!.name!,
                          size: 20,
                          fontfamly: logbtn,
                          fw: FontWeight.w900),
                      TextLines(
                          title:
                              myrofileciontroller.userProfile!.userData!.email!,
                          size: 20,
                          fontfamly: logbtn,
                          fw: FontWeight.w900),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< coverPic >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< followings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  ListView followings(MyProfileController myProfileController) {
    final List<Follow> followings =
        myProfileController.userProfile!.userData!.following!;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: followings.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListTile(
              // onTap: ontap,
              leading: SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(10),
                      child: Image.network(followings[index].pic!,
                          fit: BoxFit.cover, colorBlendMode: BlendMode.lighten),
                    )),
              ),
              title: Text(
                followings[index].name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // trailing: trailing,
            ),
          );
        });
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< followers >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  ListView followers(MyProfileController myProfileController) {
    final List<Follow> followers =
        myProfileController.userProfile!.userData!.followers!;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: followers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListTile(
              //      onTap: ontap,
              leading: SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(10),
                      child: Image.network(followers[index].pic!,
                          fit: BoxFit.cover, colorBlendMode: BlendMode.lighten),
                    )),
              ),
              title: Text(
                followers[index].name!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // trailing: trailing,
            ),
          );
        });
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Padding myPost(MyPostController myPostController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Obx(
        () {
          ScrollController scrollController = ScrollController();
          if (myPostController.loding.value) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }

          if (myPostController.allMyPosts.isEmpty) {
            return const Center(
              child: Text("Data not found"),
            );
          }

          return GridView.builder(

              //   physics: NeverScrollableScrollPhysics(),

              //  reverse: true,
              //   shrinkWrap: true,
              itemCount: myPostController.allMyPosts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewPost(mypostViewInx: index),
                        ));
                  },
                  child: Container(
                    width: 100.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              myPostController.allMyPosts[index].photo!)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
