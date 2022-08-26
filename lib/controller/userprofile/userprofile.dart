
import 'package:get/get.dart';
import 'package:trippbuddy/model/userpost/userpost.dart';
import 'package:trippbuddy/service/alluser/all_user.dart';
import 'package:trippbuddy/service/userprofile/userprofile.dart';

class UserPostcontroll extends GetxController {

  List<UserPosts>? userPosts;
  RxBool isLoding = true.obs;
   Future<List<UserPosts>> getUsersposts() async {
    try {
      var data = await UserPostService.getUserPostss();
      isLoding.value = false;
      print(data);
      return data;
    } catch (e) {
      Get.snackbar('oopz', ' $e');

      print(e);

      print('catch bloc called');

      isLoding.value = false;
      return [];
    }
  }
  @override
  void onInit() {
       getUsersposts().then((value) => userPosts=value);
 
    super.onInit();
  }
}