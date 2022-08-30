import 'package:get/get.dart';
import 'package:trippbuddy/model/like/like.dart';
import 'package:trippbuddy/service/like/like.dart';

class LikeController extends GetxController {
  Like? likes;

//  RxBool islike =false.obs;
  Future<Like?> putLikes({required String postId}) async {
    try {
      var data = await LikeServise.putMyLike(postId: "postId");
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
}
