import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/userprofile_service.dart';
import 'package:trippbuddy/model/1_singleuser1.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Single12 extends StatelessWidget {
  Single12({Key? key, required this.singleuser, required this.id})
      : super(key: key);

  Singleuser singleuser;
  int id;
  @override
  Widget build(BuildContext context) {
    SingleUserCloneCont cloneCont = Get.put(
        SingleUserCloneCont(userid: singleuser.user!.followers![id].id!));
    //  AllUsercontroll allUsercontroll = Get.put(AllUsercontroll());

    return Scaffold(
        backgroundColor: white1,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 200,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                       cloneCont. singleuser!.user!.pic!
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
                              title:cloneCont. singleuser!.user!.name!,
                              size: 20,
                              fontfamly: logbtn,
                              fw: FontWeight.w900),
                          // SizedBox(height: 40,),
                          //       Padding(
                          //           padding: const EdgeInsets.only(top: 20),
                          //           child: GetBuilder<UserPostcontroll>(
                          //               builder: (controller) {
                          //             return ElevatedButton(
                          //               style: ElevatedButton.styleFrom(
                          //                   primary: controller.followed
                          //                       ? green2
                          //                       : red1),
                          //               onPressed: () {
                          //                 if (controller.followed) {
                          //                   print("{followed}=======after");

                          //                   allUsercontroll.putUnfollows(
                          //                       unfollowId: userDetails.sId!);
                          //                   print("unfollow");

                          //                   print(
                          //                       "${followed}=====follow/unfollow===============");
                          //                 } else {
                          //                   print("{followed}=======befor");
                          //                   allUsercontroll.putFollows(
                          //                       followId: userDetails.sId!);
                          //                 }
                          //                 controller.followAndUnfollow();

                          //                 controller.getUsersposts();
                          //               },
                          //               child: Text(controller.followed
                          //                   ? "unfollow"
                          //                   : "follow"),
                          //             );
                          //           })),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ]),
                )),
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
                  
                       Tab(
                            text: cloneCont.singleuser!.posts!.length
                                .toString()),
                   
                      Tab(
                        text:
                            "${cloneCont.singleuser!.user!.following!.length} Following ",
                      ),
                 
                        Tab(
                            text:
                                "${cloneCont.singleuser!.user!.followers!.length} Followers")
                      
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Obx(() {
                  if (cloneCont.isLoding.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return AddFriendPosts(singleusers: singleuser, id: id);
                }),
                Following(singleusers: singleuser, id: id),
                Follower(singleusers: singleuser, id: id),
              ],
            ),
          ),
        )
        // }),
        );
  }
}

//followers=========================================================================
class Follower extends StatelessWidget {
  Follower({Key? key, required this.singleusers, required this.id})
      : super(key: key);
  Singleuser singleusers;
  int id;

  // UserPostcontroll userpostcontroll = Get.find<UserPostcontroll>();
  String? userId = TokenStorage.getUserIdAndToken("uId");
  @override
  Widget build(BuildContext context) {
    SingleUserCloneCont cloneCont = Get.find<SingleUserCloneCont>();
    // AllUsercontroll allUsercontroll = Get.find<AllUsercontroll>();
    // List<Followers>?followers;
    return Obx(() {
      if (cloneCont.isLoding.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cloneCont.singleuser!.user!.followers!.length,
          itemBuilder: (context, index) {
            print(cloneCont.singleuser!.user!.followers!.length);
            print(cloneCont.singleuser!.user!.following!.length);
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
                          "${cloneCont.singleuser!.user!.followers![index].id!}==========follow id");
                      print("${userId}========myid");
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(10),
                          child: Image.network(
                              cloneCont.singleuser!.user!
                                  .followers![index].pic!,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        )),
                  ),
                ),
                title: Text(
                  cloneCont.singleuser!.user!.followers![index].name!,
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
  Following({Key? key, required this.singleusers, required this.id})
      : super(key: key);
  Singleuser singleusers;
  int id;
  String? userId = TokenStorage.getUserIdAndToken("uId");
  @override
  Widget build(BuildContext context) {
    SingleUserCloneCont cloneCont = Get.find<SingleUserCloneCont>();


    return Obx(() {
      if (cloneCont.isLoding.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cloneCont.singleuser!.user!.following!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListTile(
                onTap: () {
                  Get.to(Single12(singleuser: singleusers, id: id));
                },
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
                                "${cloneCont.singleuser!.user!.id!.toString()}=========usr id");
                            print(
                                "${cloneCont.singleuser!.user!.followers![index].id!}==========follow idrr");
                          },
                          child: Image.network(
                              cloneCont.singleuser!.user!
                                  .following![index].pic!,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        ),
                      )),
                ),
                title: Text(
                  cloneCont.singleuser!.user!.following![index].name!,
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
  AddFriendPosts({Key? key, required this.singleusers, required this.id})
      : super(key: key);
  Singleuser singleusers;
  int id;
  String? userId = TokenStorage.getUserIdAndToken("uId");

  @override
  Widget build(BuildContext context) {
    SingleUserCloneCont cloneCont = Get.find<SingleUserCloneCont>();
    // AllUsercontroll allUsercontroll = Get.find<AllUsercontroll>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(() {
          if (cloneCont.isLoding.value) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (cloneCont.singleuser!.posts!.isEmpty) {
            const Center(
              child: const Text("data"),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: cloneCont.singleuser!.posts!.length,
              itemBuilder: (BuildContext context, index) {
                Postds postd = cloneCont.singleuser!.posts![index];
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
                        cloneCont.singleuser!.posts![index].photo!,
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
                              title: cloneCont
                                  .singleuser!.posts![index].title!,
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
                                "${cloneCont.singleuser!.posts![index].likes!.length.toString()} likes",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                "${cloneCont.singleuser!.posts![index].comments!.length.toString()} comments",
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
