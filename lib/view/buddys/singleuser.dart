// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/controller/userprofile_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/allbuddys.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/home/cmt.dart';
import 'package:trippbuddy/view/widgets/text.dart';

// ignore: must_be_immutable
class FriendProfile extends StatelessWidget {
  FriendProfile(
      {Key? key,
      required this.userDetails,
      required this.id,
      required this.followed})
      : super(key: key);
  Users userDetails;
  bool followed;
  int id;
  String? userId = TokenStorage.getUserIdAndToken("uId");
  @override
  Widget build(BuildContext context) {
    UserPostcontroll userpostcontroller = Get.put(
      UserPostcontroll(
        followed: followed,
        userId: userDetails.sId!,
      ),
    );

    AllUsercontroll allUsercontroll = Get.put(AllUsercontroll());
    return Scaffold(
        backgroundColor: white1,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                SliverToBoxAdapter(child: Obx(() {
                  if (allUsercontroll.isLoding.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox(
                    height: 180,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              userDetails.pic!,
                            ),
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
                                  title: userDetails.name!,
                                  size: 20,
                                  fontfamly: logbtn,
                                  fw: FontWeight.w900),
                              // SizedBox(height: 40,),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: GetBuilder<UserPostcontroll>(
                                      builder: (controller) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: controller.followed
                                              ? green2
                                              : red1),

                                      // style: ButtonStyle(shape: OutlinedBorder(side: )),
                                      onPressed: () {
                                        if (controller.followed) {
                                          print("{followed}=======after");

                                          allUsercontroll.putUnfollows(
                                              unfollowId: userDetails.sId!);
                                          print("unfollow");

                                          print(
                                              "${followed}=====follow/unfollow===============");
                                        } else {
                                          print("{followed}=======befor");
                                          allUsercontroll.putFollows(
                                              followId: userDetails.sId!);
                                        }
                                        controller.followAndUnfollow();

                                        controller.getUsersposts();
                                      },
                                      child: Text(controller.followed
                                          ? "unfollow"
                                          : "follow"),
                                    );
                                  })),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                })),
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  backgroundColor: white1,
                  toolbarHeight: 4,
                  bottom: TabBar(
                    indicator: BoxDecoration(
                        color: blue2,
                        borderRadius: BorderRadius.circular(25.0)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Obx(() {
                        if (userpostcontroller.isLoding.value) {
                          return SizedBox();
                        }
                        return Tab(
                            text: userpostcontroller
                                .singleuser.value!.posts!.length
                                .toString());
                      }),
                      Tab(
                        text: "${userDetails.following!.length} Following ",
                      ),
                      Obx(() {
                        if (userpostcontroller.isLoding.value) {
                          return SizedBox();
                        }

                        return Tab(
                            text:
                                "${userpostcontroller.singleuser.value!.user!.followers!.length} Followers");
                      }),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Obx(() {
                  if (userpostcontroller.isLoding.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return AddFriendPosts();
                }),
                Following(userDetails: userDetails),
                Follower(userDetails: userDetails),
              ],
            ),
          ),
        )
        // }),
        );
  }

  Obx userPic(AllUsercontroll allUsercontroll) {
    return Obx(() {
      if (allUsercontroll.isLoding.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SizedBox(
        height: 180,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 40),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userDetails.pic!,
                ),
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
                      title: userDetails.name!,
                      size: 20,
                      fontfamly: logbtn,
                      fw: FontWeight.w900),

                  // SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      // style: ButtonStyle(shape: OutlinedBorder(side: )),
                      onPressed: () {},
                      child: const Text("unfollow"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

//followers=========================================================================
class Follower extends StatelessWidget {
  Follower({
    Key? key,
    required this.userDetails,
  }) : super(key: key);
  Users userDetails;

  AllUsercontroll allUsercontroll = Get.put(AllUsercontroll());
  UserPostcontroll userpostcontroll = Get.find<UserPostcontroll>();
  String? userId = TokenStorage.getUserIdAndToken("uId");
  @override
  Widget build(BuildContext context) {
    // List<Followers>?followers;
    return Obx(() {
      if (userpostcontroll.isLoding.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userpostcontroll.singleuser.value!.user!.followers!.length,
          itemBuilder: (context, index) {
            print(userpostcontroll.singleuser.value!.user!.followers!.length);
            print(userpostcontroll.singleuser.value!.user!.following!.length);
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListTile(
                // onTap: ontap,
                leading: SizedBox(
                  height: 70,
                  width: 70,
                  child: GestureDetector(
                    onTap: () {
                      print(
                          "${userpostcontroll.singleuser.value!.user!.followers![index].id!}==========follow id");
                      print("${userId}========myid");
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(10),
                          child: Image.network(
                              userpostcontroll.singleuser.value!.user!
                                  .followers![index].pic!,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        )),
                  ),
                ),
                title: Text(
                  userpostcontroll
                      .singleuser.value!.user!.followers![index].name!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                //  trailing: trailing,
              ),
            );
          });
    });
  }
}

//following========================================================================================================
class Following extends StatelessWidget {
  Following({
    Key? key,
    required this.userDetails,
  }) : super(key: key);
  Users userDetails;
  @override
  Widget build(BuildContext context) {
    UserPostcontroll userpostcontroll = Get.find<UserPostcontroll>();
    // List<Followers>?followers;
    return Obx(() {
      if (userpostcontroll.isLoding.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userpostcontroll.singleuser.value!.user!.following!.length,
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
                        child: GestureDetector(
                          onTap: () {
                            print("62fdb37155f9231730d4e796");
                            print(
                                "${userpostcontroll.singleuser.value!.user!.id!.toString()}=========usr id");
                            print(
                                "${userpostcontroll.singleuser.value!.user!.followers![index].id!}==========follow idrr");
                          },
                          child: Image.network(
                              userpostcontroll.singleuser.value!.user!
                                  .following![index].pic!,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        ),
                      )),
                ),
                title: Text(
                  userpostcontroll
                      .singleuser.value!.user!.following![index].name!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                //  trailing: trailing,
              ),
            );
          });
    });
  }
}
//single frends post==========================================================================================================

class AddFriendPosts extends StatelessWidget {
  AddFriendPosts({Key? key}) : super(key: key);
  UserPostcontroll userpostcontroller = Get.find<UserPostcontroll>();

  String? userId = TokenStorage.getUserIdAndToken("uId");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(() {
          if (userpostcontroller.isLoding.value) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (userpostcontroller.singleuser.value!.posts!.isEmpty) {
            const Center(
              child: const Text("data"),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: userpostcontroller.singleuser.value!.posts!.length,
              itemBuilder: (BuildContext context, index) {
                Postd postd =
                    userpostcontroller.singleuser.value!.posts![index];
                bool isLikes = postd.likes!.any((element) => element == userId);
                print("${isLikes}==------------===============------------");
                print("${postd.likes}=========------============");
                print("${userId}--------------");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image.network(
                        userpostcontroller
                            .singleuser.value!.posts![index].photo!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLines(
                              title: userpostcontroller
                                  .singleuser.value!.posts![index].title!,
                              size: 18,
                              fontfamly: headline,
                              color: const Color.fromARGB(255, 104, 101, 101),
                              fw: FontWeight.bold),
                          // Row(
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         if (isLikes) {
                          //           userpostcontroller.putUnlikes(
                          //             postId: postd.id!,
                          //           );
                          //         } else {
                          //           userpostcontroller.putLikes(
                          //             postId: postd.id!,
                          //           );
                          //         }
                          //         print(postd.id);
                          //         print(userId);
                          //       },
                          //       icon: Icon(
                          //         isLikes
                          //             ? Icons.favorite
                          //             : CupertinoIcons.heart,
                          //         size: 30,
                          //         color: isLikes ? red1 : blue1,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Get.to(
                          //           MyComments(cindex: index),
                          //         );
                          //       },
                          //       child: const Icon(
                          //         CupertinoIcons.chat_bubble,
                          //         size: 30,
                          //         color: blue1,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${userpostcontroller.singleuser.value!.posts![index].likes!.length.toString()} likes",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                "${userpostcontroller.singleuser.value!.posts![index].comments!.length.toString()} comments",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              });
        }),
      ),
    );
  }
}
