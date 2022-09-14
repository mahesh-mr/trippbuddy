import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/model/profile.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/profile/profile.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key, required this.myprofile}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  Myprofile myprofile;

  @override
  Widget build(BuildContext context) {
    MyProfileController myprofileciontroller = Get.find<MyProfileController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white1,
        elevation: 0,
        centerTitle: true,
        leading:IconButton(onPressed: (){
          Get.back();
        }, icon:   Icon(Icons.arrow_back,color: black1,))
       ,
        title: const Text("Edit Profile",style: TextStyle(color: black1),),
      ),
      body: Obx(() {
        Myprofile? userdata = myprofileciontroller.profile.value;
        if (userdata == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
            child: Column(
            //  crossAxisAlignment:  CrossAxisAlignment.end,
          //  mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                 CircleAvatar(
                      backgroundImage: NetworkImage(myprofile.userData!.pic!),
                      radius: 60,
                    ),SizedBox(height: 20,)
                    ,
                
                  
                  
                
                GetBuilder<MyProfileController>(initState: (state) {
                  nameController.text = myprofile.userData!.name!;
                }, builder: (controller) {
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Enter your name";
                            } else if (!RegExp(r'(^[a-z A-Z]+$)')
                                .hasMatch(value)) {
                              return 'Please enter a valid name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: white1,
                            filled: true,

                            //   label: Text( "User name"),
                            focusColor: red1,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        ElevatedButton(
                        //  style: ElevatedButton.styleFrom(maximumSize: Size(300, 40)),
                            onPressed: () {
                              bool? isValid = formKey.currentState!.validate();
                              print(isValid);
                              print("oldnameeeeeeeeeeeeeeeeeeeee");

                              if (isValid) {
                                final UserData userdata =
                                    UserData(name: nameController.text);
                                controller.updateUserData(myprofile);
                                controller.getMyProfiles();
                                print(myprofile);
                                print(myprofile.userData!.name);

                                // controller.

                              }
                            },
                            child: const Text("Updated"))
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
