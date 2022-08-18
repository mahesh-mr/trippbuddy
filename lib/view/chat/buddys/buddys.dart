
import 'package:flutter/material.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Buddys extends StatelessWidget {
  const Buddys({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ListView(
      shrinkWrap: true,
      children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextLines(title: "Add Buddys", size: 20, fontfamly: logbtn,fw: FontWeight.bold),
      ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          
            itemCount: 155,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListTile(
                  leading: SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(10), // Image radius
                          child: Image.asset("assets/3.jpg",
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        )),
                  ),
                  title: Text(
                    "Nihal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                //  trailing: IconButton(onPressed: (){}, icon: Icon(
                //               CupertinoIcons.person_crop_circle_badge_plus,color: blue1,), )
                // )
               ) );
          }
          )]);
  }
}