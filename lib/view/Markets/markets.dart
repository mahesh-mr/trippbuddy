import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trippbuddy/controller/controller/productcontroll.dart';
import 'package:trippbuddy/controller/service/Token/token.dart';
import 'package:trippbuddy/model/all_product.dart';
import 'package:trippbuddy/model/personalchat.dart';
import 'package:trippbuddy/view/Markets/add_product.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/core/font/font.dart';
import 'package:trippbuddy/view/widgets/text.dart';

class Markets extends StatelessWidget {
  Markets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductControll productControll = Get.put(ProductControll());
    String? userId = TokenStorage.getUserIdAndToken('uId');
    productControll.onInit();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddProduct());
        },
        backgroundColor: white1,
        child: const Icon(
          Icons.sell,
          color: blue1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          if (productControll.loding.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                           // centerTitle: true,
                            //  leadingWidth: 70,
                            toolbarHeight: 75,
                            elevation: 0,
                            backgroundColor: white1,
                            leadingWidth: 150,
                            leading: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.arrow_left,
                                    color: black1,
                                  ),
                                ),
                                //    SizedBox(width: 15,),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(allproduct.postedBy!.pic!),
                                  // radius: 10,
                                ),
                              ],
                            ),
                            title: TextLines(
                              title: allproduct.postedBy!.name!,
                              size: 20,
                              fontfamly: logbtn,
                              color: black1,
                              fw: FontWeight.bold,
                            ),
                            actions: [],
                          ),
                          body: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        5), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          5), // Image radius
                                      child: Image.network(allproduct.photo!,
                                          fit: BoxFit.fill,
                                          colorBlendMode: BlendMode.lighten),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextLines(
                                        title:
                                            "??? ${allproduct.price!}".toString(),
                                        size: 18,
                                        fw: FontWeight.bold),
                              allproduct.postedBy!.sId !=userId?      IconButton(
                                      onPressed: () {Get.to(PersonalChat());},
                                      icon: const Icon(
                                        CupertinoIcons.paperplane,
                                        color: blue1,
                                      ),
                                    ):   Icon(
                                        CupertinoIcons.paperplane,
                                        color: white1,
                                      ),
                                  
                          
                                  ],
                                ),
                              ),
                              Wrap(
                                children: [
                                  const Icon(
                                    CupertinoIcons.location_solid,
                                    color: blue2,
                                  ),
                                  TextLines(
                                      title: allproduct.location!,
                                      fw: FontWeight.bold,
                                      size: 17),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextLines(
                                  title: allproduct.title!,
                                  size: 18,
                                  fw: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Flexible(
                                    child: TextLines(
                                        title: allproduct.description!,
                                        size: 16)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: allProduct(allproduct),
              );
            },
            itemCount: productControll.allProducts!.length,
          );
        }),
      ),
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< AllProduct >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Card allProduct(Products allproduct) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(allproduct.photo!,
                fit: BoxFit.fill, colorBlendMode: BlendMode.lighten),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLines(
                    title: "??? ${allproduct.price!}".toString(),
                    fw: FontWeight.bold,
                    size: 18),
                //   TextLines(title:allproduct.createdAt! , size: 15)
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextLines(title: allproduct.title!, size: 18),
          )
        ],
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< single product >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Scaffold singleProduct(Products detaildProduct) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
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
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLines(
                    title: "??? ${detaildProduct.price!}".toString(),
                    size: 18,
                    fw: FontWeight.bold),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.paperplane,
                    color: blue1,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: blue2,
              ),
              TextLines(
                  title: detaildProduct.location!,
                  fw: FontWeight.bold,
                  size: 17),
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
