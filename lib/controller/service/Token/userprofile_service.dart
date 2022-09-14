
import 'package:dio/dio.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';

class UserPostService {
   static Future<SingleUser?> getUserPostss(String uId) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.get(
    '/user/$uId'  ,   
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
SingleUser userPosts=SingleUser.fromJson(response.data);
   // userPostModel userpostmodel =userPostModel.fromJson(response.data);
      print(userPosts.user!.name);
      // print(userPost.name);
    return userPosts;
    } on DioError catch (e) {
      print("dioerrorrrrrrr=======================================================//////////////////");
      print(e.message);
      print(e.response!.data);
     //  return null;
    } catch (e) {
      print("chatch erorrrrrrrrrrr=======================================================//////////");
      print(e);
       return null;
     
    }
     return null;
  }
}