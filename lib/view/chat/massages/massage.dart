import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/chat/personal_msg/personal_msg.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Massages extends StatelessWidget {
  const Massages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextLines(
            title: "Recent Chats",
            size: 18,
            fw: FontWeight.bold,
          ),
        )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 155,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PeronalChat(),
                        ),
                      );
                    },
                    leading: SizedBox(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(10), // Image radius
                            child: Image.asset("assets/3.jpg",
                                fit: BoxFit.cover,
                                colorBlendMode: BlendMode.lighten),
                          )),
                    ),
                    title: TextLines(
                        title: "Hari",
                        size: 20,
                        fontfamly: logbtn,
                        fw: FontWeight.bold),
                    subtitle: TextLines(
                        title: "hellooooooo.......",
                        size: 20,
                        fontfamly: logbtn,
                        fw: FontWeight.bold),
                  ));
            }),
      ],
    );
  }
}
