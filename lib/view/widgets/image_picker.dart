import 'package:flutter/material.dart';

class SetImage extends StatelessWidget {
  SetImage({
    required this.camera,
    required this.gallery,
    Key? key,
  }) : super(key: key);
  VoidCallback camera;
  VoidCallback gallery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Select Choice',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(onPressed: camera, icon: const Icon(Icons.camera)),
                const Spacer(),
                IconButton(onPressed: gallery, icon: const Icon(Icons.photo)),
              ],
            );
          },
        );
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage(
                  "assets/imageplace.jpg",
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
