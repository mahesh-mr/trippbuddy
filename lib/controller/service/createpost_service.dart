import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/model/createpost.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';

import 'package:trippbuddy/model/delete_post_model.dart';



class CreatePostService {
  static Future<List<NewCreatePost>> createPost(
      {required String title, required String avathar}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
     PostController postController = Get.find<PostController>();
     MyPostController myPostController =Get.find<MyPostController>();
MyProfileController myProfileController = Get.find<MyProfileController>();

    try {
      var respose = await DioClient.dio.post(
        "/createpost",
        data: {
          "title": title,
          "avathar": avathar,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      List<NewCreatePost> createpost =
          newcreatePostFromJson(jsonEncode(respose.data));
           postController.allPosts.value = (await postController.getPost())!;
           postController.update();
           myPostController.allMyPosts.value = (await myPostController.getallMyPosts())!;
           myPostController.update();
           myProfileController.profile.value =(await myProfileController.getMyProfiles())!;

     //   myPostController.allMyPosts.value=(await myPostController.getallMyPosts())!;
      return createpost;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      print(e.response!.statusMessage);
      if (e.type == DioErrorType.other) {
        return [];
      }
      if (e.response != null) {
        return e.response!.data['message'];
      }
      Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 3),
          title: "Warning",
          message: e.response == null
              ? "something went wrong"
              : e.response!.data['error'],
        ),
      );
      return [];
    } catch (e) {
      return [];
    }
  }

  static Future<DeletePost?>deletePost({
    required String postId,
  }) async{

     String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    MyPostController myPostController =Get.find<MyPostController>();
    try {
      var response = await DioClient.dio.delete('/deletepost/$postId',data: {
        "posrId":postId
      },  options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      DeletePost deletePost = deletePostFromJson(jsonEncode(response.data));
      print(response.data);
        postController.allPosts.value = (await postController.getPost())!;
            myPostController.allMyPosts.value = (await myPostController.getallMyPosts())!;
           myPostController.update();
        return deletePost;
     } on DioError catch (e) {
      print(e.response!.data);
      print(e.error);
      print(e.message);
    }
    return null;
  }
  }
