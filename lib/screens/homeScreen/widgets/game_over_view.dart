import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';

class GameOverView extends StatelessWidget {
  const GameOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contextHight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    HomeController _controller = Get.find();
    return Container(
      height: contextHight - 150,
      width: contextWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Game Over",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "your time is finsh.",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            width: 200,
            height: 50,
            //playe aganin button
            child: ElevatedButton(
                //playe aganin button click event
                onPressed: () {
                  // call calculate function and start timer function
                  _controller.calculate();
                  _controller.startTimer();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Play Again ",
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
    );
  }
}
