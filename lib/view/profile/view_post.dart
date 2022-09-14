// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/model/mypost.dart';

import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/createpost/createpost.dart';
import 'package:trippbuddy/view/widgets/text.dart';

// ignore: must_be_immutable
class ViewPost extends StatelessWidget {
  ViewPost({Key? key, required this.mypostViewInx}) : super(key: key);
  int mypostViewInx;
  MyPostController myPostController = Get.put(MyPostController());
  PostController postController = Get.put(PostController());

  String? userId = TokenStorage.getUserIdAndToken("uId");

  @override
  Widget build(BuildContext context) {
    // Posts mypost= myPostController.allMyPosts.value[mypostViewInx];
    // Posts posts = postController.allPosts.value[mypostViewInx];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: black1,
          ),
        ),
        title: TextLines(
          title: "Posts",
          size: 20,
          color: black1,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Obx(() {
            if (myPostController.loding.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return RefreshIndicator(
              onRefresh: () {
                return myPostController.getallMyPosts();
              },
              child: GetBuilder<MyPostController>(initState: (state) {
                myPostController.getallMyPosts();
              }, builder: (context) {
                return ScrollablePositionedList.builder(
                  reverse: true,
                  itemCount: myPostController.allMyPosts.value.length,
                  initialScrollIndex: mypostViewInx,
                  itemBuilder: (context, index) {
                    final viewMyPost = myPostController.allMyPosts[index];
                    Myposts posts = myPostController.allMyPosts[index];
                    bool isLiked =
                        posts.likes!.any((element) => element == userId);
                    print("${posts.likes}=====================");
                    print("${userId}--------------");
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Image.network(
                            posts.photo!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextLines(
                                      title: posts.title!,
                                      size: 18,
                                      fontfamly: headline,
                                      color: const Color.fromARGB(
                                          255, 104, 101, 101),
                                      fw: FontWeight.bold),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Get.to(Createpost(
                                          //image: viewMyPost.photo!,
                                          //  postText: viewMyPost.title!,
                                          ));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: blue1,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (isLiked) {
                                        myPostController.putUnlikes(
                                          postId: posts.sId!,
                                        );
                                      } else {
                                        myPostController.putLikes(
                                          postId: posts.sId!,
                                        );
                                      }
                                      print(posts.sId);
                                      print(userId);
                                    },
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : CupertinoIcons.heart,
                                      size: 30,
                                      color: isLiked ? red1 : blue1,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  // Icon(
                                  //   CupertinoIcons.quote_bubble,
                                  //   size: 30,
                                  //   color: blue1,
                                  // ),
                                ],
                              ),
                              TextLines(
                                title: "${posts.likes!.length} Like",
                                size: 18,
                                fontfamly: headline,
                                fw: FontWeight.bold,
                                color: blue1,
                              ),
                              TextLines(
                                title: "${posts.comments!.length} comments",
                                size: 18,
                                fontfamly: headline,
                                fw: FontWeight.bold,
                                color: blue1,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: gray2,
                        )
                      ],
                    );
                  },
                );
              }),
            );
          })),
    );
  }
}
