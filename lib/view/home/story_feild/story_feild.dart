import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/home/story_feild/view_story/view_story.dart';

class StoryFeild extends StatelessWidget {
  const StoryFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
        maxHeight: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index != 0
                ? InkWell(
                    onTap: () {
                      Get.to(const ViewStory());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(10), // Image radius
                                child: Image.asset("assets/pro2.jpg",
                                    fit: BoxFit.cover,
                                    colorBlendMode: BlendMode.lighten),
                              ),
                            ),
                          ),
                          const Positioned(
                              bottom: 0,
                              child: SizedBox(
                                  width: 80,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text("Abhi_Smokey",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18, color: white1)),
                                  ))),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(10), // Image radius
                              child: Image.asset("assets/pr1.jpg",
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.lighten),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 35,
                            child: SizedBox(
                                width: 80,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.add_circled,
                                        color: white1,
                                        size: 50,
                                      )),
                                ))),
                      ],
                    ),
                  );
          },
        ));
  }
}
