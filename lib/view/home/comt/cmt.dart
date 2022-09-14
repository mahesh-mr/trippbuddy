// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/widgets/text.dart';
class MyComments extends StatelessWidget {
  int index;
  MyComments({Key? key, required this.index}) : super(key: key);
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final posts = postController.allPosts.value[index];

    return Scaffold(
        backgroundColor: white1,
        body: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              SliverToBoxAdapter(child: Obx(() {
                if (postController.loding.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return RefreshIndicator(
                  onRefresh: () {
                    return postController.getPost();
                  },
                  child: Container(
                    //  color: red1,
                    height: 180,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 40),
                      child: Column(children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                CupertinoIcons.arrow_left,
                                color: black1,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextLines(
                              title: "Comments",
                              size: 18,
                              color: black1,
                              fw: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: width * .08,
                              backgroundImage:
                                  NetworkImage(posts.postedBy!.pic!),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextLines(
                                    title: posts.postedBy!.name!, size: 18),
                                TextLines(title: posts.title!, size: 12)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                          color: gray2,
                        ),
                      ]),
                    ),
                  ),
                );
              })),
            ];
          },
          body: CommentsList(postIndex: index),
        ));
  }
}

class CommentsList extends StatelessWidget {
  CommentsList({Key? key, required this.postIndex}) : super(key: key);
  int postIndex;
  PostController postController = Get.put(PostController());
 // MyProfileController myrofileciontroller = Get.put(MyProfileController());
  final _commetController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: Obx(() {
          if (postController.loding.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () {
              return postController.getPost();
            },
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount:
                  postController.allPosts.value[postIndex].comments!.length,
              itemBuilder: (context, index) {
                final posts =
                    postController.allPosts.value[postIndex].comments![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(posts.postedBy!.pic ??
                        "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=170667a&w=0&h=kEAA35Eaz8k8A3qAGkuY8OZxpfvn9653gDjQwDHZGPE="),
                  ),
                  title: TextLines(
                      title: posts.postedBy!.name ??"ggghgh", size: 18),
                  subtitle: TextLines(title: posts.text!, size: 18),
                );
              },
            ),
          );
        }),
      ),
      Form(
      //  key: formkey,
        child: Row(
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
              controller: _commetController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Add a comment",
                border: InputBorder.none,
              ),
          ),
            ),
          IconButton(
          onPressed: () {
            Posts post = postController.allPosts.value[postIndex];
            if (_commetController != null) {
              postController.putMycomments(
                  postId: post.sId!, title: _commetController.text);
              print(post.sId!);
              print(_commetController.text);

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')));
            }
          },
          icon: Icon(
            Icons.send,
            color: blue1,
          ),
        ),
          ],
        ),
      )



      // ListTile(
      //   leading: CircleAvatar(
      //     backgroundImage: NetworkImage(
      //       myrofileciontroller.userProfile!.userData!.pic!,
      //     ),
      //     //  radius: 60,
      //   ),
      //   title: Form(
      //     //  key: formkey,
      //     child: TextFormField(
      //       controller: _commetController,
      //       validator: (value) {
      //         if (value == null || value.isEmpty) {
      //           return 'Please enter some text';
      //         }
      //         return null;
      //       },
      //       keyboardType: TextInputType.text,
      //       decoration: InputDecoration(
      //         hintText: "Add a comment",
      //         border: InputBorder.none,
      //       ),
      //     ),
      //   ),
      //   trailing: IconButton(
      //     onPressed: () {
      //       Posts post = postController.allPosts.value[postIndex];
      //       if (_commetController != null) {
      //         postController.putMycomments(
      //             postId: post.sId!, title: _commetController.text);
      //         print(post.sId!);
      //         print(_commetController.text);

      //         ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('Processing Data')));
      //       }
      //     },
      //     icon: Icon(
      //       Icons.send,
      //       color: blue1,
      //     ),
      //   ),
      // ),
    ]);
  }
}
