import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:trippbuddy/model/profile/profile.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class ProfileService {
  static Future<UserProfile?>getMyProfileService()async{
     String? token = TokenStorage.getUserIdAndToken("token"); 
     try {
       var response = await DioClient.dio.get("/profile",
       options: Options(
        headers: {"Authorization": "Bearer $token"},

       ));
       UserProfile userProfile = userProfileFromJson(jsonEncode(response.data),
    
       );
          print(response.data);
          print(userProfile.userData!.name);

       return userProfile;

     }on DioError catch(e){
      print("6656566565656556565");
      print(e.response!.data);
      print(e.message);
     }
      catch (e) {
      print(e);

     }
    return null;


  }
}