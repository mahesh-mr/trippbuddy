import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/mypost/mypost.dart';
import 'package:trippbuddy/service/mypost/mypost.dart';
import 'package:trippbuddy/view/profile/post/view_post/view_post.dart';

class Post extends StatelessWidget {
  Post({
    Key? key,
  }) : super(key: key);

  MyPostController myPostController = Get.put(MyPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   MyPostService.getMyPosts();
      // }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          if (myPostController.loding.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (myPostController.allMyPosts.isEmpty) {
            return const Center(
              child: Text("Data not found"),
            );
          }

          return GridView.builder(
              //   physics: NeverScrollableScrollPhysics(),

              //  reverse: true,
              //   shrinkWrap: true,
              itemCount: myPostController.allMyPosts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 2,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewPost(mypostViewInx:int.parse(myPostController.allMyPosts![index].sId,)
                         )));
                  },
                  child: Container(
                    width: 100.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              myPostController.allMyPosts[index].photo!)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
