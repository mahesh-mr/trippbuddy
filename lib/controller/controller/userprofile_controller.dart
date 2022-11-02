
import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/like_service.dart';
import 'package:trippbuddy/controller/service/userprofile_service.dart';
import 'package:trippbuddy/model/like.dart';
import 'package:trippbuddy/model/userpost.dart';


class UserPostcontroll extends GetxController {
  // RxList <UPost>userpost = <UPost>[].obs;
  Rx<Singleuser?> singleuser = Singleuser().obs;
  RxBool isLoding = true.obs;
  String userId;
  bool followed;
  //UserPosts? userPosts
  UserPostcontroll({required this.userId, required this.followed});
  Future<Singleuser?> getUsersposts() async {
    print("userid" + userId);
    try {
     // isLoding.value = true;
      var data = await UserPostService.getUserPostss(userId);
      isLoding.value = false;
      print(data!.user!.name!);
      singleuser.value = data;

      print("Length ");
      print(singleuser.value!.user!.followers!.length);
     return data ;
    } catch (e) {
      Get.snackbar('oopz', ' $e');

      print('post controller  $e');

      print('catch bloc called=======nopots');
      isLoding.value = false;
     
    }
  }

  Future<Like?> putLikes({required String postId}) async {
    try {
      var data = await LikeServise.putMyLike(postId: postId);
      // islike.value==true;
      print(data);
      print("liked-------------------");
      return data;
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }

  Future<Like?> putUnlikes({required String postId}) async {
    try {
      await LikeServise.putMyUnlike(postId: postId);
      // islike.value==false;

      print("unliked-------------------");
    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
    return null;
  }






  followAndUnfollow() {
    followed = !followed;
    update();
  }

  @override
  void onInit() {
    getUsersposts();

    super.onInit();
  }
}

// class UsrFloowers extends GetxController{
//   Rx<Follow?>follow = Follow().obs;
//     RxBool isLoding = true.obs;
//      String userId;
//   bool followed;

// UsrFloowers ({required this.userId,required this.followed});
// Future <Follow?>getuserFollow()async{
//   print("userid" + userId);
//   try {
//     var data = await 
//   } catch (e) {
//   }
// }



