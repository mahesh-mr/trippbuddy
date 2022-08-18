import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late TextEditingController emailController;
 late TextEditingController passwerdController;
  var email ="";
  var passwerd = "";

  @override
  void onInit() {
   
   passwerdController =TextEditingController();
   emailController =TextEditingController();
    super.onInit();
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  void onReady() {
   emailController.dispose();
   passwerdController.dispose();
    super.onReady();
  }
  String? validateUserName(String Value){
    if (!GetUtils.isEmail(Value)) {
      return "provide UserName";
      
    } return null;
  }
   String? validatePasswerd(String Value){
    if (Value.length==6) {
      return "passwerd must 6 length";
      
    } return null;
  }
  checkLogin(){
    final isValid= formkey.currentState!.validate();
    if(isValid){
      return;
    }formkey.currentState!.save();
  }
}