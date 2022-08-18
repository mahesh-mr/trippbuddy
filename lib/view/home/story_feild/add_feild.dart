import 'package:flutter/cupertino.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';

class AddFeed extends StatelessWidget {
  const AddFeed({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Add Feed",
              style: TextStyle(
                  fontSize: 16, color: blue1, fontWeight: FontWeight.bold),
            ),
            const Icon(
              CupertinoIcons.plus_app,
              color: blue1,
            )
          ],
        ),
      ),
    );
  }
}