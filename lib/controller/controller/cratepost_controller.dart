import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trippbuddy/controller/controller/allpost_controller.dart';
import 'package:trippbuddy/controller/service/createpost_service.dart';
import 'package:trippbuddy/model/editpost_model.dart';

class CreatepostController extends GetxController{
  String? imagePath;
  EditposttModel? editpostmodel;
  final ImagePicker imagePicker = ImagePicker();
  Future picImage(ImageSource imageSource)async {
    XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image == null) return;
    final imageTemporary= File(image.path);
    imagePath =imageTemporary.path;
    Get.back();
    update();
    PostController postController = Get.find<PostController>();
     postController.update();
  }







}