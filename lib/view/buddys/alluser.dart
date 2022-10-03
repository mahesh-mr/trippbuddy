// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/allbuddys.dart';
import 'package:trippbuddy/view/buddys/singleuser.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class FrendsList extends StatelessWidget {
  FrendsList({
    Key? key,
  }) : super(key: key);

  AllUsercontroll allUsercontroller = Get.put(AllUsercontroll());
  TextEditingController searchController = TextEditingController();
  // UserPostcontroll userpostcontroller = Get.put(UserPostcontroll());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Obx(
            () {
              if (allUsercontroller.isLoding.value) {
                // ignore: prefer_const_constructors
                Center(
                  child: const CircularProgressIndicator(),
                );
              }
              // if (allUsercontroller.allUsers!.isEmpty) {
              //   const Center(
              //     child: const Text("data"),
              //   );
              // }
              return GetBuilder<AllUsercontroll>(builder: (controller) {
                print(controller.searchText);

                List<Users> seachedUsers = allUsercontroller.allUsers!
                    .where((element) => element.name!
                        .toLowerCase()
                        .contains(controller.searchText.toLowerCase()))
                    .toList();

                return Column(
                  // shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            controller.onchangeSearchText(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade600,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Builder(builder: (context) {
                      if (seachedUsers.isEmpty) {
                        return Center(
                          child: Text("No Data"),
                        );
                      }

                      return Expanded(
                        child: GridView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 4,
                                  mainAxisExtent: 200,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            String? userId =
                                TokenStorage.getUserIdAndToken("uId");
                            Users userDetails = seachedUsers[index];

                            String pic = seachedUsers[index].pic!;

                            return InkWell(
                              onTap: () {
                                print("62fd153b5d5abf8afde619c0====================mahesh mr");
                                bool followed = userDetails.followers!
                                    .any((element) => element.sId == userId);

                                print("${followed} dlfkklf");
                                print(userId);
                                print(userDetails.followers!.map((e) => e.sId));
                                Get.to(
                                  FriendProfile(
                                      id: index,
                                      userDetails: userDetails,
                                      followed: followed),
                                );
                              },
                              child: Container(
                                height: 200,
                                //  color: white1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          pic == "pic"
                                              ? "https://www.kindpng.com/picc/m/22-223863_no-avatar-png-circle-transparent-png.png"
                                              : pic,
                                        ),
                                        radius: 45,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        seachedUsers[index].name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            // );
                          },
                          itemCount: seachedUsers.length,
                        ),
                      );
                    }),
                  ],
                );
              });
            },
          )),
    );
  }
}
