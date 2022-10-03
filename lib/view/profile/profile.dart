// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/login_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/singuip.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/auth/log.dart';
import 'package:trippbuddy/view/profile/editprofile.dart';
import 'package:trippbuddy/view/profile/view_post.dart';

import 'package:trippbuddy/view/widgets/text.dart';

class Profile extends StatelessWidget {
  Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPostController myPostController = Get.put(MyPostController());
    MyProfileController myrofileciontroller = Get.put(MyProfileController());
    myrofileciontroller.onInit();
    Get.put(MyPostController());
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
                child: SizedBox(
                  height: 200,
                  child: Obx(() {
                    // Myprofile? mprofile2 = myrofileciontroller.profile.value;

                    if (myrofileciontroller.profile.value?.userData == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    Myprofile? mprofile2 = myrofileciontroller.profile.value;

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
                                              onTap: () {
                                                Get.to(EditProfile(
                                                  myprofile: mprofile2!,
                                                ))!
                                                    .then(
                                                        (value) => Get.back());
                                              },
                                              leading: Icon(Icons.edit),
                                              title: Text("Edit Profile"),
                                            ),
                                            ListTile(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Log out of Tripbuddy?"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Cancel"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            TokenStorage
                                                                .removed(
                                                                    "token");
                                                            Get.to(LogIn());
                                                          },
                                                          child: Text(
                                                            "Logout",
                                                            style: TextStyle(
                                                              color: red1,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              leading: Icon(Icons.logout),
                                              title: Text("LogOut"),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
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
                                backgroundImage:
                                    NetworkImage(mprofile2!.userData!.pic!),
                                radius: 60,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextLines(
                                      title: mprofile2.userData!.name!,
                                      size: 20,
                                      fontfamly: logbtn,
                                      fw: FontWeight.w900),
                                  TextLines(
                                      title: mprofile2.userData!.email!,
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
                ),
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
                    Obx(() {
                      if (myrofileciontroller.profile.value!.userData == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      Myprofile? mprofile = myrofileciontroller.profile.value;

                      return Tab(
                        text:
                            "${mprofile!.userData!.followers!.length.toString()} Followers",
                      );
                    }),
                    Obx(() {
                      if (myrofileciontroller.profile.value!.userData == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      Myprofile? mprofile = myrofileciontroller.profile.value;

                      return Tab(
                          text:
                              "${mprofile!.userData!.following!.length.toString()} Following");
                    }),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              myPost(myPostController),

              Obx(() {
                if (myrofileciontroller.profile.value == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                Myprofile? mprofile = myrofileciontroller.profile.value;
                return myFollowers(myrofileciontroller);
              }),
              //   followers(myrofileciontroller),
              Obx(() {
                if (myrofileciontroller.profile.value == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                Myprofile? mprofile = myrofileciontroller.profile.value;

                return Obx(() {
                  if (myrofileciontroller.profile.value == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  Myprofile? mprofile2 = myrofileciontroller.profile.value;

                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mprofile2!.userData!.following!.length,
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
                                    child: Image.network(
                                        mprofile2
                                            .userData!.following![index].pic!,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.lighten),
                                  )),
                            ),
                            title: Text(
                              mprofile2.userData!.following![index].name!,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // trailing: trailing,
                          ),
                        );
                      });
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Obx myFollowers(MyProfileController myrofileciontroller) {
    return Obx(() {
      if (myrofileciontroller.profile.value == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      Myprofile? mprofile = myrofileciontroller.profile.value;

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mprofile!.userData!.followers!.length,
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
                        child: Image.network(
                            mprofile.userData!.followers![index].pic!,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.lighten),
                      )),
                ),
                title: Text(
                  mprofile.userData!.followers![index].name!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // trailing: trailing,
              ),
            );
          });
    });
  }

  //   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< coverPic >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  // R

  //   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< followers >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Obx followings(MyProfileController myProfileController) {
    return Obx(() {
      if (myProfileController.profile.value == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      Myprofile? mprofile = myProfileController.profile.value;

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mprofile!.userData!.following!.length,
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
                        child: Image.network(
                            mprofile.userData!.following![index].pic!,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.lighten),
                      )),
                ),
                title: Text(
                  mprofile.userData!.following![index].name!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // trailing: trailing,
              ),
            );
          });
    });
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< post >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Padding myPost(MyPostController myPostController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Obx(
        () {
          // ScrollController scrollController = ScrollController();
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
                  childAspectRatio: 2 / 2.5,
                //  mainAxisExtent: 100,
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
