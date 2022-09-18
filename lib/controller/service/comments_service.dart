import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';

import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/model/comments.dart';
import 'package:trippbuddy/model/delete_cmt_model.dart';

class CommntService {
  static Future<Comments?> postComment(
      {required String postId, required String text}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    try {
      var response = await DioClient.dio.put(
        "/comment",
        data: {"postId": postId, "text": text},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      Comments comments = commentsFromJson(jsonEncode(response.data));
      print(response.data);
      print(text);
      postController.allPosts.value = (await postController.getPost())!;
      return comments;
    } on DioError catch (e) {
      print(e.response!.data);
      print(e.error);
      print(e.message);
    }
    return null;
  }

  static Future<DeleteCntModel?> deleteCmt(
      {required String postId, required String commentId}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PostController postController = Get.find<PostController>();
    try {
      var response = await DioClient.dio.delete(
        '/deletecomment/$postId/$commentId',
        data: {"postId": postId, "commentId": commentId},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      DeleteCntModel cntModel = deleteComentModelFromJson(
        jsonEncode(response.data),
      );
      print(response.data);
        postController.allPosts.value = (await postController.getPost())!;
      return cntModel;
    } on DioError catch (e) {
      print(e.response!.data);
      print(e.error);
      print(e.message);
    }
    return null;
  }
}
