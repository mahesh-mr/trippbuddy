// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/mypost/mypost.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/createpost/createpost.dart';
import 'package:trippbuddy/view/widgets/text.dart';

// ignore: must_be_immutable
class ViewPost extends StatelessWidget {
  ViewPost({Key? key,required this.mypostViewInx }) : super(key: key);
 int mypostViewInx;
  MyPostController myPostController = Get.put(MyPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: white1,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.arrow_left,
              color: black1,
            ),
          ),
          title: TextLines(
            title: "Posts",
            size: 20,
            color: black1,
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
        child: GetBuilder<MyPostController>(
          builder: (controller) {
            return ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: myPostController.allMyPosts.length,
                itemBuilder: (BuildContext context, index) {
                  final viewMyPost = myPostController.allMyPosts[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                       height: 300,
                        child: Image.network(
                          viewMyPost.photo!,
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
                                    title: viewMyPost.title!,
                                    size: 18,
                                    fontfamly: headline,
                                    color: const Color.fromARGB(255, 104, 101, 101),
                                    fw: FontWeight.bold),
                                const Spacer(),
                                IconButton(onPressed: (){
                                 Get.to(createpost());
                                }, icon:  Icon(
                                 Icons.edit,
                                  size: 30,
                                  color: blue1,
                                ),)
                                
                              ],
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
                              ],
                            ),
                            TextLines(
                              title: "${viewMyPost.likes!.length} Like",
                              size: 18,
                              fontfamly: headline,
                              fw: FontWeight.bold,
                              color: blue1,
                            ),
                            TextLines(
                              title: "${viewMyPost.comments!.length} comments",
                              size: 18,
                              fontfamly: headline,
                              fw: FontWeight.bold,
                              color: blue1,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: gray2,
                      )
                    ],
                  );
                });
          }
        ),
      ),
    );
  }
}
