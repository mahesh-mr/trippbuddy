
import 'package:dio/dio.dart';
import 'package:trippbuddy/model/mypost/mypost.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class MyPostService {
  static Future<List<Myposts>> getMyPosts() async {
    String? token = TokenStorage.getUserIdAndToken("token");
    try {
      var response = await DioClient.dio.get(
        "/mypost",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
   
    //  print("My posts");
    //   print(response.data['posts'][0]);
      MyPostModel myPostsModel = MyPostModel.fromJson(response.data);

      // print(myPostsModel.myposts!.map((e) => e.photo!));

      return myPostsModel.myposts!;
    } on DioError catch (e) {
      print(e.message);
      print(e.response?.data);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
