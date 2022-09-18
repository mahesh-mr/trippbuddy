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
              if (allUsercontroller.allUsers!.isEmpty) {
                const Center(
                  child: const Text("data"),
                );
              }
              return ListView(
                children: [
                  GestureDetector(
                    onTap: (){
 
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 232, 227, 227),
                      ),child: Row(children: [
                        Icon(Icons.search),
                        SizedBox(width: 10,),
                        Text("Search...."),
                      ],),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 4,
                          mainAxisExtent: 200,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        String? userId = TokenStorage.getUserIdAndToken("uId");
                        Users userDetails = allUsercontroller.allUsers![index];
                        bool followed = userDetails.followers!
                            .any((element) => element == userId);
                        return InkWell(
                          onTap: () {
                                 bool followed = userDetails.followers!
                            .any((element) => element.sId == userId);
                            if (followed) {
                              print("follow");
                            } else {
                              print("unfollow");
                            }
                            print(userDetails.sId);
                            print(userDetails.name);
                            Get.to(
                              FriendProfile(
                                  id: index, userDetails: userDetails,followed: followed),
                            );
                          },
                          child: Container(
                            height: 200,
                            //  color: white1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Colors.blueAccent)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      allUsercontroller.allUsers![index].pic!,
                                    ),
                                    radius: 45,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    allUsercontroller.allUsers![index].name!,
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
                      itemCount: allUsercontroller.allUsers!.length,
                    ),
                  ),
                ],
              );
            },
          )),
    );

  }
}
// class CustomSearchDelegate extends SearchDelegate {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//   return [
//      IconButton(
//         color: Colors.white,
//         onPressed: () {
//           if (query.isEmpty) {
//             close(context, null);
//           } else {
//             query = '';
//           }
//         },
//         icon: const Icon(
//           Icons.clear,
//         ),
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//      return Column(
//       children: [
//         IconButton(
//           onPressed: () {
//             close(context, null);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//   return Center(
//       child: Text(
//         query,
//         style: const TextStyle(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
  
//     return Center(
//       child: Text(
//         query,
//         style: const TextStyle(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
