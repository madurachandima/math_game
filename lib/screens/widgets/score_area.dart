import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/controller/homeController.dart';

class ScoreArea extends StatelessWidget {
  const ScoreArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Obx(() => Text(
                    "Time : ${_homeController.start.value} s",
                    style: TextStyle(
                        fontSize: 20,
                        color: _homeController.start.value > 5
                            ? Colors.black
                            : Colors.red),
                  )),
              Spacer(),
              Text("Score : 10", style: TextStyle(fontSize: 20))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [Text("Your best Scored : 200 ")],
          ),
        ),
        Row(
          children: [Text("Best Scored by : "), Text("Player Name 600")],
        ),
      ],
    );
  }
}
