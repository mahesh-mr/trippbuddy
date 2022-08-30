

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
      pagecontroller.nextPage(duration: 50.milliseconds, curve: Curves.ease);
    }
   
      
    
    
  }



  List<OnbordingModel> onbordingList = [
    OnbordingModel(
      assetImage: "assets/onb3.jpg",
      title: "Make your trip",
      discriptions:
          "Travel leaves you speechless then turn you into a storyteller",
    ),
    OnbordingModel(
      assetImage: "assets/onb4.jpg",
      title: "Add More Buddys",
      discriptions:
          "The world is a book and theos who do no travel read only a page",
    ),
    OnbordingModel(
      assetImage: "assets/onb5.jpg",
      title: "Discover the World",
      discriptions:
          "The journy of a thosend miles begins with a single step ",
    ),
  ];
}
