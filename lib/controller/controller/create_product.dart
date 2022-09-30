import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/model/posts_product.dart';

class CreateProductControll extends GetxController {
  String? imagePath;
  PostProduct? postProduct;
  final ImagePicker imagePicker = ImagePicker();
  Future picImage(ImageSource imageSource)async{
    XFile? image = await imagePicker.pickImage(source: imageSource);
    if(image == null) return ;
    final imageTemporary =File( image.path);
    imagePath = imageTemporary .path;
    Get.back();
    update();
     CreateProductControll  createproduct = Get.find<CreateProductControll>();
     createproduct.update();
  }
  String? categoryValue;

  List<String>categoryItems = [
'car',
'Bags',
'Van',
'House',
'helmets',
'cloth',
  ];
  dropdownChanging(String value, String chekingvalue){
    if (chekingvalue =='category') {
      categoryValue=value;
    }
    update();
  }
 

}