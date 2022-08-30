import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/follow/follow.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class viewAddFriend extends StatelessWidget {
  viewAddFriend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              SliverToBoxAdapter(
                  //  child: ,
                  ),
              SliverAppBar(
                elevation: 0,
                pinned: true,
                backgroundColor: white1,
                toolbarHeight: 4,
                bottom: TabBar(
                  indicator: BoxDecoration(
                      color: blue2, borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: "Post",
                    ),
                    Tab(
                      text: "Followers",
                    ),
                    Tab(text: "Following"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              post(),
              Follow(image: "assets/pr1.jpg", title: "Anil"),
              Follow(image: "assets/3.jpg", title: "Austin"),
            ],
          ),
        ),
      ),
    );
  }

  Padding post() {
    return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 40,
                  itemBuilder: (BuildContext context, index) {
                    //  final viewMyPost = myPostController.allMyPosts[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Image.network(
                            "   viewMyPost.photo!",
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
                                      title: " viewMyPost.title!",
                                      size: 18,
                                      fontfamly: headline,
                                      color: const Color.fromARGB(
                                          255, 104, 101, 101),
                                      fw: FontWeight.bold),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      //  Get.to(createpost());
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: blue1,
                                    ),
                                  )
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
                                title: "viewMyPost.likes!.length Like",
                                size: 18,
                                fontfamly: headline,
                                fw: FontWeight.bold,
                                color: blue1,
                              ),
                              TextLines(
                                title: "viewMyPost.comments!.length comments",
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
                  }),
            );
  }
}
