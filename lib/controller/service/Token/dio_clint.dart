 import 'package:dio/dio.dart';
class DioClient {
  static Dio dio =
      Dio(BaseOptions(baseUrl: "http://192.168.117.62:5000",));
}