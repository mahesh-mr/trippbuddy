// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/alluser/alluser.dart';
import 'package:trippbuddy/controller/userprofile/userprofile.dart';
import 'package:trippbuddy/model/allbuddys/allbuddys.dart';
import 'package:trippbuddy/model/userpost/userpost.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/add_friend/add_frofile/frofile_add.dart';

import '../../model/user/user_model.dart';

class AddFrendsList extends StatelessWidget {
  AddFrendsList({
    Key? key,
  }) : super(key: key);
 

  AllUsercontroll allUsercontroller = Get.put(AllUsercontroll());
   UserPostcontroll userpostcontroller = Get.put(UserPostcontroll());


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('All Buddys'),
      // subtitle: Text('People you may know'),
      children: [
        LimitedBox(
          maxHeight: 150,
          child: Obx(() {
            if (allUsercontroller.isLoding.value) {
              // ignore: prefer_const_constructors
              Center(
                child: const CircularProgressIndicator(),
              );
            }
            if (allUsercontroller.allUsers!.isEmpty) {
              const Center(
                child: const Text("data"),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allUsercontroller.allUsers!.length,
              itemBuilder: (context, index) {
           //       UserPosts userPosts =allUsercontroller.userPosts![index];
             Users userDetails =   allUsercontroller.allUsers![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                    //  allUsercontroller.allUsers
                      // print(allUsercontroller.allUsers![index]);
                 ///   print(userpostcontroller.userPosts![index].title!);
                      // Get.to(FriendProfile(
                      //  userDetails: userDetails,
                      // ));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      color: white1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 90,
                              height: 90,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      allUsercontroller.allUsers![index].pic!,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                allUsercontroller.allUsers![index].name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // LogButton(
                          //   onpressed: () {},
                          //   text_or_icon: Text(allUsercontroller.allUsers![index].following!.length.toString()),
                          //   size: Size(90, 30),
                          //   edgeInsets: EdgeInsets.zero,
                          // )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        )
      ],
    );
  }
}
