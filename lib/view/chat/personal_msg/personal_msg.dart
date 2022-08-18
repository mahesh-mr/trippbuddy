import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/personal_msg_controller/personal_msg_controller.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/chat/personal_msg/p_message/p_message.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class PeronalChat extends StatelessWidget {
  PeronalChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            leadingWidth: 70,
            // toolbarHeight: 50,
            toolbarHeight: 75,
            elevation: 0,
            backgroundColor: white1,
            leading:

                //
                const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/3.jpg'),
             //   radius: 15.0,
              ),
            ),

            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  TextLines(
                    title: "Hari",
                    size: 20,
                    fontfamly: logbtn,
                    color: black1,fw: FontWeight.bold,
                  ),
                  TextLines(
                    title: "Online",
                    size: 16,
                    fontfamly: logbtn,
                    color: black1,
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(CupertinoIcons.arrow_left),
              )
            ],
          ),
        ),
        body: Column(
        //  shrinkWrap: true,
          children: [
           Expanded(child: PMessages()),
         // Spacer(),
            Positioned(
              child: Container(
                color: white1,
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: SafeArea(
                  
                  child: Row(
                    children: [
                      SizedBox(
                        width:320,
                        height: 70,
                       
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: white1,
                            filled: true,
                            hintText: "type......",
                            focusColor: white1,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.send,size: 40,color: blue1,)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
