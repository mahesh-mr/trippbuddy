// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trippbuddy/view/core/color/colors.dart';

class Online extends StatelessWidget {
  const Online({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     
        LimitedBox(
          maxHeight: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
          
            
              itemCount: 155,
              itemBuilder: (context, index) {
                return 
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Column(
                  children: [
                     Stack(
                       children: [
                         SizedBox(
                            height: 70,
                            width: 70,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10), // Image border
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(10), // Image radius
                                  child: Image.asset("assets/3.jpg",
                                      fit: BoxFit.cover,
                                   ),
                                ),),
                          ),
                          const Positioned(
                            top: 5,
                            right: 5,
                            child: CircleAvatar(
                        radius: 7,
                        backgroundColor: green1,
                      ), )
                       ],
                     ),
                      SizedBox(
                        width: 70,
                        height: 20,
                        child: const Text(
                          "Anandhu_smokey",maxLines: 1,overflow: TextOverflow.ellipsis,
                          
                        ),
                      ),


                  ],
                 ),
               );
                
                
                
                
               
              }),
        );
  
  }
}
