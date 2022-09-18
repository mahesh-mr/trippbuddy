import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:trippbuddy/model/createpost.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/model/editpost.dart';
import 'package:trippbuddy/model/editpost_model.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class CreatePostService {
  static Future<List<NewCreatePost>> createPost(
      {required String title, required String avathar}) async {
    String? token = TokenStorage.getUserIdAndToken("token");

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
  }
