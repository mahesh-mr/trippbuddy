import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{



 String? imagePath;
 final ImagePicker imagePicker =ImagePicker();
Future picImage(ImageSource imageSource)async{
  XFile? image =await imagePicker.pickImage(source: imageSource);

  if(image == null) return;
   
  final imageTemporary = File(image.path);
  imagePath = imageTemporary.path;
  Get.back();
  update();
 
}

}