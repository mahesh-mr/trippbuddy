import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/recent_controller.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/personalchat.dart';

class PersonalChatService{
  static Future<List<PersonalChat>>getPersonalChat(String chatId)async{
    String? token = TokenStorage.getUserIdAndToken("token");
    RecentChatController recentChatController=  Get.find<RecentChatController>();
    try {
      var response= await DioClient.dio.get('/getmessages/$chatId',
      options: Options(headers: {"Authorization": "Bearer $token"}),
      );
     List <PersonalChat> personalChat= personalChatFromJson(jsonEncode(response.data));
     recentChatController.allRecentChats.value = (await recentChatController.getRecentChats())!;
    
      return personalChat;
    } on DioError catch (e) {
      print(e.message);
      print("000000000000000000");
      print(e.response?.data);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}