
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/cratepost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/model/mypost.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<CreatepostController>(
          dispose: (_) {
            _updatetitle.dispose();
 
          },
          initState: (state) {
               _updatetitle.text = myprofile.userData!.name!;
          },
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Container(
                    height: 300,
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
                        textFom(),
                        SizedBox(
                          height: 10,
                        ),
                        LogButton(
                          edgeInsets: const EdgeInsets.all(0),
                          onpressed: () {
                            bool isvalid = _fomkey.currentState!.validate();
                            if (isvalid) {
                              myPostController.editPost(
                                  postId: posts.sId!, title: _updatetitle.text);
                            }
                            Get.offAll(TabView());
                          },
                          text_or_icon: TextLines(
                              title: "Update", size: 25, fontfamly: logbtn),
                          size: const Size(double.infinity, 50),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
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
