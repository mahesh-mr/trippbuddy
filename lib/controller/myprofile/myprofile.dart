import 'package:get/get.dart';
import 'package:trippbuddy/model/profile/profile.dart';
import 'package:trippbuddy/service/myprofile/myprofile.dart';

class MyProfileController extends GetxController{
  List <UserData>? userdetails;
  RxBool loding = true .obs;
  Future <List<UserData>?>getMyProfiles()async{
   try {
    var data =await ProfileService.getMyProfile();
    loding.value =false;
    print(data);
    return data!;
     
   } catch (e) {
      Get.snackbar('oopz', ' $e');

      print(e);

      print('catch bloc called');

      loding.value = false;
    }

    
  }
  @override
  void onInit() {
    getMyProfiles().then((value) => userdetails=value);
    // TODO: implement onInit
    super.onInit();
  }
}