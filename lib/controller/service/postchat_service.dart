import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/personalchat_controll.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/posatchat.dart';

class PostChatService {
  static Future<PostChat?> postChats(
      {required String chatId, required String content}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    PersonalChatController chatController = Get.find<PersonalChatController>();
    chatController.onInit();

    try {
      var response = await DioClient.dio.post(
        '/sendmessage',
        data: {
          "chatId": chatId,
          "content": content,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      PostChat postChat = postChatFromJson(jsonEncode(response.data));
      print("serviece test ok============================..");
      chatController.personalchats.value = (await chatController.getPersonalchats())!;
      return postChat;
    } on DioError catch (e) {
      print("${e.response!.data}-------------------------");
      print("dio service errorr===================");
      print(e.error);
      print(e.message);
      print(e.response);
      return null;
    } catch (e) {
      print(e);
      print("service errorr===================");
    }

    return null;
  }
}
