import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/service/auth/auth_service.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/profile/profile.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class UpdatedPassword extends StatelessWidget {
  UpdatedPassword({Key? key,this.uid}) : super(key: key);
  // final _logcontroller = LogInController();
String? uid;

  final _formkey = GlobalKey<FormState>();


 final _oldpassController = TextEditingController();
  final _newpassController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white1,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextLines(
                title: "Tripbuddy",
                size: width * .10,
                fontfamly: head,
                fw: FontWeight.bold,
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formkey,
                  child: Column(
                    children: [
                       nwepassword(),
                    
                      SizedBox(
                        height: height * .02,
                      ),
                      oldpassword(),
                      SizedBox(
                        height: height * .02,
                      ),
                      LogButton(
                        size: Size(double.infinity, height * .06),
                        edgeInsets: const EdgeInsets.all(0),
                        onpressed: () {
                          // if (_formkey.currentState!.validate()) {
                          //   Auth.UpdatePassword(   _oldpassController.text, _newpassController.text,uid )
                            
                         
                            
                          //   .then((value) {
                          //     if (value == "success") {
                          //       Get.offAll(Profile());
                          //     }
                          //   });

                         

                          //  }

                      
                        },
                        text_or_icon: TextLines(
                            title: "Update",
                            size: width * .06,
                            fontfamly: logbtn),
                      ),
                     
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextForm oldpassword() {
    return TextForm(
        type: TextInputType.visiblePassword,
        validator: (value) {
          // RegExp regex = RegExp(
          //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
        controller: _oldpassController,
        title: "Password");
  }
 TextForm nwepassword() {
    return TextForm(
        type: TextInputType.visiblePassword,
        validator: (value) {
          // RegExp regex = RegExp(
          //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return 'Please enter password';
          }else if (
            _oldpassController.text==_newpassController.text
          ) {
            return "old and new password can't be same";
          }
          return null;
        },
        controller: _newpassController,
        title: "Password");
  }

  // TextForm nameFeild() {
  //   return TextForm(
  //       type: TextInputType.emailAddress,
  //       validator: (value) {
  //         if (value == null) {
  //           return "Required Field";
  //         } else if (!RegExp(
  //                 r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
  //             .hasMatch(value)) {
  //           return "Enter a valid email";
  //         }

  //          else {
  //           return null;
  //         }
  //       },
  //       controller: _newpassController,
  //       title: "Email");
  // }
}