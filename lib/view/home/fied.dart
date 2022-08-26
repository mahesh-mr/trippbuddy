import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/alluser/alluser.dart';
import 'package:trippbuddy/controller/myprofile/myprofile.dart';
import 'package:trippbuddy/controller/post_controller/post_controller.dart';
import 'package:trippbuddy/controller/userprofile/userprofile.dart';
import 'package:trippbuddy/model/post_model/post_model.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/auth/login/log.dart';
import 'package:trippbuddy/view/createpost/createpost.dart';
import 'package:trippbuddy/view/home/comt/cmt.dart';
import 'package:trippbuddy/view/updatepassword/updatepassword.dart';
import 'package:trippbuddy/view/widgets/text.dart';

// ignore: must_be_immutable
class NewFeid extends StatelessWidget {
  NewFeid({Key? key}) : super(key: key);
  PostController postController = Get.put(PostController());
   AllUsercontroll allUsercontroller = Get.put(AllUsercontroll());
    MyProfileController myrofileciontroller = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      Get.to(createpost());
    //  AllUsersrService.getAllUsers();
   // Get.to(UpdatedPassword());
 
    // TokenStorage.removed("token");
    //       print("iiiiiiiiiiiiii");
       //   Get.to(LogIn());

          //   PostClassService.getPostService();

          // String? token = TokenStorage.getUserIdAndToken("token");
        },
        backgroundColor: white1,
        child: const Icon(
          CupertinoIcons.add_circled,
          color: blue1,
          size: 45,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Obx(() {
          if (postController.loding.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: postController.allPosts!.length,
              itemBuilder: (BuildContext context, index) {
                Posts posts = postController.allPosts![index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    color: white1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: width * .07,
                              backgroundImage:
                                  NetworkImage(posts.postedBy!.pic!),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * .03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextLines(
                                      title: posts.postedBy!.name!,
                                      size: width * .045),
                                  //   SizedBox(height: height * .006),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .006,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: height * .3,
                          child: Image.network(
                            posts.photo!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: height * .006,
                        ),
                        SizedBox(
                          height: height * .006,
                        ),
                        TextLines(
                          title: posts.title!,
                          size: width * .04,
                          color: gray1,
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
                            ),IconButton(onPressed: (){
                              print(myrofileciontroller.userdetails![index].pic);
                          //  print(userpostcontroller.userPosts![index].photo);
                            //  print(allUsercontroller.allUsers![index].user!.pic!.length);
                            }, icon: Icon(
                              CupertinoIcons.person_2_fill,
                              size: 30,
                              color: blue1,
                            ))
                             
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                child: TextLines(
                                    title: "${posts.likes!.length} Likes",
                                    size: 18,
                                    fw: FontWeight.bold)),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () => Get.to(Cmt(
                                          index: index,
                                        )),
                                    child: TextLines(
                                        title:
                                            "${posts.comments!.length} Comments",
                                        size: 18,
                                        fw: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(posts.updatedAt!)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
      //   body: ListView(
      //     shrinkWrap: true,
      //     children:  [
      //  //     StoryFeild(),
      //       //  AddFeed(),
      //       SizedBox(
      //         height: 5,
      //       ),
      //       MainFeild(),
      //     ],
      //   ),
    );
  }
}
