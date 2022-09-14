
import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/follo_service.dart';
import 'package:trippbuddy/model/follow.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/controller/service/Token/userprofile_service.dart';


class UserPostcontroll extends GetxController {
 // RxList <UPost>userpost = <UPost>[].obs;
  SingleUser? singleuser ;
  RxBool isLoding=true.obs;
String userId;
 //UserPosts? userPosts
  UserPostcontroll({required this.userId});
   Future<SingleUser?> getUsersposts() async {
    print("userid"+userId
    
    
    );
    try {
      var data = await UserPostService.getUserPostss(userId);
    isLoding.value = false;
      print(data!.user!.name!);

      return data ;
    } catch (e) {
      Get.snackbar('oopz', ' $e');
    
      print('post controller  $e');

      print('catch bloc called=======nopots');
isLoding.value = false;
      return null ;
    }
  }

  Future <FollowModel?>putFollows({required String followId})async{
    try {
      var data = await FollowService.putFollow(followId: followId);
      print(data);
      print(("follow controller======"),);
      return data;
   } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }



  @override
  void onInit() {
       getUsersposts() .then((value) => singleuser=value);
 
    super.onInit();
  }
}