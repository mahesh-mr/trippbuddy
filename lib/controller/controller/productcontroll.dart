import 'package:get/get.dart';
import 'package:trippbuddy/model/all_product.dart';
import 'package:trippbuddy/controller/service/market_service.dart';

class ProductControll extends GetxController{
  RxList<Products>?allProducts=<Products>[].obs;

     RxBool loding =true.obs;
     Future<List<Products>?>getproductst()async{
      try {
          var data = await MarketService.getAllProduct();
           loding.value=false;
          print(data);
           print("11111111111111111111111111111111111111");
         return data!; 
     } catch (e) {
       Get.snackbar('oopz', ' $e');

       print(e);

       print('catch bloc called');

      loding.value = false;
      
    }
     }
     @override
  void onInit() {
    getproductst().then((value) => allProducts!=value);
    super.onInit();
  }

}