import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
