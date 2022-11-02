
// import 'package:dio/dio.dart';
// import 'package:trippbuddy/model/userpost.dart';
// import 'package:trippbuddy/controller/service/Token/token.dart';
// import 'package:trippbuddy/controller/service/Token/dio_clint.dart';

// class UserPostService {
//    static Future<Singleuser?> getUserPostss () async {
//     String? token = TokenStorage.getUserIdAndToken("token");
//     try {
//       var response = await DioClient.dio.get(
//     '/user/633be608e3c7a83c1833173f'  ,   
//         options: Options(headers: {"Authorization": "Bearer $token"}),
//       );
// Singleuser userPosts=Singleuser.fromJson(response.data);
//    // userPostModel userpostmodel =userPostModel.fromJson(response.data);
//       print(userPosts.user!.name);
//       // print(userPost.name);
//     return userPosts;
//     } on DioError catch (e) {
//       print("dioerrorrrrrrr=======================================================//////////////////");
//       print(e.message);
//       print(e.response!.data);
//      //  return null;
//     } catch (e) {
//       print("chatch erorrrrrrrrrrr=======================================================//////////");
//       print(e);
//        return null;
     
//     }
//      return null;
//   }
// }

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/model/1_singleuser1.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';

class UserPostService {
   static Future<Singleuser?> getUserPostss(String uId) async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.get(
    '/user/$uId'  ,   
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
Singleuser userPosts=Singleuser.fromJson(response.data);
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
// List urls =["/user/62fdb84655f9231730d4f189","/user/ 633d58dd71100672992095c8"
// ] ; 
class SingleUserCloneServ{
  static Future<Singleusers?>getSingle(String uId)async{
  String? token = TokenStorage.getUserIdAndToken("token");
  try {
    var response = await DioClient.dio.get("/user/$uId",options: Options(headers: {"Authorization": "Bearer $token"}),
      );Singleusers userPosts=Singleusers.fromJson(response.data);
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


class SingleUserCloneCont extends GetxController{
   Singleusers? singleuser;
   RxBool isLoding = true.obs;
   String userid;
   SingleUserCloneCont({required this.userid});
 Future<Singleusers?>  singkeconteoll()async{
try {
  var data =await SingleUserCloneServ.getSingle(userid);
 isLoding.value = false;
      print(data!.user!.name!);
    singleuser= 
    
      data;

     print("Length ");
      print(singleuser!.user!.followers!.length);
     return data ;
    } catch (e) {
      Get.snackbar('oopz', ' $e');

      print('post controller  $e');

      print('catch bloc called=======nopots');
      isLoding.value = false;
     
    }
  }

  @override
  void onInit() {
singkeconteoll();
    super.onInit();
  }

}