import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/controller/productcontroll.dart';
import 'package:trippbuddy/controller/service/Token/dio_clint.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/posts_product.dart';

class CreateProductSevice {
  static Future<PostProduct?> postProduct({
    required String category,
    required String description,
    required String location,
    required String price,
    required String title,
    required String url,
  }) async {
    String? token = TokenStorage.getUserIdAndToken("token");
     ProductControll productControll = Get.find<ProductControll>();

    try {
      var respose = await DioClient.dio.post('/sellproduct', data: {
        "category": category,
        "description": description,
        "location": location,
        "price": price,
        "title": title,
        "url": url,
      },  options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      PostProduct postProduct =postProductFromJson(jsonEncode(respose.data));
    
    productControll.allProducts!.value = (await productControll.getproductst())!;
    productControll.update();
      return respose.data;
     } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      print(e.response!.statusMessage);
      if (e.type == DioErrorType.other) {
        return null;
      }
      if (e.response != null) {
        return e.response!.data['message'];
      }
      Get.showSnackbar(
        GetSnackBar(
          duration: Duration(seconds: 3),
          title: "Warning",
          message: e.response == null
              ? "something went wrong"
              : e.response!.data['error'],
        ),
      );
      return  null;
    } catch (e) {
      return null;
    }
  }
}
