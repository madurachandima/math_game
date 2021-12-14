import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/screens/homeScreen/controller/homeController.dart';

class ViewArea extends StatelessWidget {
  const ViewArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contextHight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    HomeController controller = Get.find();
    return Container(
      height: contextHight / 2.1,
      width: contextWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Obx(() => Text(
                      // set first value to the Text
                      controller.uiValue1.value.toString(),
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Expanded(
                flex: 5,
                child: Obx(() => Text(
                      // set operater to the Text
                      controller.operater.value.toString(),
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              ),
              Expanded(
                flex: 5,
                child: Obx(() => Text(
                      // set second value to the Text
                      controller.uiValue2.value.toString(),
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
          Text(
            "=",
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Text(
            "?",
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
