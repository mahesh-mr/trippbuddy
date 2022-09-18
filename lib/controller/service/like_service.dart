import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/model/like.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';

class LikeServise {
  static Future<Like?> putMyLike({required String postId}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    try {
      var response = await DioClient.dio.put(
        "/like",
        data: {"postId": postId},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      Like like = likeFromJson(jsonEncode(response.data));
      print("called");
      print(response.data);

      postController.allPosts.value = (await postController.getPost())!;

      return like;
    } on DioError catch (e) {
      print("6656566565656556565");
      print(e.response!.data);
      print(e.message);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Like?> putMyUnlike({required String postId}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    MyPostController myPostController = Get.find<MyPostController>();
    try {
      var response = await DioClient.dio.put(
        "/unlike",
        data: {"postId": postId},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      // Like like = likeFromJson(jsonEncode(response.data));
      print(response.data);
      postController.allPosts.value = (await postController.getPost())!;
      myPostController.allMyPosts.value =(await myPostController.getallMyPosts())!;
      // return like;
    } on DioError catch (e) {
      print("6656566565656556565");
      print(e.response!.data);
      print(e.message);
    } catch (e) {
      print(e);
    }
    
  }




 static Future<Like?> putLike({required String postId}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    try {
      var response = await DioClient.dio.put(
        "/like",
        data: {"postId": postId},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      Like like = likeFromJson(jsonEncode(response.data));
      print("called");
      print(response.data);

      postController.allPosts.value = (await postController.getPost())!;

      return like;
    } on DioError catch (e) {
      print("6656566565656556565");
      print(e.response!.data);
      print(e.message);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Like?> putUnlike({required String postId}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    MyPostController myPostController = Get.find<MyPostController>();
    try {
      var response = await DioClient.dio.put(
        "/unlike",
        data: {"postId": postId},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      // Like like = likeFromJson(jsonEncode(response.data));
      print(response.data);
      postController.allPosts.value = (await postController.getPost())!;
      myPostController.allMyPosts.value =(await myPostController.getallMyPosts())!;
      // return like;
    } on DioError catch (e) {
      print("6656566565656556565");
      print(e.response!.data);
      print(e.message);
    } catch (e) {
      print(e);
    }
    
  }




}
