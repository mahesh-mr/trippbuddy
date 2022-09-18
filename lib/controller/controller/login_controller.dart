import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/controller/service/auth_service.dart';
import 'package:trippbuddy/model/singuip.dart';

class SignUpController extends GetxController{

SignupModel? model ;

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
Future <SignupModel?>resetPassword({
  required String oldPassword, required String newPassword, required String userId,
})async{
  try {
    var data = await Auth.UpdatePassword(oldPassword: oldPassword, newPassword: newPassword, userId: userId);
    print("update password controller");
  } catch (e) {
  }
}


}