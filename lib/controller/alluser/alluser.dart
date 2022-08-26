import 'package:get/get.dart';
import 'package:trippbuddy/model/allbuddys/allbuddys.dart';
import 'package:trippbuddy/model/userpost/userpost.dart';
import 'package:trippbuddy/service/alluser/all_user.dart';

class AllUsercontroll extends GetxController {
  List<Users>? allUsers;
  List<UserPosts>? userPosts;
  RxBool isLoding = true.obs;
  Future<List<Users>> getUsers() async {
    try {
      var data = await AllUsersrService.getAllUsers();
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
    getUsers().then((value) => allUsers = value);

 
    // TODO: implement onInit
    super.onInit();
  }
}
