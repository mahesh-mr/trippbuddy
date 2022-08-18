import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/auth/login/log.dart';

class Auth {
  static Future<String> signUpMethod(
      {required String email,
      required String password,
      required String name,
      required String avatar}) async {
    print("11111111111111111111111111");
    try {
      print("222222222222222222222222");

      var response = await DioClient.dio.post("/register", data: {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
      });
      print("33333333333333333333333333333");
      print("Success");
      print(response.data);
      Get.to(LogIn());

      return "success";
    } on DioError catch (e) {
      print("Dio Error");

      print(e.error);

      print(e.response!.data);

      print(e.response!.statusMessage);

      if (e.type == DioErrorType.other) {
        print("no internet");
        return "no internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }
      return 'something went wrong';
    } catch (e) {
      print(e);
      return "";
    }
  }

  static loginMethod(
    String email,
    String password,
  ) async {
    try {
      print("777777");
      final response = await DioClient.dio.post("/login", data: {
        "email": email,
        "password": password,
      });
      print("Success");
      print(response.data);
      Get.snackbar("success", "login");
      Get.offAll(TabView());
      return "success";
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        print("no internet");
        return "No internet connection";
      }

      return "something";
    } catch (e) {
      print(e);
      return "";
    }
  }
}
