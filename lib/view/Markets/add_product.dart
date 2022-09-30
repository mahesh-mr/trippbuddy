import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/controller/controller/create_product.dart';
import 'package:trippbuddy/controller/service/cerate_product.dart';
import 'package:trippbuddy/view/auth/widgets/textform.dart';
import 'package:trippbuddy/view/core/color/colors.dart';
import 'package:trippbuddy/view/widgets/image_picker.dart';
import 'package:trippbuddy/view/widgets/closeicon.dart';
import 'package:trippbuddy/view/widgets/text.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  final _fomkey = GlobalKey<FormState>();
  final _description = TextEditingController();
  final _location = TextEditingController();
  final _price = TextEditingController();
  final _title = TextEditingController();

  CreateProductControll createProductControll =
      Get.put(CreateProductControll());

  final cludinarypath = CloudinaryPublic(
    'djlb1ukew',
    'q1inzhhd',
    cache: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: white1,
        leading: const CloseIcon(),
        title: TextLines(
          title: "Add Product",
          size: 20,
          color: black1,
          fw: FontWeight.bold,
        ),
        actions: [
          GetBuilder<CreateProductControll>(builder: (controller) {
            return IconButton(
                onPressed: () async {
                  if (controller.imagePath == null) {
                    Get.snackbar("warning", "please add profile pic!");
                    return;
                  }
                  bool isValid = _fomkey.currentState!.validate();
                  if (isValid) {
                    try {
                      CloudinaryResponse response = await cludinarypath
                          .uploadFile(CloudinaryFile.fromFile(
                              createProductControll.imagePath!,
                              folder: "Avatar",
                              resourceType: CloudinaryResourceType.Image));
                      await CreateProductSevice.postProduct(
                          category: controller.categoryValue!,
                          description: _description.text,
                          location: _location.text,
                          price: _price.text,
                          title: _title.text,
                          url: response.secureUrl);

                      Navigator.pop(context);
                    } catch (e) {
                    (e);
                    }
                  }
                  _description.clear();
                    _title.clear();
                      _price.clear();
                        _location.clear();
                        
                          

                },
                icon: const Icon(
                  Icons.check,
                  color: blue1,
                ));
          })
        ],
      ),
      body: GetBuilder<CreateProductControll>(
          dispose: (_) {
            createProductControll.imagePath = null;
             _description.dispose();
                    _title.dispose();
                      _price.dispose();
                        _location.dispose();
                        createProductControll.categoryValue =null;
                        
                       

          },
          initState: (stete) {},
      //    init: CreateProductControll(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    controller.imagePath != null
                        ? Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: FileImage(
                                  File(
                                    controller.imagePath.toString(),
                                  ),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : SetImage(
                            camera: () {
                              controller.picImage(ImageSource.camera);
                            },
                            gallery: () {
                              controller.picImage(ImageSource.gallery);
                            },
                          ),
                          SizedBox(height: 10),
                    Form(
                        key: _fomkey,
                        child: Column(
                          children: [
                            titleField(),
                              SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dropdown(controller),

                                priceField(),
                              ],
                            ),
                               SizedBox(height: 10),

                            locationField(),
                               SizedBox(height: 10),

                            discriptionFeild(),
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }

 
  



  
//<<<<<<<<<<<<<<<<<<<<<< DISCRIPTION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  TextFormField discriptionFeild() {
    return TextFormField(
      maxLines: 8, //or null
      
    decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),hintText: "Discription",
       //   labelText: "Discription"
       ),
      controller: _description,
      
      validator: (value) {
        if (value!.isEmpty) {
          return "discription minimum  1 length";
        } else {
          return null;
        }
      },
    );
  }


//<<<<<<<<<<<<<<<<<<<<<< LOCATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  SizedBox locationField() {
    return SizedBox(
      height: 50,
      child: TextForm(
          controller: _location,
          title: "Location",
          validator: (value) {
            if (value!.isEmpty) {
              return "minimum  1 length";
            } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
              return 'Please enter a valid Location';
            } else {
              return null;
            }
          },
          type: TextInputType.text),
    );
  }

  
//<<<<<<<<<<<<<<<<<<<<<< PRICE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  SizedBox priceField() {
    return SizedBox(
        width: 145,
        height: 50,
        child: TextFormField(
          
     //  maxLines: 15,
            controller: _price,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Price",
            )));
  }


//<<<<<<<<<<<<<<<<<<<<<< TITLE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
 
 SizedBox titleField() {
    return SizedBox(
                            height: 50,
                            child: TextForm(
      controller: _title,
      title: "Title",
      validator: (value) {
        if (value!.isEmpty) {
          return "Title minimum  1 length";
        } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
          return 'Please enter a valid  Title';
        } else {
          return null;
        }
      },
      type: TextInputType.text),
                          );
  }

//<<<<<<<<<<<<<<<<<<<<<< DROPDOWN >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  Container dropdown(CreateProductControll controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: black1),
        borderRadius: BorderRadius.circular(10),
        color: white1,
      ),
      width: 145,
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              menuMaxHeight: 200,
              value: controller.categoryValue,
              hint: const Text(" category"),
              items: List.generate(
                controller.categoryItems.length,
                (index) => DropdownMenuItem(
                  value: controller.categoryItems[index],
                  child: Text(
                    controller.categoryItems[index],
                  ),
                ),
              ),
              onChanged: (String? newValue) {
                controller.dropdownChanging(newValue!, "category");
              })),
    );
  }
}
