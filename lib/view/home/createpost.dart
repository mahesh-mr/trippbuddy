// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/controller/controller/cratepost_controller.dart';
import 'package:trippbuddy/model/createpost.dart';
import 'package:trippbuddy/controller/service/createpost_service.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Createpost extends StatelessWidget {
   Createpost({
    Key? key,

    this.newpost,
  
  }) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<CreatepostController>(dispose: (_) {
        _title.dispose();
        createpostcontroller.imagePath = null;
      }, initState: (state) {
       
      }, builder: (controller) {
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
                            fit: BoxFit.fill),
                      ),
                    )
                  : dummyImage(context, controller),
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
                    //   ElevatedButton(onPressed: (){}, child: Text("data")),

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
                                print(_title.text);
                            // if (isEditing) {
                            //   // createpostcontroller
                            // }
                            print(response);
                            Get.offAll(TabView());
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      text_or_icon: TextLines(
                          title: "Uplod Image", size: 25, fontfamly: logbtn),
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
//<<<<<<<<<<<<<<<<<<<<<<textfomfeid>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  TextForm textFom() {
    return TextForm(
                    controller: _title,
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
  //<<<<<<<<<<<<<<<<<dummy images>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  GestureDetector dummyImage(BuildContext context, CreatepostController controller) {
    return GestureDetector(
                    onTap: () {
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
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(
                                "assets/imageplace.jpg",
                              ),
                              fit: BoxFit.cover)),
                    ),
                  );
  }
}
