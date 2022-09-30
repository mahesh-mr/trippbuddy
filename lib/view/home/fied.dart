// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/home/createpost.dart';
import 'package:trippbuddy/view/home/cmt.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class NewFeid extends StatelessWidget {
  NewFeid({Key? key}) : super(key: key);

  String? userId = TokenStorage.getUserIdAndToken("uId");

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());
     Get.put(MyPostController());
     postController.onInit();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Createpost());
        },
        backgroundColor: white1,
        child: const Icon(
          CupertinoIcons.add_circled,
          color: blue1,
          size: 45,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Obx(() {
          if (postController.loding.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () {
              return postController.getPost();
            },
            child: ListView.builder(
                itemCount: postController.allPosts.value.length,
                itemBuilder: (BuildContext context, index) {
                  Posts posts = postController.allPosts[index];

                
                  bool isLiked =
                      posts.likes!.any((element) => element == userId);
                  print("${posts.likes!}=====================");
                  print("${userId}--------------");
                  print("${isLiked}========909090");
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      color: white1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  posts.postedBy!.sId==userId? Get.to(TabView()):null;
                                },
                                child: CircleAvatar(
                                  radius: width * .07,
                                  backgroundImage:
                                      NetworkImage(posts.postedBy!.pic!),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextLines(
                                        title: posts.postedBy!.name!,
                                        size: width * .045),
                                    //   SizedBox(height: height * .006),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * .006,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: height * .3,
                            child: Image.network(
                              posts.photo!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: height * .006,
                          ),
                          SizedBox(
                            height: height * .006,
                          ),
                          TextLines(
                            title: posts.title!,
                            size: width * .04,
                            color: gray1,
                          ),
                          SizedBox(
                            height: height * .006,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (isLiked) {
                                    postController.putUnlikes(
                                      postId: posts.sId!,
                                    );
                                  } else {
                                    postController.putLikes(
                                      postId: posts.sId!,
                                    );
                                  }
                                },
                                icon: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : CupertinoIcons.heart,
                                  size: 30,
                                  color: isLiked ? red1 : blue1,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    MyComments(cindex: index),
                                  );
                                },
                                child: const Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 30,
                                  color: blue1,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLines(
                                  title: "${posts.likes!.length} Likes",
                                  size: 18,
                                  fw: FontWeight.bold),

                              TextLines(
                                  title: "${posts.comments!.length} Comments",
                                  size: 18,
                                  fw: FontWeight.bold),

                              const SizedBox(
                                height: 5,
                              ),
                              // Text(dd.toString())
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
