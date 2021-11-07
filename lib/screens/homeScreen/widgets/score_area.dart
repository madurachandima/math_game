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
              Text("Score : ${_homeController.score}",
                  style: TextStyle(fontSize: 20))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Obx(() => Text(
                  "Your best Scored : ${_homeController.playerDetailModel.value.playerScore != null ? _homeController.playerDetailModel.value.playerScore.toString() : 0}"))
            ],
          ),
        ),
        Obx(() => _homeController.bestPlayersList.length > 0
            ? Row(
                children: [
                  Text("Best Scored by : "),
                  Text(_homeController.bestPlayersList[0]['playerName']
                      .toString()),
                  Text(" : "),
                  Text(_homeController.bestPlayersList[0]['playerScore']
                      .toString())
                ],
              )
            : Container()),
      ],
    );
  }
}
