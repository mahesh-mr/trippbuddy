import 'package:get/get.dart';
import 'package:trippbuddy/model/mypost/mypost.dart';
import 'package:trippbuddy/service/mypost/mypost.dart';

class MyPostController extends GetxController{
  List<Myposts> allMyPosts = [];
  
  RxBool loding = true.obs;

  Future<List<Myposts>>getallMyPosts()async{
    try {
    var data = await MyPostService.getMyPosts();
      loding.value = false;
      print(data);
      print("mypost1111111111111111111111111111");
      return data;
    } catch (e) {
      Get.snackbar('oopz', ' $e');

      print(e);

      print('catch bloc called');

      loding.value = false;
      return [];
    }
  }
  @override
  void onInit() {
    print("init state called");
   getallMyPosts().then((value) =>allMyPosts= value );
    super.onInit();
  }

}