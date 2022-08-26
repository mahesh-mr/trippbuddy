import 'package:dio/dio.dart';
import 'package:trippbuddy/model/allproduct/all_product.dart';
import 'package:trippbuddy/service/Token/token.dart';
import 'package:trippbuddy/service/dio/dio_clint.dart';

class MarketService {
  static  Future <List<Products>?>getAllProduct()async{
    String? token = TokenStorage.getUserIdAndToken("token"); 
try {
  var  response = await DioClient.dio.get("/allproducts",
    options: Options(
          headers: {
            "Authorization":
                "Bearer $token"
          },
        ),);
         AllProductModel productModel =AllProductModel.fromJson( response.data);
         return productModel.products;
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