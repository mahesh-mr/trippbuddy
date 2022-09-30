import 'dart:async';

import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/createpost_service.dart';
import 'package:trippbuddy/controller/service/like_service.dart';
import 'package:trippbuddy/controller/service/updatepost.dart';
import 'package:trippbuddy/model/delete_post_model.dart';
import 'package:trippbuddy/model/editpost_model.dart';
import 'package:trippbuddy/model/like.dart';
import 'package:trippbuddy/model/mypost.dart';
import 'package:trippbuddy/controller/service/mypost_service.dart';


class MyPostController extends GetxController {
  RxList<Myposts> allMyPosts = <Myposts>[].obs;

  RxBool loding = true.obs;

  Future<List<Myposts>?> getallMyPosts() async {
    try {
      var data = await MyPostService.getMyPosts();
      loding.value = false;
      print("mypost1111111111111111111111111111");
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
    return null;
  }

  Future<EditposttModel?> editPost({
    required String postId,
    required String title,
  }) async {
    try {
      var data = await UpdatePostService.putPost(postId: postId, title: title);
      print("edit post controll-------------------");
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }

  @override
  void onInit() {
    print("init state called");
    getallMyPosts().then((value) => allMyPosts.value = value!);
    super.onInit();
  }
 Future<DeletePostModel?>deletePost({required String postId})async{
  try {
    await CreatePostService.deletePost(postId:postId );
    print("delete controll");
   } catch (e) {
      Get.snackbar("sorry", "$e");
    }
  }


 
}
