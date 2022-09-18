import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/follo_service.dart';
import 'package:trippbuddy/controller/service/serch_user_service.dart';
import 'package:trippbuddy/model/allbuddys.dart';
import 'package:trippbuddy/model/follow.dart';
import 'package:trippbuddy/model/search_user.dart';
import 'package:trippbuddy/model/userpost.dart';
import 'package:trippbuddy/controller/service/alluser_service.dart';

class AllUsercontroll extends GetxController {
  List<Users>? allUsers;
  RxBool isLoding = true.obs;
  Future<List<Users>> getUsers() async {
    try {
      var data = await AllUsersrService.getAllUsers();
      isLoding.value = false;
      print("${data}========tyy");
      return data;


    } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
      print('catch bloc called');
      isLoding.value = false;

      return [];
    }
  }

  
    Future <FollowModel?>putFollows({required String followId})async{
    try {
      var data = await FollowService.putFollow(followId: followId);
      print("${data}=====data follow controll");
    
      print(("follow controller======"),);
      return data;
   } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }


   Future <FollowModel?>putUnfollows({required String unfollowId})async{
    try {
      var data = await FollowService.putUnfollow(unfollowId: unfollowId);
      print("${data} dataaaasssss =======");
      print(("unfollow controller======"),);
      return data;
   } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }
Future <SearchUser?>postSearchUsers({required String qurey})async{
  try {
    var data= await SearchUserSerice.posrSearch(qurey: qurey);
    return data;
  } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
    }
  }


  @override
  void onInit() {
    getUsers().then((value) => allUsers = value);

 
    // TODO: implement onInit
    super.onInit();
  }
}
