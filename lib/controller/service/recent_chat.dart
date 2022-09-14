import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trippbuddy/model/recentchat.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';

class RecentChatService {
  static Future<List<RecentChats>> getRcentChats() async {
    String? token = TokenStorage.getUserIdAndToken("token");

    try {
      var response = await DioClient.dio.get(
        "/fetchchat",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("my chats=======");

      List<RecentChats> recentChats =
          recentChatsFromJson(jsonEncode(response.data));
      print(recentChats);

      return recentChats;
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
