// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key, required this.myprofile}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  Myprofile myprofile;

  @override
  Widget build(BuildContext context) {
    MyProfileController myprofileciontroller = Get.find<MyProfileController>();
    UserData myprofiles = myprofileciontroller.profile.value!.userData!;
    nameController.text = myprofile.userData!.name!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white1,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: black1,
            )),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: black1),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String? userId = TokenStorage.getUserIdAndToken("uId");
              bool? isValid = formKey.currentState!.validate();
              print(isValid);
              print("oldnameeeeeeeeeeeeeeeeeeeee");

              if (isValid) {
                myprofileciontroller.updateUserData(
                    userId: myprofiles.id!, name: nameController.text);
                Get.back();
                // controller.

              }
            },
            icon: Icon(
              Icons.check,
              color: blue1,
            ),
          ),
        ],
      ),
      body: Obx(() {
        Myprofile? userdata = myprofileciontroller.profile.value;
        if (userdata == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(myprofile.userData!.pic!),
                  radius: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<MyProfileController>(initState: (state) {
                  // nameController.text = myprofile.userData!.name!;
                }, builder: (controller) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Enter your name";
                            } else if (!RegExp(r'(^[a-z A-Z]+$)')
                                .hasMatch(value)) {
                              return 'Please enter a valid name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: white1,
                            filled: true,

                            //   label: Text( "User name"),
                            focusColor: red1,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        // ElevatedButton(
                        //     //  style: ElevatedButton.styleFrom(maximumSize: Size(300, 40)),
                        //     onPressed: () {
                        //       String? userId =
                        //           TokenStorage.getUserIdAndToken("uId");
                        //       bool? isValid = formKey.currentState!.validate();
                        //       print(isValid);
                        //       print("oldnameeeeeeeeeeeeeeeeeeeee");

                        //       if (isValid) {
                        //         myprofileciontroller.updateUserData(
                        //             userId: myprofiles.id!,
                        //             name: nameController.text);
                        //         Get.back();
                        //         // controller.

                        //       }
                        //     },
                        //     child: const Text("Updated"))
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
