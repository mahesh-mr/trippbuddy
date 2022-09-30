import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/myprofile_controller.dart';
import 'package:trippbuddy/model/myprofile_modrl.dart';
import 'package:trippbuddy/model/profile.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class ProfileService {
  static Future<Myprofile?>getMyProfileService()async{
     String? token = TokenStorage.getUserIdAndToken("token"); 
     try {
       var response = await DioClient.dio.get("/profile",
       options: Options(
        headers: {"Authorization": "Bearer $token"},
       ));
       Myprofile userProfile = Myprofile.fromJson(response.data);
          print(response.data);
          print(userProfile.userData!.email!);
          print("profileeeeeeeeeeeeeeeeeee");
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

  static  Future <Myprofile?>updateUserProfile({required String userId, required String name}
   
  )async {
       String? token = TokenStorage.getUserIdAndToken("token"); 
          String? userId = TokenStorage.getUserIdAndToken("uId"); 
          MyProfileController myProfileController =Get.find<MyProfileController>();
           PostController postController = Get.find<PostController>();


          try {
          
            var response =await DioClient.dio.put("/updateuser",data: {"userId":userId, "name":name}, options: Options(
        headers: {"Authorization": "Bearer $token"},

       ));
         myProfileController.profile.value=(await myProfileController.getMyProfiles())!;
         postController.allPosts.value=(await postController.getPost())!;
       Myprofile editmyprofile =myprofileFromJson(jsonEncode(response.data));

 Get.snackbar('Success', response.data['message'],
          backgroundColor: red1);

      print('tftftftdd' + response.statusMessage!);

      print('llllll' + editmyprofile.userData!.name.toString());
    
      return editmyprofile;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.statusMessage);
      Get.snackbar('Warning', e.response!.data['message'],
          backgroundColor: red1);
      return null;
    }
  }
}