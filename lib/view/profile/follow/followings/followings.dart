import 'package:flutter/material.dart';

class FollowList extends StatelessWidget {
   FollowList({ Key? key,required this.length,required this.image,required this.title }) : super(key: key);
  int length;
  String image;
  String title;

  @override
  Widget build(BuildContext context) {
   return  ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          
            itemCount:length,
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
                          child: Image.network(image,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        )),
                  ),
                  title: Text(
                   title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                //  trailing: IconButton(onPressed: (){}, icon: Icon(
                //               CupertinoIcons.person_crop_circle_badge_plus,color: blue1,), )
                // )
               ) );
          }
          );
  }
}