// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/model/singuip.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/view/auth/log.dart';

class Auth {
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<sign up>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  static Future<String> signUpMethod(
      {required String email,
      required String password,
      required String name,
      required String pic}) async {
    print("11111111111111111111111111");
    try {
      print("222222222222222222222222");
      var response = await DioClient.dio.post("/signup", data: {
        "email": email,
        "password": password,
        "name": name,
        "pic": pic,
      });
      print("33333333333333333333333333333");
      print("Success");
      print(response.data);
      Map<String, String> user = {
        "uId": response.data['user'],
        "token": response.data["token"],
      };
      TokenStorage.saveToken(user);
      print(response.data);
      return "success";
    } on DioError catch (e) {
      print(e.error);

      print(e.response!.data);

      print(e.response!.statusMessage);
      if (e.type == DioErrorType.other) {
        return "no internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }

      Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 3),
          title: "Warning",
          message: e.response == null
              ? "something went wrong"
              : e.response!.data['error'],
        ),
      );
      return 'something went wrong';
    } catch (e) {
      return "";
    }
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<sign up >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//

  static Future<String> loginMethod(
    String email,
    String password,
  ) async {
    try {
      final response = await DioClient.dio.post("/login", data: {
        "email": email,
        "password": password,
      });
      print(response.data['user']['_id']);

      Map<String, String> user = {
        "uId": response.data['user']["_id"],
        "token": response.data["token"],
      };
      String? token = TokenStorage.getUserIdAndToken("token");
      print(token);
      print(user);
      TokenStorage.saveToken(user);
      print(response.data);
      // Get.snackbar("success", "login");

      return "success";
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        return "No internet connection";
      }

      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 3),
          title: "Warning",
          message: e.response == null
              ? "something went wrong"
              : e.response!.data['error'],
        ),
      );

      return "something";
    } catch (e) {
      return "";
    }

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< update password>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  }

  static Future<SignupModel?>UpdatePassword({
    required String oldPassword,required String newPassword,required String userId 
  }
 
   
  )async {
       String? token = TokenStorage.getUserIdAndToken("token");
    try {
      final response = await DioClient.dio.put("/updatepassword ", 
      data:{
      "newPassword":newPassword,
      "oldPassword":oldPassword,"userId":userId,}
,      
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),);
        SignupModel signUser =signupFromJson(jsonEncode(response.data),);
    
     print(token);
    print("password changeeeeee");
      print(response.data);
    return response.data;
    //  return "success";
   } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
      //  return "No internet connection";
      }
      print("passssssssssssssssssssssssssss nottttttttttttt");
print(e.message);
print(e.response);
print(e.response!.data);
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 3),
          title: "Warning",
          message: e.response == null
              ? "something went wrong"
              : e.response!.data,
        ),
      );

     // return "something";
    } catch (e) {
    //  return "";
    }
  }
}
