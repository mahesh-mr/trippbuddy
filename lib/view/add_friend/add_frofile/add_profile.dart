import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class AddFriendProfile extends StatelessWidget {
  const AddFriendProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset(
                    "assets/pr1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: TextLines(
                        title: "Nakul",
                        size: 20,
                        fontfamly: logbtn,
                        fw: FontWeight.w900),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LogButton(
                      onpressed: () {},
                      text_or_icon:const Text("Connet"),
                      size: const Size(50, 30),
                      edgeInsets: const EdgeInsets.only(left: 10, right: 10),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(10), // Image radius
                child: Image.asset("assets/pro2.jpg",
                    fit: BoxFit.cover, colorBlendMode: BlendMode.lighten),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
