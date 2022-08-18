

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/model/onbording_model/onbording_model.dart';
import 'package:trippbuddy/view/auth/login/log.dart';


class OnbordingController extends GetxController {
  var selectedIndex =0.obs;
   bool get isLastPage => selectedIndex.value==onbordingList.length-1;
  var pagecontroller = PageController();
 



  forwerdAction(){

    if (isLastPage) {
     Get.offAll(LogIn());
      
    } else {
      pagecontroller.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
   
      
    
    
  }



  List<OnbordingModel> onbordingList = [
    OnbordingModel(
      assetImage: "assets/onb3.jpg",
      title: "Make your trip",
      discriptions:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use",
    ),
    OnbordingModel(
      assetImage: "assets/onb4.jpg",
      title: "Make your trip",
      discriptions:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use",
    ),
    OnbordingModel(
      assetImage: "assets/onb5.jpg",
      title: "Make your trip",
      discriptions:
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use",
    ),
  ];
}
