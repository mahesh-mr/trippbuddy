// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/post_controller/post_controller.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Cmt extends StatelessWidget {
  int index;
  Cmt({Key? key, required this.index}) : super(key: key);
  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final posts = postController.allPosts![index];
    return Scaffold(
        appBar: AppBar(
          backgroundColor:white1,
          title: TextLines(
            title: "Comments",
            size: 18,color: black1,
            fw: FontWeight.bold,
          ),
          centerTitle: true,
          actions: [ IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.arrow_right,
              color: black1,
            ),
          )],
        ),
        body: Column(
         
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: width * .08,
                    backgroundImage: NetworkImage(posts.postedBy!.pic!),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextLines(title: posts.postedBy!.name!, size: 18),
                      TextLines(title: posts.title!, size: 12)
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: gray2,
            ),
            Expanded(
              child: CommentsList(
                postIndex: index,
              ),
            )
          ],
        ));
  }
}

class CommentsList extends StatelessWidget {
  CommentsList({Key? key, required this.postIndex}) : super(key: key);
  int postIndex;

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());

    return ListView.builder(
      itemCount: postController.allPosts![postIndex].comments!.length,
      itemBuilder: (context, index) {
        final posts = postController.allPosts![postIndex].comments![index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(posts.postedBy!.pic ??
                "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=170667a&w=0&h=kEAA35Eaz8k8A3qAGkuY8OZxpfvn9653gDjQwDHZGPE="),
          ),
          title: TextLines(title: posts.postedBy!.name!, size: 18),
          subtitle: TextLines(title: posts.text!, size: 18),
        );

     
      },
    );
  }
}
