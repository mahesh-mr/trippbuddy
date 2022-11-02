// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
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
                  return Container(
                    width: double.infinity,
                    color: white1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: width * .04,
                                backgroundImage:
                                    NetworkImage(posts.postedBy!.pic!),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextLines(
                                        title: posts.postedBy!.name!,
                                        size: width * .04,fw: FontWeight.bold,),
                                    //   SizedBox(height: height * .006),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .006,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: height * .35,
                          child: Image.network(
                            posts.photo!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // SizedBox(
                        //   height: height * .001,
                        // ),
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
                      
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextLines(
                            title: posts.title!,
                            size: width * .04,
                            color: black1,fw: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height * .006,
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLines(
                                  title: "${posts.likes!.length} Likes",
                                  size: 14,
                                 color: gray1,fw: FontWeight.bold,),

                              TextLines(
                                  title: "${posts.comments!.length} Comments",
                                  size: 14,color: gray1,fw: FontWeight.bold,
                                  ),

                              const SizedBox(
                                height: 5,
                              ),
                              // Text(dd.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
