import 'package:get/get.dart';
import 'package:trippbuddy/model/post_model/post_model.dart';
import 'package:trippbuddy/service/post_service/post_service.dart';

class PostController extends GetxController {
  List<Posts>? allPosts;

  RxBool loding = true.obs;

  Future<List<Posts>?> getPost() async {
    try {
      var data = await PostClassService.getPostService();
      loding.value = false;
      print(data);
      print("111111111111111111111111");
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
    print("init state");
    getPost().then((value) => allPosts = value);
    super.onInit();
  }
}
