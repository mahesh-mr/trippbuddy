import 'package:get/get.dart';
import 'package:trippbuddy/model/post_model/post_model.dart';
import 'package:trippbuddy/service/post_service/post_service.dart';

import '../../model/like/like.dart';
import '../../service/like/like.dart';

class PostController extends GetxController {
  // List<Posts>? allPosts;
  RxList<Posts> allPosts = <Posts>[].obs;

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


  Future<Like?> putLikes({required String postId}) async {
    try {
      var data = await LikeServise.putMyLike(postId: postId);
      // islike.value==true;
      print(data);
      print("liked-------------------");
      return data;
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }

  Future<Like?> putUnlikes({required String postId}) async {
    try {
      await LikeServise.putMyUnlike(postId: postId);
      // islike.value==false;

      print("unliked-------------------");
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }

  @override
  void onInit() {
    print("init state");
    getPost().then((value) => allPosts.value = value!);
    super.onInit();
  }
}
