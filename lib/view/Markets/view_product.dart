// import 'package:flutter/material.dart';

// class ViewProduct extends StatelessWidget {
//   const ViewProduct({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//                             appBar: AppBar(
//                               leadingWidth: 70,
//                               toolbarHeight: 75,
//                               elevation: 0,
//                               backgroundColor: white1,
//                               leading: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 5),
//                                 child: CircleAvatar(
//                                   backgroundImage:
//                                       NetworkImage(allproduct.postedBy!.pic!),
//                                   radius: 1.0,
//                                 ),
//                               ),
//                               title: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 0),
//                                 child: TextLines(
//                                   title: allproduct.postedBy!.name!,
//                                   size: 20,
//                                   fontfamly: logbtn,
//                                   color: black1,
//                                   fw: FontWeight.bold,
//                                 ),
//                               ),
//                               actions: [
//                                 IconButton(
//                                   onPressed: () {
//                                     Get.back();
//                                   },
//                                   icon: const Icon(
//                                     CupertinoIcons.arrow_right,
//                                     color: black1,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             body: ListView(
//                               children: [
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 5),
//                                   child: Container(
//                                     height: 300,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(
//                                           5), // Image border
//                                       child: SizedBox.fromSize(
//                                         size: const Size.fromRadius(
//                                             5), // Image radius
//                                         child: Image.network(allproduct.photo!,
//                                             fit: BoxFit.fill,
//                                             colorBlendMode: BlendMode.lighten),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const Divider(
//                                   thickness: 2,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       TextLines(
//                                           title: "₹ ${allproduct.price!}"
//                                               .toString(),
//                                           size: 18,
//                                           fw: FontWeight.bold),
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: const Icon(
//                                           CupertinoIcons.paperplane,
//                                           color: blue1,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Wrap(
//                                   children: [
//                                     const Icon(
//                                       CupertinoIcons.location_solid,
//                                       color: blue2,
//                                     ),
//                                     TextLines(
//                                         title: allproduct.location!,
//                                         fw: FontWeight.bold,
//                                         size: 17),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: TextLines(
//                                     title: allproduct.title!,
//                                     size: 18,
//                                     fw: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: Flexible(
//                                       child: TextLines(
//                                           title: allproduct.description!,
//                                           size: 16)),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   child: allProduct(allproduct));
//             },
//             itemCount: productControll.allProducts!.length,
//           );
//         }),
//       ),
//     );
//   }
// }