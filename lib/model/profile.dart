

// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:trippbuddy/model/Dio/dio_client.dart';
// import 'package:trippbuddy/view/Scereen_Home/tabview.dart';

// class profile{

//  static  Future<String?> signUpMethod(
//       String email, String password, String name, String avatar) async {
//     try {
//  var response=   await DioClient.dio.post("/register/", data: {
//         "email": email,
//         "password": password,
//         "name": name,
//         "avatar": avatar,
//       });
//       print("ytyi");
//       print(response.data);
//       print("===============");
//       print(response);
     
//       Get.snackbar("", response.data['message']);
//        print(response.data);
   
//     } on DioError catch (e) {
//       Get.snackbar("sorry", e.error!.data['message']);
//         print( e.response!.data);
//         print(e.error);
//     } catch (e) {
//       print(e);
    
//     }return null;
   
//   }

//  static Future<String?> loginMethod(
//       String email, String password, BuildContext context) async {
//     try {
//   final  response=  await DioClient. dio.post("/login/", data: {
//         "email": email,
//         "password": password,
//       });
//        print(response.data);
//       Get.snackbar("Success", response.data["message"]);
//       Get.offAll (const TabView());
//     } on DioError catch (e) {
//       Get.snackbar("failed", e.response!.data['message']);
//     } catch (e) {
//       print(e);
//     }
    




//   }
// }