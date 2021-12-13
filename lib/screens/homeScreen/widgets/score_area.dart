import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/config/color_config.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';

class ScoreArea extends StatelessWidget {
  const ScoreArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Obx(() => Text(
                    "Time : ${_homeController.start.value} s",
                    style: TextStyle(
                        fontSize: 20,
                        color: _homeController.start.value > 5
                            ? ColorConfig.buttonColorIndigo
                            : ColorConfig.appRed),
                  )),
              Spacer(),
              Column(
                children: [
                  Text("Score : ${_homeController.score}",
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                      "Your Best : ${_homeController.playerDetailModel.value.playerScore != null ? _homeController.playerDetailModel.value.playerScore.toString() : 0}"))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
