import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/search_chat_model.dart';

class SearchChatsService {
  static Future<List <SerchChat>?> SearchChatService(String query)async{
      String? token = TokenStorage.getUserIdAndToken("token");
      try {
        var response =  await DioClient.dio.get('/search-users-chat?search=$query',  options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      List<SerchChat> chat = serchChatFromJson(jsonEncode(response.data));
      return chat;
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