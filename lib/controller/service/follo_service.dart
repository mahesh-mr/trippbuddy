import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/alluser_controller.dart';
import 'package:trippbuddy/controller/controller/userprofile_controller.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/follow.dart';


class FollowService{
  static Future <FollowModel?>putFollow({required String followId})async{
     String? token = TokenStorage.getUserIdAndToken("token");
     AllUsercontroll postcontroll = Get.find<AllUsercontroll>();
     try {
       var response =await DioClient.dio.put('/follow',data: {
        "followId":followId
       },options: Options(
        headers: {
           "Authorization": "Bearer $token",
        }
       )
       );
       print("${response.data}  ==== f response");
       FollowModel follow = followFromJson(jsonEncode(response.data));
       print("follow called controll=====");
        print("${response.data}  ====follopw response");
       
       postcontroll.allUsers =await postcontroll.getUsers();

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
   static Future <FollowModel?>putUnfollow({required String unfollowId})async{
     String? token = TokenStorage.getUserIdAndToken("token");
      AllUsercontroll postcontroll = Get.find<AllUsercontroll>();
     try {
       var response =await DioClient.dio.put('/unfollow',data: {
        "unfollowId":unfollowId
       },options: Options(
        headers: {
           "Authorization": "Bearer $token",
        }
       )
       );
         print("${response.data}  ====unfollow response");
      // FollowModel unfollow = followFromJson(jsonEncode(response.data));
       print("unfollow called=====");
       postcontroll.allUsers=await postcontroll.getUsers();
       print(response.data);
       
           print("${response.data}  ====unfollow response");

      // return  unfollow;
     } on DioError catch (e) {
      print("unfollow dio error=========");
      print(e.response!.data);
      print(e.message);
    } catch (e) {
      print(e);
       print("unfollow errorrr===============");
    }
    return null;
  }
}