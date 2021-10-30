import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
