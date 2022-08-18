// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/onbording_controller/onbording.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Onbording extends StatelessWidget {
  Onbording({Key? key}) : super(key: key);
  final _controller = OnbordingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _controller.pagecontroller,
              onPageChanged: _controller.selectedIndex,
              itemCount: _controller.onbordingList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          _controller.onbordingList[index].assetImage,
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50,left: 10,right: 10, bottom: 10,),
                    child: Builder(builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextLines(
                                title: _controller.onbordingList[index].title,
                                size: 35,
                                fontfamly: corocel1,
                                fw: FontWeight.bold,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: 300,
                                child: TextLines(
                                    title: _controller
                                        .onbordingList[index].discriptions,
                                    size: 18,
                                    fontfamly: corocel2)),
                          ),
                        ],
                      );
                    }),
                  ),
                );
              }),
          Positioned(
            bottom: 25,
            left: 15,
            child: Row(
                children:
                    List.generate(_controller.onbordingList.length, (index) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: _controller.selectedIndex == index ? 25 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _controller.selectedIndex == index ? blue1 : gray2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              });
            })),
          ),
          Positioned(
          bottom: 5,
          right: 10,
            child: LogButton(
              size: Size(90, 30),
              edgeInsets: EdgeInsets.only(left: 0),
              onpressed: _controller.forwerdAction,
              text_or_icon: Obx(() {
                return TextLines(
                  title: _controller.isLastPage ? "Start" : "Next",
                  size: 15,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
