import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/controller/createpost/cratepost.dart';
import 'package:trippbuddy/model/createpost/createpost.dart';
import 'package:trippbuddy/service/createPost/createpost.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/home/fied.dart';
import 'package:trippbuddy/view/profile/post/view_post/view_post.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class createpost extends StatelessWidget {
  createpost({Key? key,this.isEditing=false,this.newpost}) : super(key: key);
  bool isEditing;
  NewCreatePost? newpost;

  final _fomkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  CreatepostController createpostcontroller = Get.put(CreatepostController());

  final cloudinarypath = CloudinaryPublic(
    'djlb1ukew',
    'q1inzhhd',
    cache: false,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
        ),
        body: GetBuilder<CreatepostController>(
          initState: (state) {
         if(isEditing){
          _title.text = newpost!.title;
         }
          },
          builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                controller.imagePath != null
                    ? Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: FileImage(
                                  File(
                                    controller.imagePath.toString(),
                                  ),
                                ),
                                fit: BoxFit.fill)),
                      )
                    : Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "http://res.cloudinary.com/ameen123/image/upload/v1661326487/z9z4pbgwdqtvmmk5ytdv.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 10,),
                Form( 

                  key: _fomkey,
                  child: Column(
                    children: [
                      TextForm(
                        controller: _title,
                        title: "caption..",
                        validator: (value) {
                          if (value!.length == 0) {
                            return "capttion minimum  1 length";
                          } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                            return 'Please enter a valid name';
                          } else {
                            return null;
                          }
                        },
                        type: TextInputType.name,
                      ),  SizedBox(height: 10,),
                      //   ElevatedButton(onPressed: (){}, child: Text("data")),
                      LogButton(
                        edgeInsets: const EdgeInsets.all(0),
                        onpressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Select Choice',
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        controller.picImage(ImageSource.camera);
                                      },
                                      icon: const Icon(Icons.camera)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        controller.picImage(ImageSource.gallery);
                                      },
                                      icon: const Icon(Icons.photo)),
                                ],
                              );
                            },
                          );
                        },
                        text_or_icon: TextLines(
                            title: "Select Image", size: 30, fontfamly: logbtn),
                        size: const Size(double.infinity, 50),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LogButton(
                        edgeInsets: const EdgeInsets.all(0),
                        onpressed: () async {
                          if (controller.imagePath == null) {
                            Get.snackbar("warning", "please add profile pic!");

                            return;
                          }
                          bool isvalid = _fomkey.currentState!.validate();
                          if (isvalid) {
                            try {
                              CloudinaryResponse response = await cloudinarypath
                                  .uploadFile(CloudinaryFile.fromFile(
                                      createpostcontroller.imagePath!,
                                      folder: "Avatar",
                                      resourceType:
                                          CloudinaryResourceType.Image));
                              await CreatePostService.createPost(
                                  title: _title.text,
                                  avathar: response.secureUrl);
                                  if(isEditing){
                                   // createpostcontroller
                                  }
                              print(response);
                              Get.offAll( ViewPost());
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        text_or_icon: TextLines(
                            title: "Uplod", size: 30, fontfamly: logbtn),
                        size: const Size(double.infinity, 50),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
