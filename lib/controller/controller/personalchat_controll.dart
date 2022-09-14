import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/service/personalchat_service.dart';
import 'package:trippbuddy/controller/service/postchat_service.dart';
import 'package:trippbuddy/model/personalchat.dart';
import 'package:trippbuddy/model/posatchat.dart';

class PersonalChatController extends GetxController{
  //PersonalChat? personalchat;
  List<PersonalChat>? personalchats;
  RxBool isloding=true.obs;
  String postId;
  PersonalChatController({required this.postId});
  Future <List<PersonalChat>?>getPersonalchats()async{
    try {
     var data = await PersonalChatService.getPersonalChat(postId);
    isloding.value= false;
    return data;
}on DioError catch (e){
    print(e.response!.data);
    print(e.error);
    print(e.message);
   }
   
   
    catch (e) {
      Get.snackbar('oopz', ' $e');
     

      print(e);

      print('catch bloc called');

      isloding.value = false;
    }
  }
  Future <List<PostChat>?>postChat({
    required String chatId,required String content
  })async{
    try {
      await PostChatService.postChats(chatId: chatId, content: content);
      print("chattttwork=======");
      
      
     } on DioError catch(e){
      print(e.error);
      print(e.message);
      print(e);
        print("dio controll error===================");
     }
     
     
     catch (e) {
      print(e);
      print("controll error===================");
          Get.snackbar("sorry", "$e");
        }

      }



  @override
  void onInit() {
  getPersonalchats().then((value) => personalchats=value);
    super.onInit();
  }
}