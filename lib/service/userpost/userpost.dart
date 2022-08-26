// import 'package:dio/dio.dart';
// import 'package:trippbuddy/model/allbuddys/allbuddys.dart';
// import 'package:trippbuddy/model/post_model/post_model.dart';
// import 'package:trippbuddy/model/userpost/userpost.dart';
// import 'package:trippbuddy/service/Token/token.dart';
// import 'package:trippbuddy/service/dio/dio_clint.dart';

// class UserPostService{
//   static Future <List<UserPosts>>getUserPostService()async{
//     String? token = TokenStorage.getUserIdAndToken("token");
// try {
//   var response = await DioClient.dio.get("/allusers",
//     options: Options(
//       headers: {"Authorization": "Bearer $token"}
//     ),
//    );
//    UserPost  userPost =UserPost.fromJson(response.data);
//    print(response.data);
//    return userPost.posts!;
  
//  }on DioError catch (e) {
//   print(e.message);
//   print(e.response!.data);
//   return [];
//  }catch(e){
//     print(e);
//       return [];
//  }
//   }

// }