import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/search_chat_service.dart';
import 'package:trippbuddy/model/search_chat_model.dart';

class 




PostchatController extends GetxController{
RxList <SerchChat>  chats=<SerchChat> [].obs;


 RxBool isLoding = true.obs;
 findChats(String search)async{
  try {
    chats.value = (await SearchChatsService.searchChatService(search))!;
  isLoding.value= false;
     print("${search}========tyy");
return chats;
  } catch (e) {
      Get.snackbar('oopz', ' $e');
      print(e);
      print('catch bloc called');
      isLoding.value = false;

     
    }
  }

  // void onchangeSearchText(String value) {
  //   searchChat = value;
  //   update();
  // }
  // @override
  // void onInit() {
  //   findChats().then((value) => chats=value);
  //   super.onInit();
  // }
  
}