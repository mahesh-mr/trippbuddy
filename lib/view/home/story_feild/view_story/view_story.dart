import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';

class ViewStory extends StatelessWidget {
  const ViewStory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: white1,width: 10),
                      image: DecorationImage(
    
                          image: AssetImage(
                            "assets/pro2.jpg"
                          ),
                          fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ CircleAvatar(
                          radius: 35, backgroundImage: AssetImage('assets/2.jpg',),),
                          SizedBox(width: 10,),Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Abhi_Smokey",style: TextStyle(color: white1),),
                          )],
                          

                      ),
                    ),
      ),),
    );
  }
}