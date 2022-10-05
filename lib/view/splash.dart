import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/onbording_controller.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  OnbordingController onbordingController = Get.put(OnbordingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:white1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/logop.png",
                height: 150,
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Trippbuddy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.blue,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
