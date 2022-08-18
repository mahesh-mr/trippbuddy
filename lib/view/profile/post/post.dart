import 'package:flutter/material.dart';
import 'package:trippbuddy/view/profile/post/view_post/view_post.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: GridView.builder(itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 2,
              mainAxisExtent: 100,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) {
          
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPost()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(5), // Image radius
                  child: Image.asset("assets/img5.jpg",
                      fit: BoxFit.cover, colorBlendMode: BlendMode.lighten),
                ),
              ),
            );
          }),
    );
  }
}
