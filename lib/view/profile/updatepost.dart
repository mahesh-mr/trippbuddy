import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/cratepost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/model/mypost.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class UpdatedPost extends StatelessWidget {
  UpdatedPost({Key? key, required this.editindex}) : super(key: key);
  int editindex;
  final _updatetitle = TextEditingController();
  final _fomkey = GlobalKey<FormState>();
  Myprofile myprofile = Myprofile();
  CreatepostController createpostController = Get.put(
    CreatepostController(),
  );
  MyPostController myPostController = Get.find<MyPostController>();

  @override
  Widget build(BuildContext context) {
    Myposts posts = myPostController.allMyPosts[editindex];
    _updatetitle.text = posts.title!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: black1,
          ),
        ),
        title: TextLines(
          title: "Edit Tite",
          size: 20,
          color: black1,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  bool isvalid = _fomkey.currentState!.validate();
                  if (isvalid) {
                    myPostController.editPost(
                        postId: posts.sId!, title: _updatetitle.text);
                  }
                  Get.offAll(TabView());
                },
                icon: Icon(
                  Icons.check,
                  color: blue1,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1 / 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(posts.photo!), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _fomkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _updatetitle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "capttion minimum  1 length";
                      } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                        return 'Please enter a valid name';
                      } else {
                        return null;
                      }
                    },
                    decoration:
                        InputDecoration( label: Text("Edit Post")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextForm textFom() {
    return TextForm(
      controller: _updatetitle,
      title: "caption..",
      validator: (value) {
        if (value!.isEmpty) {
          return "capttion minimum  1 length";
        } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
          return 'Please enter a valid name';
        } else {
          return null;
        }
      },
      type: TextInputType.name,
    );
  }
}
