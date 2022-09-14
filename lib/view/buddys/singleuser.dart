import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/controller/userprofile_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/allbuddys.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class FriendProfile extends StatelessWidget {
  FriendProfile({
    Key? key,
    required this.userDetails, 
  }) : super(key: key);
  Users userDetails;


   String? userId = TokenStorage.getUserIdAndToken("uId");



  @override
  Widget build(BuildContext context) {
    UserPostcontroll userpostcontroller = Get.put(
      UserPostcontroll(
        userId: userDetails.sId!,
      ),
    );



    AllUsercontroll allUsercontroll = Get.put(AllUsercontroll());
    return Scaffold(
      backgroundColor: white1,
      body: Obx(() {
        if (userpostcontroller.isLoding.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, index) {
              return [
                SliverToBoxAdapter(child: Obx(() {
      if (allUsercontroll.isLoding.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    //  Users users =allUsercontroll.allUsers![followindex!];
   //   bool isfollow =users.followers!.any((element) => element==userId);
      return Container(
    height: 180,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 40),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userDetails.pic!,
                ),
                radius: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextLines(
                      title: userDetails.name!,
                      size: 20,
                      fontfamly: logbtn,
                      fw: FontWeight.w900),
                     // SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                     // style: ButtonStyle(shape: OutlinedBorder(side: )),
                      onPressed: () {
                    // if (isfollow) {
                    // userpostcontroller.putFollows(followId: users.followers
                    // )
                      
                    // }
                       
                      },
                      child: Text("unfollow"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    })),
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  backgroundColor: white1,
                  toolbarHeight: 4,
                  bottom: TabBar(
                    indicator: BoxDecoration(
                        color: blue2,
                        borderRadius: BorderRadius.circular(25.0)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                          text: userpostcontroller.singleuser!.posts!.length
                              .toString()),
                      Tab(
                        text:
                            "${userpostcontroller.singleuser!.user!.following!.length.toString()} Following ",
                      ),
                      Tab(
                          text:
                              "${userpostcontroller.singleuser!.user!.followers!.length.toString()} Followers"),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                AddFriendPosts(),
                Following(userDetails: userDetails),
                Follower(userDetails: userDetails),
              ],
            ),
          ),
        );
      }),
    );
  }

  Obx userPic(AllUsercontroll allUsercontroll) {
    return Obx(() {
      if (allUsercontroll.isLoding.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container(
    height: 180,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 40),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userDetails.pic!,
                ),
                radius: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextLines(
                      title: userDetails.name!,
                      size: 20,
                      fontfamly: logbtn,
                      fw: FontWeight.w900),
                     // SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                     // style: ButtonStyle(shape: OutlinedBorder(side: )),
                      onPressed: () {},
                      child: Text("unfollow"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

//followers=========================================================================
class Follower extends StatelessWidget {
  Follower({
    Key? key,
    required this.userDetails,
  }) : super(key: key);
  Users userDetails;

  AllUsercontroll allUsercontroll = Get.put(AllUsercontroll());
  UserPostcontroll userpostcontroll = Get.find<UserPostcontroll>();

  @override
  Widget build(BuildContext context) {
    // List<Followers>?followers;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userpostcontroll.singleuser!.user!.followers!.length,
        itemBuilder: (context, index) {
     print( userpostcontroll.singleuser!.user!.followers!.length);
        print( userpostcontroll.singleuser!.user!.following!.length);
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListTile(
              // onTap: ontap,
              leading: SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(10),
                      child: Image.network(
                          userpostcontroll
                              .singleuser!.user!.followers![index].pic!,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.lighten),
                    )),
              ),
              title: Text(
                userpostcontroll.singleuser!.user!.followers![index].name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              //  trailing: trailing,
            ),
          );
        });
  }
}

//followers========================================================================================================
class Following extends StatelessWidget {
  Following({
    Key? key,
    required this.userDetails,
  }) : super(key: key);
  Users userDetails;
  @override
  Widget build(BuildContext context) {
    UserPostcontroll userpostcontroll = Get.find<UserPostcontroll>();
    // List<Followers>?followers;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userpostcontroll.singleuser!.user!.following!.length,

        itemBuilder: (context, index) {
         
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListTile(
              // onTap: ontap,
              leading: SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(10),
                      child: GestureDetector(
                        onTap: (){
                           print("62fdb37155f9231730d4e796");
                          print("${userpostcontroll.singleuser!.user!.id!.toString()}=========usr id");
 print("${userpostcontroll

                              .singleuser!.user!.followers![index].id!}==========follow idrr");
                        },
                        child: Image.network(
                            userpostcontroll
                                .singleuser!.user!.followers![index].pic!,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.lighten),
                      ),
                    )),
              ),
              title: Text(
                userpostcontroll.singleuser!.user!.followers![index].name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              //  trailing: trailing,
            ),
          );
        });
  }
}
//single frends post==========================================================================================================

class AddFriendPosts extends StatelessWidget {
  AddFriendPosts({Key? key}) : super(key: key);
  UserPostcontroll userpostcontroller = Get.find<UserPostcontroll>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(() {
          if (userpostcontroller.isLoding.value) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          if (userpostcontroller.singleuser!.posts!.isEmpty) {
            Center(
              child: Text("data"),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: userpostcontroller.singleuser!.posts!.length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image.network(
                        userpostcontroller.singleuser!.posts![index].photo!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLines(
                              title: userpostcontroller
                                  .singleuser!.posts![index].title!,
                              size: 18,
                              fontfamly: headline,
                              color: const Color.fromARGB(255, 104, 101, 101),
                              fw: FontWeight.bold),
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
                    ),
                  ],
                );
              });
        }),
      ),
    );
  }
}
