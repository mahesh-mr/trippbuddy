import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/personal_post_model.dart';
import 'package:trippbuddy/model/search_chat_model.dart';

class SearchChatsService {
  static Future<List<SerchChat>?> searchChatService(String search) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.get(
        '/search-users-chat?search=$search',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      List<SerchChat> chat = serchChatFromJson(jsonEncode(response.data));
      print("${search}---------------------------------/////////");
      //print(response.data);
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

  static Future<PersonalModel?> postPersonal({required String userId}) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.post(
        '/personalchat',data: {"userId"
 
: userId,},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      PersonalModel personalmodel =
          personalModelFromJson(jsonEncode(response.data));
      print("post personal");
      return personalmodel;
    } on DioError catch (e) {
      print(e.message);
      print("000000000000000000");
      print(e.response?.data);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
