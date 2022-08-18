import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class ViewPost extends StatelessWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 55,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const CircleAvatar(
            backgroundImage:  AssetImage('assets/3.jpg'),
            radius: 25.0,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.gear_alt_fill,
                  color: black1,
                ))
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (BuildContext context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Image.asset(
                      "assets/img5.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextLines(
                                title: "#Trip to Goa",
                                size: 18,
                                fontfamly: headline,
                                color: const Color.fromARGB(255, 104, 101, 101),
                                fw: FontWeight.bold),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.pen,
                              size: 30,
                              color: blue1,
                            ),
                          ],
                        ),
                        TextLines(
                          title: "1 Like",
                          size: 18,
                          fontfamly: headline,
                          fw: FontWeight.bold,
                          color: blue1,
                        ),
                        Row(
                          children: const [
                            Icon(
                              CupertinoIcons.heart,
                              size: 30,
                              color: blue1,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.quote_bubble,
                              size: 30,
                              color: blue1,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              CupertinoIcons.person_2_fill,
                              size: 30,
                              color: blue1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
