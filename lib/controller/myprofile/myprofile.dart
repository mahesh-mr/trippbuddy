// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:trippbuddy/model/profile/profile.dart';
import 'package:trippbuddy/service/pofile/profile.dart';

class MyProfileController extends GetxController{
  UserProfile? userProfile;
  RxBool loding = true .obs;
  Future <UserProfile?> getMyProfiles()async{
   try {
    var data =await ProfileService.getMyProfileService();
    loding.value =false;
    print(data);
    return data ;
     
   } catch (e) {
      Get.snackbar('oopz', ' $e');

      print(e);

      print('catch bloc called');

      loding.value = false;
    }

    
  }
  @override
  void onInit() {
    print("init state called");
  getMyProfiles().then((value) => userProfile = value);
   
    super.onInit();
  }
}