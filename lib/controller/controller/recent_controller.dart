import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/model/recentchat.dart';
import 'package:trippbuddy/controller/service/recent_chat.dart';

class  RecentChatController extends GetxController{
  List<RecentChats>? allRecentChats;
   RxBool loding =true.obs;

   Future<List<RecentChats>?>getRecentChats()async{
    try {
      var chatData = await RecentChatService.getRcentChats();
       loding.value = false;
         print("${chatData} ===================================");
      print("111111111111111111111111");
      return chatData;
   }on DioError catch (e){
    print(e.response!.data);
    print(e.error);
    print(e.message);
   }
   
   
    catch (e) {
      Get.snackbar('oopz', ' $e');
     

      print(e);

      print('catch bloc called');

      loding.value = false;
    }
  }
  @override
  void onInit() {
   getRecentChats().then((value) => allRecentChats=value);
    super.onInit();
  }
}