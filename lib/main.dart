import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/firstscreenController.dart';
import 'package:math_game/screens/firstScreen/first_screen.dart';
import 'package:math_game/screens/homeScreen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firstScreenController = Get.put(FirstScreenController());

    return GetMaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: Obx(
          () => firstScreenController.isNewUser.value ? FirstScreen() : Home()),
    );
  }
}
