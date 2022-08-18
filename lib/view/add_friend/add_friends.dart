
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/add_friend/add_frofile/add_profile.dart';
import 'package:trippbuddy/view/add_friend/add_frofile/frofile_add.dart';
import 'package:trippbuddy/view/widgets/login_button.dart';
class AddFrendsList extends StatelessWidget {
  const  AddFrendsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Add Friend'),
      subtitle: Text('People you may know'),
      children: [
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () {
                      Get.to(FriendProfile());
                  },
                  child: Container(
                    width: 150,
                    height: 180,
                    color: white1,
                    child: Column(
                     
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // Image border
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(10), // Image radius
                                child: Image.asset("assets/2.jpg",
                                    fit: BoxFit.cover,
                                    colorBlendMode: BlendMode.lighten),
                              ),
                            ),
                          ),
                        ),
                
                        SizedBox(
                          width: 90,
                          child: Text(
                            "Vimal___Vml___",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                SizedBox(height: 10,),
                        LogButton(
                          onpressed: () {
                          
                          },
                          text_or_icon: Text("Connect"),
                          size: Size(90, 30),
                          edgeInsets: EdgeInsets.zero,
                        )
                       
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
     
    );
  }
}
