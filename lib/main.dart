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

    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: Splash());
        } else {
          // Loading is done, return the app:
          return GetMaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.amber,
                accentColor: Colors.red,
                brightness: Brightness.dark,
                primaryColor: Color(0xff303030),
                buttonTheme: ButtonThemeData(
                  buttonColor: Colors.amber,
                  disabledColor: Colors.grey,
                )),
            debugShowCheckedModeBanner: false,
            //*check this user already have accont or new user*//
            home: Obx(() =>
                firstScreenController.isNewUser.value ? FirstScreen() : Home()),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool lightMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: Color(0xff303030),
      //     lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
          child:
              //  lightMode
              //     ?
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Image.asset('assets/images/image_1.png'))
          // : Image.asset('assets/images/image_1.png')
          ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}
