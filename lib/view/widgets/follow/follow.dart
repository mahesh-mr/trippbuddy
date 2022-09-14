// import 'package:flutter/material.dart';

// class Follow extends StatelessWidget {
//   Follow(
//       {Key? key,
//       required this.image,
//       this.trailing,
//       required this.title,
//       this.ontap})
//       : super(key: key);
//   String image;
//   String title;
//   Widget? trailing;
//   VoidCallback? ontap;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: 155,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 5),
//             child: ListTile(
//               onTap: ontap,
//               leading: SizedBox(
//                 height: 70,
//                 width: 70,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10), 
//                     child: SizedBox.fromSize(
//                       size: const Size.fromRadius(10), 
//                       child: Image.asset(image,
//                           fit: BoxFit.cover, colorBlendMode: BlendMode.lighten),
//                     )),
//               ),
//               title: Text(
//                 title,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               trailing: trailing,
//             ),
//           );
//         });
//   }
// }
