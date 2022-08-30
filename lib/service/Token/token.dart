import 'package:get_storage/get_storage.dart';
import 'package:trippbuddy/model/recentChats/recentchat.dart';

class TokenStorage {
  static final storage = GetStorage();

  static saveToken(Map<String,String>user){
    storage.write("uId",user["uId"] );
    storage.write("token", user["token"]);
  } 

  static String? getUserIdAndToken(String key){
    String? user=storage.read<String?>(key);
    return user;

  }
//static String? getUserId(){}
// static String? remove(String key){
//   String? user= storage.read<String?>(key);
//   return user;
// }
static removed (String key){
  Future<void> user = storage.remove(key);
}
}