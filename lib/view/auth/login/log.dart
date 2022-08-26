import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/service/auth/auth_service.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/auth/sign_up/sign_up.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  // final _logcontroller = LogInController();

  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  _emailController.text ="ee@gmail.com";
    //  _passController.text = "123456";
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
                      nameFeild(),
                      SizedBox(
                        height: height * .02,
                      ),
                      passwerdFelid(),
                      SizedBox(
                        height: height * .02,
                      ),
                      LogButton(
                        size: Size(double.infinity, height * .06),
                        edgeInsets: const EdgeInsets.all(0),
                        onpressed: () {
                          if (_formkey.currentState!.validate()) {
                            Auth.loginMethod(
                              _emailController.text,
                              _passController.text,
                            ).then((value) {
                              if (value == "success") {
                                Get.offAll(TabView());
                              }
                            });

                         

                          }

                      
                        },
                        text_or_icon: TextLines(
                            title: "Log In",
                            size: width * .06,
                            fontfamly: logbtn),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign up',
                                  style: TextStyle(color: blue2, fontSize: 18),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(SignUp());
                                      // navigate to desired screen
                                    })
                            ]),
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

  TextForm passwerdFelid() {
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
        controller: _passController,
        title: "Password");
  }

  TextForm nameFeild() {
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
}
