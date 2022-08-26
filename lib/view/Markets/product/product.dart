import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/productControll/productcontroll.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/1_core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({Key? key,
   required this.index
   }) : super(key: key);
   int index;
  ProductControll productControll = Get.put(ProductControll());

  @override
  Widget build(BuildContext context) {
    final detaildProduct = productControll.allProducts![index];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        // toolbarHeight: 50,
        toolbarHeight: 75,
        elevation: 0,
        backgroundColor: white1,
        leading:

            //
            Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(detaildProduct.postedBy!.pic!),
            radius: 1.0,
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: TextLines(
            title: detaildProduct.postedBy!.name!,
            size: 20,
            fontfamly: logbtn,
            color: black1,
            fw: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.arrow_right,
              color: black1,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(5), // Image radius
                  child: Image.network(detaildProduct.photo!,
                      fit: BoxFit.fill, colorBlendMode: BlendMode.lighten),
                ),
              ),
            ),
          ),
          const Divider(thickness: 2,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLines(
                    title: "₹ ${detaildProduct.price!}".toString(),
                    size: 18,
                    fw: FontWeight.bold),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.paperplane,color: blue1,),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              const Icon(CupertinoIcons.location_solid, color: blue2,),
              TextLines(
                  title: detaildProduct.location!, fw: FontWeight.bold, size: 17),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextLines(
              title: detaildProduct.title!,
              size: 18,
              fw: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Flexible(
                child: TextLines(title: detaildProduct.description!, size: 16)),
          ),
        ],
      ),
    );
  }
}
