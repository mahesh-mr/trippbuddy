import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/like_service.dart';
import 'package:trippbuddy/model/post_model.dart';
import 'package:trippbuddy/controller/service/comments_service.dart';
import 'package:trippbuddy/controller/service/allpost_service.dart';

import '../../model/like.dart';


class PostController extends GetxController {
 
  RxList<Posts> allPosts = <Posts>[].obs;
  RxBool loding = true.obs;

  Future<List<Posts>?> getPost() async {
    try {
      var data = await PostClassService.getPostService();
      loding.value = false;
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
      print("unliked-------------------");
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }

  Future<Comments?> putMycomments(
      {required String postId, required String title})async {
        try {
          await CommntService.postComment(postId: postId, title: title);
        print("comments---------");
        
        } catch (e) {
          Get.snackbar("sorry", "$e");
        }

      }

  @override
  void onInit() {
    print("init state");
    getPost().then((value) => allPosts.value = value!);
    super.onInit();
  }
}
