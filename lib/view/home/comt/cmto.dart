

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class mm extends StatelessWidget {
   mm({ Key? key,required this.postIndex }) : super(key: key);
   int postIndex;
  final _commetedit= TextEditingController();
  final fomkey =GlobalKey<FormState>();
 PostController postController = Get.put(PostController());
//  MyProfileController myrofileciontroller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: fomkey,
          child: 
        Column(
          children: [
      TextFormField(
              controller: _commetedit,
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
            IconButton(
            onPressed: () {
              Posts post = postController.allPosts.value[postIndex];
              postController.putMycomments(
                    postId: post.sId!, title: _commetedit.text);
                print(post.sId!);
                print(_commetedit.text);
      
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')));
            },
            icon: Icon(
              Icons.send,
              color: blue1,
            ),
          ),
      
      
      
      
       ]       ),       
        ),
      ),
    );
    
  }
}