
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class CoverPic extends StatelessWidget {
  const CoverPic({Key? key}) : super(key: key);

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
                Positioned(
                    right: 10,
                    top: 20,
                    child: IconButton(
                        onPressed: () {},
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: white1,
                        )))
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
                ],
              ),
            )
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
