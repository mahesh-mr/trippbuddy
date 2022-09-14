import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';

import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/model/comments.dart';



class CommntService{
  static  Future<Comments?>postComment({required String postId,required String title})async{
    String? token =TokenStorage.getUserIdAndToken("token");
      PostController postController = Get.find<PostController>();
      try {
        var response = await DioClient.dio.put("/comment",data:{
          "postId":postId,
          "title":title
        } ,
        options: Options(headers:{"Authorization":"Bearer $token",},),);
        Comments comments =commentsFromJson(jsonEncode(response.data));
        print(response.data);
        print(title);
      

        postController.allPosts.value= (await postController.getPost())!;
        return comments;
      }on DioError catch (e) {
        print(e.response!.data);
        print(e.error);
        print(e.message);
      }

return null;
  }
}