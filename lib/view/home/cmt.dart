// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class MyComments extends StatelessWidget {
  MyComments({Key? key, required this.cindex}) : super(key: key);
  int cindex;

  PostController postController = Get.put(PostController());
  String? userid = TokenStorage.getUserIdAndToken('uId');

  final _commetController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final posts = postController.allPosts[cindex];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: width * .01),
            child: Obx(() {
              if (postController.loding.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: black1,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(posts.postedBy!.pic!),
                    maxRadius: width * .06,
                  ),
                  SizedBox(
                    width: width * .012,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          posts.postedBy!.name!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            if (postController.loding.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: postController.allPosts[cindex].comments!.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  final posts = postController.allPosts[cindex].comments![index];
                  return ListTile(
                    leading: images(posts),
                    title: TextLines(title: posts.postedBy!.name!, size: 18),
                    subtitle: TextLines(title: posts.text ?? "poli", size: 18),
                    trailing: posts.postedBy!.sId == userid
                        ? IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Do you Want Delete?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          postController.deleteCmt(
                                              postId: postController
                                                  .allPosts[cindex].sId!,
                                              commentId: posts.sId!);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Delete",
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
                            icon: Icon(
                              Icons.delete,
                              color: black1,
                            ))
                        : null,
                  );
                },
              ),
            );
          }),
          Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Form(
        key: formkey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _commetController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "minimum  1 length";
                  } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                    return 'Please enter a valid Location';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    hintText: "Write message...",
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {
               Posts post = postController.allPosts[cindex];
        bool lsvalid = formkey.currentState!.validate();
        if (lsvalid) {
          postController.putMycomments(
              postId: post.sId!, text: _commetController.text);
          _commetController.clear();
        }
      },
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    )


          // GetBuilder<PostController>(dispose: (_) {
          //   _commetController.dispose();
          // }, builder: (controller) {
          //   return Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Container(
          //       padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
          //       height: 60,
          //       width: double.infinity,
          //       color: Colors.white,
          //       child: Form(
          //         key: formkey,
          //         child: Row(
          //           children: [
          //             CircleAvatar(
          //               backgroundImage: NetworkImage(
          //                   posts.comments![cindex].postedBy!.pic!),
          //             ),
          //             SizedBox(
          //               width: width * .02,
          //             ),
          //             cmtFeld(),
          //             SizedBox(
          //               width: 15,
          //             ),
          //             submitButton(context),
          //           ],
          //         ),
          //       ),
          //     ),
          //   );
          // }),
        ],
      ),
    );
  }

//==================images====================================
  CircleAvatar images(Comments posts) {
    return CircleAvatar(
      backgroundImage: NetworkImage(posts.postedBy!.pic ??
          "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=170667a&w=0&h=kEAA35Eaz8k8A3qAGkuY8OZxpfvn9653gDjQwDHZGPE="),
    );
  }

//===================submitButton=======================================
  FloatingActionButton submitButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Posts post = postController.allPosts[cindex];
        bool lsvalid = formkey.currentState!.validate();
        if (lsvalid) {
          postController.putMycomments(
              postId: post.sId!, text: _commetController.text);
          _commetController.clear();
        }
      },
      child: Icon(
        Icons.send,
        color: Colors.white,
        size: 18,
      ),
      backgroundColor: Colors.blue,
      elevation: 0,
    );
  }
  //================commment field============================

  Expanded cmtFeld() {
    return Expanded(
      child: TextFormField(
        controller: _commetController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "Add a commen",
            hintStyle: TextStyle(color: Colors.black54),
            border: InputBorder.none),
      ),
    );
  }
}
