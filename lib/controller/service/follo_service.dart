import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/follow.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';

class FollowService{
  static Future <FollowModel?>putFollow({required String followId})async{
     String? token = TokenStorage.getUserIdAndToken("token");
     try {
       var response =await DioClient.dio.put('/follow',data: {
        "followId":followId
       },options: Options(
        headers: {
           "Authorization": "Bearer $token",
        }
       )
       );
       FollowModel follow = followFromJson(jsonEncode(response.data));
       print("follow called=====");
       return follow;
     } on DioError catch (e) {
      print("follow dio error=========");
      print(e.response!.data);
      print(e.message);
    } catch (e) {
      print(e);
       print("follow errorrr===============");
    }
    return null;
  }
}