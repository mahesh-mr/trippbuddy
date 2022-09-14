// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/controller/userprofile_controller.dart';
import 'package:trippbuddy/model/allbuddys.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/buddys/singleuser.dart';

class FrendsList extends StatelessWidget {
  FrendsList({
    Key? key,
  }) : super(key: key);

  AllUsercontroll allUsercontroller = Get.put(AllUsercontroll());
 // UserPostcontroll userpostcontroller = Get.put(UserPostcontroll());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Padding(  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Obx((){
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
            return  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 4,
                mainAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) {
                Users userDetails = allUsercontroller.allUsers![index];
                  return 
                  InkWell(
                     onTap: () {
                      print(userDetails.sId);
                        print(userDetails.name);
                   Get.to(FriendProfile(
                        userDetails: userDetails),);
                    },
                    child: Container(
                      height: 200,
                    //  color: white1,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.blueAccent)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage:NetworkImage( allUsercontroller.allUsers![index].pic!,) ,
                              radius: 45,
                            ),
                         SizedBox(height: 20,),
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
            itemCount:
            allUsercontroller.allUsers!.length,
          );

        },
        )
       ) ,

    );








  //   return ExpansionTile(
  //     title: const Text('All Buddys'),
  //     children: [
  //       LimitedBox(
  //         maxHeight: 150,
  //         child: Obx(() {
  //           if (allUsercontroller.isLoding.value) {
  //             // ignore: prefer_const_constructors
  //             Center(
  //               child: const CircularProgressIndicator(),
  //             );
  //           }
  //           if (allUsercontroller.allUsers!.isEmpty) {
  //             const Center(
  //               child: const Text("data"),
  //             );
  //           }
  //           return ListView.builder(
  //          scrollDirection: Axis.horizontal,
  //             itemCount: allUsercontroller.allUsers!.length,
  //             itemBuilder: (context, int index) {
  //               Users userDetails = allUsercontroller.allUsers![index];
  //               return Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 5),
  //                 child: InkWell(
  //                   onTap: () {
  //                 Get.to(FriendProfile(
  //                       userDetails: userDetails),);
  //                   },
  //                   child: Container(
  //                     width: 150,
  //                     height: 150,
  //                     color: white1,
  //                     child: Column(
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.all(10.0),
  //                           child: Container(
  //                             width: 90,
  //                             height: 90,
  //                             child: Container(
  //                               decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //                                   fit: BoxFit.cover,
  //                                   image: NetworkImage(
  //                                     allUsercontroller.allUsers![index].pic!,
  //                                   ),
  //                                 ),
  //                                 borderRadius: BorderRadius.circular(15),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 90,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(left: 5),
  //                             child: Text(
  //                               allUsercontroller.allUsers![index].name!,
  //                               maxLines: 1,
  //                               overflow: TextOverflow.ellipsis,
  //                             ),
  //                           ),
  //                         ),
  //                         // SizedBox(
  //                         //   height: 10,
  //                         // ),
  //                         // LogButton(
  //                         //   onpressed: () {},
  //                         //   text_or_icon: Text(allUsercontroller.allUsers![index].following!.length.toString()),
  //                         //   size: Size(90, 30),
  //                         //   edgeInsets: EdgeInsets.zero,
  //                         // )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         }),
  //       )
  //     ],
  //   );
  // }),
  //       ),);
        
  }
}
