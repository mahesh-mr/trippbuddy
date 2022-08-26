
 import 'package:dio/dio.dart';
import 'package:trippbuddy/model/userpost/userpost.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class UserPostService {

 
 
 
   static Future<List<UserPosts>> getUserPostss() async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.get(
        "/allusers",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      UserPost userPost = UserPost.fromJson(response.data);
      print(response.data);
      // print(allUsers.users);
      return userPost.posts!;
    } on DioError catch (e) {
      print(e.message);
      print(e.response!.data);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}