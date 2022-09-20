 
  import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/mypost_controller.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/editpost_model.dart';
import 'package:trippbuddy/view/profile/updatepost.dart';

class UpdatePostService{
 static Future<EditposttModel?>putPost({required String postId,required String title,
})async {
  String? token = TokenStorage.getUserIdAndToken("token");
   PostController postController = Get.find<PostController>();
   MyPostController myPostController = Get.find<MyPostController>();
  try {
    var response = await DioClient.dio.put('/updatepost',data:  {
      "postId":postId,"title":title,
    },options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      EditposttModel editposttModel =editposttModelFromJson(jsonEncode(response.data));
  print("edit called service");
      print(response.data);
        postController.allPosts.value = (await postController.getPost())!;
        myPostController.allMyPosts.value=(await myPostController.getallMyPosts())!;
      return editposttModel;
  } catch (e) {
  }
}
 
  }