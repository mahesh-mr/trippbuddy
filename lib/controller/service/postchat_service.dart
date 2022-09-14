import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/personalchat.dart';
import 'package:trippbuddy/model/posatchat.dart';

class PostChatService{
  static Future <List<PersonalChat>>postChats({
    required String chatId,required String content})async{
    String? token =TokenStorage.getUserIdAndToken("token");

try {
  var response = await DioClient.dio.post('/sendmessage',data: {
    "chatId":chatId,
    "content":content
   
  },
  options: Options(headers:{"Authorization":"Bearer $token",},),);
List  <PersonalChat> postChat =personalChatFromJson(jsonEncode(response.data));
print("serviece test ok============================..");
  return postChat;
}on DioError catch (e) {
        print(e.response!.data);
        print("dio service errorr===================");
        print(e.error);
        print(e.message);
        print(e.response);
        return [];
      }catch(e){
        print(e);
         print("service errorr===================");
      }

return [];
  }
}