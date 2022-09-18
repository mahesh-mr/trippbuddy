import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/search_user.dart';

class SearchUserSerice{
static Future <SearchUser?>posrSearch({required String qurey})async{
   String? token = TokenStorage.getUserIdAndToken("token");
   try {
     var response = await DioClient.dio.post('/search-users',data: {
      "query":qurey,
     },options: Options(
        headers: {
           "Authorization": "Bearer $token",
        }
       )
       );
       SearchUser searchUser =searchUserFromJson(jsonEncode(response.data));
        print("${response.data}  --------search response");
        return searchUser;
  } on DioError catch (e) {
      print("search dio error=========");
      print(e.response!.data);
      print(e.message);
      
    } catch (e) {
      print(e);
       print("search errorrr===============");
    }
    return null;
  }
}