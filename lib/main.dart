import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trippbuddy/view/Scereen_Home/tabview.dart';
import 'package:trippbuddy/view/add_friend/add_frofile/frofile_add.dart';
import 'package:trippbuddy/view/auth/login/log.dart';
import 'package:trippbuddy/view/auth/sign_up/sign_up.dart';

import 'package:trippbuddy/view/onbording/onbording.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: LogIn(),
    );
  }
}
