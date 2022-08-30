import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/controller/login_controller/logincontroller.dart';
import 'package:trippbuddy/service/auth/auth_service.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/auth/login/log.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);


  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _cpassController = TextEditingController();

  SignUpController loginController = Get.put(SignUpController());

  final cloudinary = CloudinaryPublic(
    'djlb1ukew',
    'q1inzhhd',
    cache: false,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white1,
        body: Center(
          child: GetBuilder<SignUpController>(builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: height * .02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addImage(controller, context, height, width),
                    SizedBox(
                      height: height * .02,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          // nameFeild(),
                          nameFeild(),
                          SizedBox(
                            height: height * .02,
                          ),
                          emailFeild(),
                          SizedBox(
                            height: height * .02,
                          ),
                          passwerdFelid(),
                          SizedBox(
                            height: height * .02,
                          ),
                          LogButton(
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
                                            controller
                                                .picImage(ImageSource.camera);
                                          },
                                          icon: const Icon(Icons.camera)),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            controller
                                                .picImage(ImageSource.gallery);
                                          },
                                          icon: const Icon(Icons.photo)),
                                    ],
                                  );
                                },
                              );
                            },
                            text_or_icon: TextLines(
                                title: "Select Image",
                                size: width * .06,
                                fontfamly: logbtn),
                            edgeInsets: const EdgeInsets.only(left: 0),
                            size: Size(double.infinity, height * .06),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),

                          LogButton(
                            size: Size(double.infinity, height * .06),
                            edgeInsets: const EdgeInsets.only(left: 0),
                            onpressed: () async {
                              if (controller.imagePath == null) {
                                Get.snackbar(
                                    "warning", "please add profile pic!");

                                return;
                              }

                              bool isValid = _formkey.currentState!.validate();

                              if (isValid) {
                                try {
                                  CloudinaryResponse response =
                                      await cloudinary.uploadFile(
                                    CloudinaryFile.fromFile(
                                        loginController.imagePath!,
                                        folder: "Avatar",
                                        resourceType:
                                            CloudinaryResourceType.Image),
                                  );

                                  await Auth.signUpMethod(
                                      email: _emailController.text,
                                      password: _passController.text,
                                      name: _nameController.text,
                                      pic: response.secureUrl);
                                  print(response);
                                  Get.offAll(LogIn());
                                  print(response);
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            text_or_icon: TextLines(
                                title: "Sign Up",
                                size: width * .06,
                                fontfamly: logbtn),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),

                          alreyAccount(width, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Column addImage(SignUpController controller, BuildContext context,
      double height, double width) {
    return Column(
      children: [
        controller.imagePath != null
            ? CircleAvatar(
                radius: 55,
                backgroundImage: FileImage(
                  File(
                    controller.imagePath.toString(),
                  ),
                ),
              )
            : const CircleAvatar(
                radius: 55,
                backgroundColor: gray2,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: white1,
                  child: Icon(
                    Icons.person,
                    size: 65,
                    color: gray2,
                  ),
                ),
              ),
        SizedBox(
          height: height * .02,
        ),
        Center(
          child: TextLines(
            title: "Tripbuddy",
            size: width * .10,
            // fontfamly: head,
            fw: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<<iMAGE>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  SignUpController picImage(SignUpController controller) => controller;

  Padding alreyAccount(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: RichText(
        text: TextSpan(
            text: 'Alredy have an account?',
            style: const TextStyle(color: Colors.black, fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                  text: ' Log In',
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 18),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offAll(LogIn());
                    })
            ]),
      ),
    );
  }

//===========================================================================================================
  TextForm confirmPassFeild() {
    return TextForm(
        type: TextInputType.visiblePassword,
        validator: (value) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return 'Please enter password';
          } else {
            if (!regex.hasMatch(value)) {
              return 'Enter valid password';
            } else if (value != _passController.text) {
              return 'Not Match';
            } else {
              return null;
            }
          }
        },
        controller: _cpassController,
        title: "Confirm password");
  }

//===========================================================================================================
  TextForm passwerdFelid() {
    return TextForm(
        type: TextInputType.visiblePassword,
        validator: (value) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return 'Please enter password';
          }

          return null;
        },
        controller: _passController,
        title: "password");
  }

  //===========================================================================================================
  TextForm emailFeild() {
    return TextForm(
        type: TextInputType.emailAddress,
        validator: (value) {
          if (value == null) {
            return "Required Field";
          } else if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "Enter a valid email";
          } else {
            return null;
          }
        },
        controller: _emailController,
        title: "Email");
  }

  //===========================================================================================================
  TextForm nameFeild() {
    return TextForm(
        controller: _nameController,
        title: "User name",
        validator: (value) {
          if (value!.length == 0) {
            return "Enter your name";
          } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
            return 'Please enter a valid name';
          } else {
            return null;
          }
        },
        type: TextInputType.name);
  }
}
