import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class MainFeild extends StatelessWidget {
  const MainFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
      padding: EdgeInsets.zero,
      child: ListView.builder(
    
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 50,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: white1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: height * .3,
                      child: Image.asset(
                        "assets/img5.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: height * .006,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: width * .08,
                            backgroundImage: AssetImage('assets/2.jpg')),
                        Padding(
                          padding:  EdgeInsets.only(left: width*.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLines(title: "Amal_Ash", size: width * .045),
                           //   SizedBox(height: height * .006),
                              TextLines(
                                title: "sdfasdf",
                                size: width * .04,color: gray1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                 
                    SizedBox(
                      height: height * .006,
                    ),
                    Wrap(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          CupertinoIcons.heart,
                          size: 30,
                          color: blue1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          CupertinoIcons.quote_bubble,
                          size: 30,
                          color: blue1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          CupertinoIcons.person_2_fill,
                          size: 30,
                          color: blue1,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
