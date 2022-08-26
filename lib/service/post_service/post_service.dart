import 'package:dio/dio.dart';
import 'package:trippbuddy/model/post_model/post_model.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class PostClassService {
  static Future<List<Posts>?> getPostService() async {
    String? token = TokenStorage.getUserIdAndToken("token"); 

    try {
      var response = await DioClient.dio.get(
        "/allpost",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      PostsModel postsModel = PostsModel.fromJson(response.data);

      return postsModel.posts;
    } on DioError catch (e) {
      print(e.message);
      print(e.response!.data);
      print(e.type);
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
