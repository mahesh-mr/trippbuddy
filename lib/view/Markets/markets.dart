import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/productControll/productcontroll.dart';
import 'package:trippbuddy/view/1_core/color/colors.dart';
import 'package:trippbuddy/view/Markets/product/product.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Markets extends StatelessWidget {
  Markets({Key? key}) : super(key: key);

  ProductControll productControll = Get.put(ProductControll());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      //   PostClassService.getPostService();

        },
        backgroundColor: white1,
        child:const Icon(
          Icons.sell,
          color: blue1,
        //  size: 45,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          if (productControll.loding.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 5,
                mainAxisExtent: 280,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              final allproduct = productControll.allProducts![index];
    
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleProduct(
                                  index: index,
                                )));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              ),
                          child: Image.network(allproduct.photo!,
                              fit: BoxFit.fill,
                              colorBlendMode: BlendMode.lighten),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextLines(
                                  title: "₹ ${allproduct.price!}".toString(),fw: FontWeight.bold,
                                  size: 18),
                              //   TextLines(title:allproduct.createdAt! , size: 15)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextLines(title: allproduct.title!, size: 18),
                        )
                      ],
                    ),
                  ));
            },
            itemCount: productControll.allProducts!.length,
          );
        }),
      ),
    );
  }
}
