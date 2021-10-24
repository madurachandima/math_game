import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/const/assetsPath.dart';
import 'package:math_game/controller/firstScreenController.dart';
import 'package:math_game/screens/home.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirstScreenController firstScreenController =
        Get.put(FirstScreenController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  loginImage,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  "Enter Your Name ",
                  style: TextStyle(fontSize: 25, color: Colors.black54),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
                child: TextField(),
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      //TODO save player data

                      Get.to(() => Home());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Press to Start ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 25,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
