import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/home/main_feild/main_feild.dart';
import 'package:trippbuddy/view/home/story_feild/story_feild.dart';

class NewFeid extends StatelessWidget {
  const NewFeid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: white1,
        child:const Icon(
          CupertinoIcons.add_circled,
          color: blue1,
          size: 45,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          StoryFeild(),
          //  AddFeed(),
          SizedBox(
            height: 5,
          ),
          MainFeild(),
        ],
      ),
    );
  }
}
