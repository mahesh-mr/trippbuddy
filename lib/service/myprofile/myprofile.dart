import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trippbuddy/model/profile/profile.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class ProfileService{
  static Future<List<UserData>?>getMyProfile()async{
    String? token =TokenStorage.getUserIdAndToken("token");
    try {
     var response = await DioClient.dio.get(
        "/allpost",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
ProfieDetails profieDetails =ProfieDetails.fromJson(response.data);
return profieDetails.userData;
  } on DioError catch (e) {
      print(e.message);
      print(e.response!.data);
      print(e.type);
      print(e);
    } catch (e) {
      print(e);
    }
  }
}