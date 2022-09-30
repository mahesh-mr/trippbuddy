import 'package:flutter/material.dart';

class Follows extends StatelessWidget {
   Follows({ Key? key,required this.itemCount,required this.tilte,required this.url }) : super(key: key);
  int itemCount;
String url;
String tilte;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
          
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListTile(
                leading: SizedBox(
                  height: 70,
                  width: 70,
                  child: GestureDetector(
                    onTap: () {
                     
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(10),
                          child: Image.network(
                             url,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.lighten),
                        )),
                  ),
                ),
                title: Text(
                 tilte,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                //  trailing: trailing,
              ),
            );
          });
  }
}