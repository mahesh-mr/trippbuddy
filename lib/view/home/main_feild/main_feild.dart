import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/post_controller/post_controller.dart';
import 'package:trippbuddy/model/post_model/post_model.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/home/comt/cmt.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class MainFeild extends StatelessWidget {
  MainFeild({Key? key,}) : super(key: key);
  // int? index;

  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Padding(
      padding: EdgeInsets.zero,
      child: Obx(() {
        if (postController.loding.value) {
          return Center(
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
                          
                          
                            Icon(
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
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              
                            child: TextLines( title: "${posts.likes!.length} Likes", size: 18,fw: FontWeight.bold)),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => Get.to(Cmt(index: index,)),
                                    child: TextLines(title: "${posts.comments!.length} Comments", size: 18,fw: FontWeight.bold)),
                                ],
                              ),
                                SizedBox(height: 5,),
                                Text(posts.updatedAt!)
                             
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
