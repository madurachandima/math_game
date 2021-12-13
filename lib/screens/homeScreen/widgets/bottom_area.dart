import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:math_game/screens/homeScreen/controller/homeController.dart';
import 'package:math_game/screens/homeScreen/widgets/currect_answer_dialogbox.dart';
import 'package:math_game/screens/homeScreen/widgets/wrong_answer_dialogbox.dart';

class BottomArea extends StatelessWidget {
  const BottomArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contextHight = MediaQuery.of(context).size.height;
    var contextWidth = MediaQuery.of(context).size.width;
    HomeController _controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              Obx(() => ElevatedButton(
                  onPressed: () {
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[0]);
                    if (isAnswerTrue) {
                      _controller.incrimentScore();
                    } else {
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    _controller.timer.cancel();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,
                    child: Text(
                      _controller.numbers[0].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ))),
              Spacer(),
              Obx(() => ElevatedButton(
                  onPressed: () {
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[1]);
                    if (isAnswerTrue) {
                      _controller.incrimentScore();
                    } else {
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    _controller.timer.cancel();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: contextWidth / 6,
                    height: contextHight / 10,
                    child: Text(
                      _controller.numbers[1].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ))),
              Spacer(),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      var isAnswerTrue =
                          _controller.checkAnswer(_controller.numbers[2]);
                      if (isAnswerTrue) {
                        _controller.incrimentScore();
                      } else {
                        _controller.decrimentScore();
                      }

                      showDialog<String>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => isAnswerTrue
                            ? CurrectAnswerDialogBox()
                            : WrongAnswerDialogBox(),
                      );
                      _controller.timer.cancel();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: contextWidth / 6,
                        height: contextHight / 10,
                        child: Text(
                          _controller.numbers[2].toString(),
                          style: TextStyle(fontSize: 30),
                        )),
                  ))
            ],
          ),
        ),
        Row(
          children: [
            Obx(() => ElevatedButton(
                  onPressed: () {
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[3]);
                    if (isAnswerTrue) {
                      _controller.incrimentScore();
                    } else {
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    _controller.timer.cancel();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: contextWidth / 6,
                      height: contextHight / 10,
                      child: Text(
                        _controller.numbers[3].toString(),
                        style: TextStyle(fontSize: 30),
                      )),
                )),
            Spacer(),
            Obx(() => ElevatedButton(
                onPressed: () {
                  var isAnswerTrue =
                      _controller.checkAnswer(_controller.numbers[4]);
                  if (isAnswerTrue) {
                    _controller.incrimentScore();
                  } else {
                    _controller.decrimentScore();
                  }
                  showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => isAnswerTrue
                        ? CurrectAnswerDialogBox()
                        : WrongAnswerDialogBox(),
                  );
                  _controller.timer.cancel();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: contextWidth / 6,
                  height: contextHight / 10,
                  child: Text(
                    _controller.numbers[4].toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ))),
            Spacer(),
            Obx(() => ElevatedButton(
                  onPressed: () {
                    var isAnswerTrue =
                        _controller.checkAnswer(_controller.numbers[5]);
                    if (isAnswerTrue) {
                      _controller.incrimentScore();
                    } else {
                      _controller.decrimentScore();
                    }

                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => isAnswerTrue
                          ? CurrectAnswerDialogBox()
                          : WrongAnswerDialogBox(),
                    );
                    _controller.timer.cancel();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: contextWidth / 6,
                      height: contextHight / 10,
                      child: Text(
                        _controller.numbers[5].toString(),
                        style: TextStyle(fontSize: 30),
                      )),
                ))
          ],
        ),
      ],
    );
  }
}
