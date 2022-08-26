import 'package:dio/dio.dart';
import 'package:trippbuddy/model/allbuddys/allbuddys.dart';
import 'package:trippbuddy/model/userpost/userpost.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class AllUsersrService {
  static Future<List<Users>> getAllUsers() async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.get(
        "/allusers",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      AllUsers allUsers = AllUsers.fromJson(response.data);
      print(response.data);
      // print(allUsers.users);
      return allUsers.users!;
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
