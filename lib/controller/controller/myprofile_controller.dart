// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/model/profile.dart';
import 'package:trippbuddy/controller/service/profile_service.dart';

class MyProfileController extends GetxController{
  Rx<Myprofile?> profile =Myprofile().obs;

  Future <Myprofile?> getMyProfiles()async{
   try {
    var data =await ProfileService.getMyProfileService();
    print(data);
    return data ;
   } catch (e) {
      Get.snackbar('oopz', ' $e');
     print(e);
      print('catch bloc called');

    }
    update();

    
  }
    Future<Myprofile?>updateUserData( {required String userId,required String name })async{
    try {
      var data =await ProfileService.updateUserProfile(userId: userId, name: name);
        print("called controller class $data");
        
  } catch (e) {
      print("Catch block called");
      print(e);
    }
    update();
  }





  @override
  void onInit() {
    ProfileService.getMyProfileService().then((value) {
      return profile.value=value;
    });
    print("init state called");
  //getMyProfiles().then((value) => userProfile = value);
   
    super.onInit();
  }


}